﻿//using QUANGHANH2.Models;
//using System;
//using System.Collections.Generic;
//using System.Data.Entity;
//using System.Data.SqlClient;
//using System.Linq;
//using System.Web;
//using System.Web.Mvc;

//namespace QUANGHANH2.Controllers.DK.InputCharcoal
//{
//    public class InputController : Controller
//    {
//        // GET: Input
//        public ActionResult Index()
//        {
//            return View();
//        }
//        [Route("phong-dieu-khien/nhap-lieu-san-xuat")]
//        public ActionResult InputCharcoal()
//        {
//            QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities();
//            int month = DateTime.Now.Month;
//            int year = DateTime.Now.Year;
//            //var ngaySX = db.header_KeHoachTungThang.Where(x => x.ThangKeHoach == month && x.NamKeHoach == year).Select(x => x.SoNgayLamViec).FirstOrDefault();
//            //ViewBag.SoNgaySX = ngaySX;
//            ViewBag.NgayNhap = DateTime.Today.ToString("dd/MM/yyyy");
//            var query = " select * from Department WHERE department_type in (@departmentType_1, @departmentType_2) order by department_name";
//            List<Department> listDepartments = db.Database.SqlQuery<Department>(query,
//                new SqlParameter("departmentType_1", "Phân xưởng sản xuất chính"),
//                new SqlParameter("departmentType_2", "Đơn vị sản xuất thuê ngoài")).ToList<Department>();
//            ViewBag.listDepartments = listDepartments;
//            var ngaySX = db.KeHoachTungThangs.Where(x => x.ThangKeHoach == month && x.NamKeHoach == year).Select(x => x.SoNgayLamViec).FirstOrDefault();
//            ViewBag.SoNgaySX = ngaySX;
//            string sqlchecknsx = @"select t.*
//                                from ThucHienTheoNgay t 
//                                where t.Ngay = @month";
//            ThucHienTheoNgay th = db.Database.SqlQuery<ThucHienTheoNgay>(sqlchecknsx, new SqlParameter("month", DateTime.Now.ToString("MM-dd-yyyy"))).FirstOrDefault();
//            if (th != null) ViewBag.NgaySX = th.NgaySanXuat;
//            else ViewBag.NgaySX = 0;
//            return View("/Views/DK/InputCharcoal/InputCharcoal.cshtml");
//        }

//        [Route("phong-dieu-khien/nhapnsx")]
//        [HttpPost]
//        public ActionResult AddNSX()
//        {
//            int nsx = Convert.ToInt32(Request["nsx"]);
//            string ngay = Request["ngay"];
//            string[] temp = ngay.Split('/');
//            ngay = temp[1] + "/" + temp[0] + "/" + temp[2];
//            using (QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities())
//            {
//                int thang = Convert.ToInt32(temp[1]);
//                int nam = Convert.ToInt32(temp[2]);
//                var ngaySX = db.KeHoachTungThangs.Where(x => x.ThangKeHoach == thang && x.NamKeHoach == nam).Select(x => x.SoNgayLamViec).FirstOrDefault();
//                string sql = "select case when Max(NgaySanXuat) is null then 0 else Max(NgaySanXuat) end as 'check' from ThucHienTheoNgay where year(Ngay) = @year and month(Ngay) = @month";
//                sql = "select * from ThucHienTheoNgay where Ngay = @day";
//                ThucHienTheoNgay checkadd = db.Database.SqlQuery<ThucHienTheoNgay>(sql, new SqlParameter("day", ngay)).FirstOrDefault();
//                if (checkadd != null)
//                {
//                    return Json(new { success = false, title = "Thêm không thành công", message = "Đã có ngày sản xuất." });
//                } else if(nsx <= 0 || nsx > ngaySX)
//                {
//                    return Json(new { success = false, title = "Thêm không thành công", message = "Ngày sản xuất phải trong khoảng 1 - " + ngaySX + "." });
//                }
//                using (DbContextTransaction transaction = db.Database.BeginTransaction())
//                {
//                    try
//                    {
//                        ThucHienTheoNgay kh = new ThucHienTheoNgay();
//                        kh.Ngay = DateTime.Parse(ngay);
//                        kh.NgaySanXuat = nsx;
//                        db.ThucHienTheoNgays.Add(kh);
//                        db.SaveChanges();
//                        transaction.Commit();
//                    }
//                    catch
//                    {
//                        transaction.Rollback();
//                    }
//                }
//            }
//            return Json(new { success = true, title = "Thành công", message = "Thêm kế hoạch tháng thành công." });
//        }

//        [Route("phong-dieu-khien/editnsx")]
//        [HttpPost]
//        public ActionResult EditNSX()
//        {
//            int nsx = Convert.ToInt32(Request["nsx"]);
//            string ngay = Request["ngay"];
//            string[] temp = ngay.Split('/');
//            ngay = temp[1] + "/" + temp[0] + "/" + temp[2];
//            using (QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities())
//            {
//                int thang = Convert.ToInt32(temp[1]);
//                int nam = Convert.ToInt32(temp[2]);
//                var ngaySX = db.KeHoachTungThangs.Where(x => x.ThangKeHoach == thang && x.NamKeHoach == nam).Select(x => x.SoNgayLamViec).FirstOrDefault();
//                string sql = "select case when Max(NgaySanXuat) is null then 0 else Max(NgaySanXuat) end as 'check' from ThucHienTheoNgay where year(Ngay) = @year and month(Ngay) = @month";
//                if (nsx <= 0 || nsx > ngaySX)
//                {
//                    return Json(new { success = false, title = "Thêm không thành công", message = "Ngày sản xuất phải trong khoảng 1 - " + ngaySX + "." });
//                }
//                using (DbContextTransaction transaction = db.Database.BeginTransaction())
//                {
//                    try
//                    {
//                        sql = "select * from ThucHienTheoNgay where Ngay = @date";
//                        ThucHienTheoNgay kh = db.Database.SqlQuery<ThucHienTheoNgay>(sql, new SqlParameter("date", ngay)).FirstOrDefault();
//                        kh.NgaySanXuat = nsx;
//                        db.Entry(kh).State = EntityState.Modified;
//                        db.SaveChanges();
//                        transaction.Commit();
//                    }
//                    catch
//                    {
//                        transaction.Rollback();
//                    }
//                }
//            }
//            return Json(new { success = true, title = "Thành công", message = "Chỉnh sửa ngày sản xuất thành công." });
//        }
//        public class LuyKe
//        {
//            public double LK { get; set; }
//        }
//        public class SanXuat
//        {
//            public string TenTieuChi { get; set; }
//            public double SanLuong { get; set; }
//            public double KeHoach { get; set; }
//            public double KHDC { get; set; }
//            public double LuyKe { get; set; }
//            public string GhiChu { get; set; }
//            public string DonViDo { get; set; }

//            public string chenhlech { get; set; }
//            public string percentDay { get; set; }
//            public string luyke_temp { get; set; }
//            public string percentMonth { get; set; }
//            public string tong { get; set; }
//            public string OneDay { get; set; }
//            public int NgaySanXuat { get; set; }

//        }
//        [Route("change")]
//        [HttpPost]
//        public JsonResult Change(string px_value, string ca_value, string date)
//        {
//            List<SanXuat> tcList = null;
//            QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities();
//            int month = DateTime.Now.Month;
//            int year = DateTime.Now.Year;
//            List<SanXuat> LK = null;
//            List<SanXuat> listSX = new List<SanXuat>();
//            List<SanXuat> listKH = new List<SanXuat>();
//            List<SanXuat> listKHDC = new List<SanXuat>();
//            int ca = 0;
//            if (!ca_value.Equals(""))
//            {
//                ca = Convert.ToInt32(ca_value);
//            }
//            int day = Convert.ToInt32(date.Split('/')[0]) > 1 ? Convert.ToInt32(date.Split('/')[0]) - 1 : 1;
//            string date_sql = date.Split('/')[1] + "/" + day + "/" + date.Split('/')[2];
//            string date_sql2 = date.Split('/')[1] + "/" + date.Split('/')[0] + "/" + date.Split('/')[2];
//            DateTime dateTime = Convert.ToDateTime(date_sql2);
//            try
//            {
//                if (!date.Equals(""))
//                {
//                    month = Convert.ToInt32(date.Split('/')[1]);
//                    year = Convert.ToInt32(date.Split('/')[2]);
//                    string sqltemp = @"select th.*, h.Ca, h.HeaderID, h.MaPhongBan
//                                    from ThucHienTheoNgay th join header_ThucHienTheoNgay h on th.NgayID = h.NgayID
//                                    where h.Ca = @ca and h.MaPhongBan = @px and th.Ngay = @date";
//                    List<header_ThucHienTheoNgay> checkList = db.Database.SqlQuery<header_ThucHienTheoNgay>(sqltemp, new SqlParameter("ca", ca), new SqlParameter("px", px_value), new SqlParameter("date", date_sql2)).ToList();
//                    List<header_KeHoach_TieuChi_TheoNgay> checkList2 = db.header_KeHoach_TieuChi_TheoNgay.Where(x => x.MaPhongBan == px_value && x.Ca == ca && x.NgayNhapKH == dateTime).ToList();
//                    sqltemp = @"select h.*
//                                from header_KeHoachTungThang h join KeHoachTungThang kh on h.ThangID = kh.ThangID
//                                where h.MaPhongBan = @px and kh.ThangKeHoach = @month and kh.NamKeHoach = @year";
//                    List<header_KeHoachTungThang> checkList3 = db.Database.SqlQuery<header_KeHoachTungThang>(sqltemp, new SqlParameter("px", px_value), new SqlParameter("month", month), new SqlParameter("year", year)).ToList();

//                    if (checkList.Count <= 0)
//                    {
//                        string tempquery = date.Split('/')[0] == "01" ? "" : "+ (case when d.SanLuong is null then 0 else d.SanLuong end)";
//                        string tempCa = date.Split('/')[0] == "01" ? " and h.Ca <= @ca" : "";
//                        string sql = @"select a.MaTieuChi, a.TenTieuChi,case when b.luyke is null then 0 else b.luyke " + tempquery + @" end 'LuyKe', a.DonViDo from 
//                                        (select pb.MaTieuChi, tc.TenTieuChi, tc.DonViDo from PhongBan_TieuChi pb left 
//                                        join TieuChi tc 
//                                        on pb.MaTieuChi = tc.MaTieuChi 
//                                        where pb.MaPhongBan = @px and pb.Thang = @thang and pb.Nam = @nam) as a 
//                                        left join( 
//                                        select a.MaPhongBan, a.MaTieuChi, sum(a.SanLuong) as 'luyke' 
//                                        from(select t.SanLuong, t.MaTieuChi, h.MaPhongBan 
//                                        from header_ThucHienTheoNgay h left 
//                                        join ThucHien_TieuChi_TheoNgay t 
//                                        on h.HeaderID = t.HeaderID 
//                                        join ThucHienTheoNgay ttt on h.NgayID = ttt.NgayID
//                                        where h.MaPhongBan = @px and ttt.Ngay between @start and @date " + tempCa + @") as a 
//                                        group by a.MaPhongBan,a.MaTieuChi) as b 
//                                        on a.MaTieuChi = b.MaTieuChi 
                                        
//										left outer join (select thDay.MaTieuChi, tht.NgaySanXuat, SUM(case when thDay.SanLuong is null then 0 else thDay.SanLuong end) as 'SanLuong' from header_ThucHienTheoNgay headTH
//                                        inner
//                                        join ThucHien_TieuChi_TheoNgay thDay
//                                        on headTH.HeaderID = thDay.HeaderID
//										join ThucHienTheoNgay tht on headTH.NgayID = tht.NgayID
//                                        where headTH.MaPhongBan = @px and tht.Ngay = @date2 and headTH.Ca <= @ca
//										group by thDay.MaTieuChi, tht.NgaySanXuat) as d on b.MaTieuChi = d.MaTieuChi

//                                        order by a.MaTieuChi ASC";
//                        listSX = db.Database.SqlQuery<SanXuat>(sql, new SqlParameter("px", px_value),
//                                                                    new SqlParameter("start", year + "-" + month + "-1"),
//                                                                    new SqlParameter("date", date_sql),
//                                                                    new SqlParameter("date2", date_sql2),
//                                                                    new SqlParameter("ca", ca),
//                                                                    new SqlParameter("thang", month),
//                                                                    new SqlParameter("nam", year)).ToList();
//                    }
//                    else
//                    {
//                        string tempquery = date.Split('/')[0] == "01" ? "" : "+ (case when d.SanLuong is null then 0 else d.SanLuong end)";
//                        string tempCa = date.Split('/')[0] == "01" ? " and h.Ca <= @ca" : "";
//                        string query = @"select c.MaTieuChi, case when a.GhiChu is null then '' else a.GhiChu end 'GhiChu',
//                                        case when a.NgaySanXuat is null then 0 else a.NgaySanXuat end 'NgaySanXuat', 
//                                        case when a.SanLuong is null then 0 else a.SanLuong end 'SanLuong', 
//                                        case when b.luyke is null then 0 else b.luyke " + tempquery + @" end 'LuyKe', c.DonViDo, c.TenTieuChi from
//                                        (select thDay.MaTieuChi, thDay.GhiChu, tht.NgaySanXuat, thDay.SanLuong from header_ThucHienTheoNgay headTH
//                                        inner
//                                        join ThucHien_TieuChi_TheoNgay thDay
//                                        on headTH.HeaderID = thDay.HeaderID
//										join ThucHienTheoNgay tht on headTH.NgayID = tht.NgayID
//                                        where headTH.MaPhongBan = @px and tht.Ngay = @date2 and headTH.Ca = @ca) as a
//                                        right join(
//                                        select a.MaPhongBan, a.MaTieuChi, sum(a.SanLuong) as 'luyke'
//                                        from(select t.SanLuong, t.MaTieuChi, h.MaPhongBan
//                                        from header_ThucHienTheoNgay h 

//                                        left join ThucHien_TieuChi_TheoNgay t
//                                        on h.HeaderID = t.HeaderID
//                                        left join ThucHienTheoNgay thtn 
//										on h.NgayID = thtn.NgayID 
//                                        where h.MaPhongBan = @px and thtn.Ngay between @start and @date " + tempCa + @") as a
//                                        group by a.MaPhongBan,a.MaTieuChi) as b
//                                        on a.MaTieuChi = b.MaTieuChi

//                                        right join (select pb.MaTieuChi, pb.MaPhongBan, tc.TenTieuChi, tc.DonViDo from PhongBan_TieuChi pb left join TieuChi tc on pb.MaTieuChi = tc.MaTieuChi
//                                        where pb.MaPhongBan = @px and pb.Thang = @thang and pb.Nam = @nam) as c
//                                        on b.MaTieuChi = c.MaTieuChi

//                                        left outer join (select thDay.MaTieuChi, tht.NgaySanXuat, SUM(case when thDay.SanLuong is null then 0 else thDay.SanLuong end) as 'SanLuong' from header_ThucHienTheoNgay headTH
//                                        inner
//                                        join ThucHien_TieuChi_TheoNgay thDay
//                                        on headTH.HeaderID = thDay.HeaderID
//										join ThucHienTheoNgay tht on headTH.NgayID = tht.NgayID
//                                        where headTH.MaPhongBan = @px and tht.Ngay = @date2 and headTH.Ca <= @ca
//										group by thDay.MaTieuChi, tht.NgaySanXuat) as d on b.MaTieuChi = d.MaTieuChi

//                                        order by a.MaTieuChi";
//                        listSX = db.Database.SqlQuery<SanXuat>(query, new SqlParameter("px", px_value),
//                                                                      new SqlParameter("start", year + "-" + month + "-1"),
//                                                                      new SqlParameter("date", date_sql),
//                                                                      new SqlParameter("date2", date_sql2),
//                                                                      new SqlParameter("ca", ca),
//                                                                      new SqlParameter("thang", month),
//                                                                      new SqlParameter("nam", year)).ToList();
//                    }
//                    if (checkList2.Count <= 0)
//                    {
//                        string sql = "select * from ( " +
//                            "select tc.TenTieuChi, tc.DonViDo, tc.MaTieuChi, pb.MaPhongBan " +
//                            "from PhongBan_TieuChi pb left join TieuChi tc " +
//                            "on pb.MaTieuChi = tc.MaTieuChi " +
//                            "where pb.MaPhongBan = @px and pb.Thang = @thang and pb.Nam = @nam) as a " +
//                            "left join(select * from header_KeHoach_TieuChi_TheoNgay khDay " +
//                            "where khDay.NgayNhapKH = @date) as b " +
//                            "on b.MaPhongBan = a.MaPhongBan " +
//                            "order by a.MaTieuChi";
//                        listKH = db.Database.SqlQuery<SanXuat>(sql, new SqlParameter("px", px_value),
//                                                                    new SqlParameter("date", date_sql2),
//                                                                    new SqlParameter("thang", month),
//                                                                    new SqlParameter("nam", year)).ToList();
//                    }
//                    else
//                    {
//                        string sql = "select a.*, khDay2.KeHoach, c.DonViDo, c.TenTieuChi from " +
//                                "(select headKH.HeaderID, headKH.MaPhongBan, Headkh.Ca, headKH.NgayNhapKH, khDay.MaTieuChi, MAX(khDay.ThoiGianNhapCuoiCung) as 'MaxDate' " +
//                                "from header_KeHoach_TieuChi_TheoNgay headKH " +
//                                "left " +
//                                "join KeHoach_TieuChi_TheoNgay khDay " +
//                                "on headKH.HeaderID = khDay.HeaderID " +
//                                "where headKH.MaPhongBan = @px  and headKH.Ca = @ca and headKH.NgayNhapKH = @date " +
//                                "group by headKH.HeaderID, headKH.MaPhongBan, Headkh.Ca, headKH.NgayNhapKH, khDay.MaTieuChi) as a " +
//                                "inner join KeHoach_TieuChi_TheoNgay khDay2 " +
//                                " on a.HeaderID = khDay2.HeaderID and a.MaxDate = khday2.ThoiGianNhapCuoiCung and a.MaTieuChi = khDay2.MaTieuChi  " +
//                                "inner join(select tc.TenTieuChi, tc.DonViDo, tc.MaTieuChi from PhongBan_TieuChi pb inner join TieuChi tc " +
//                                "on pb.MaTieuChi = tc.MaTieuChi " +
//                                "where pb.MaPhongBan = @px and pb.Thang = @thang and pb.Nam = @nam) as c " +
//                                "on c.MaTieuChi = a.MaTieuChi " +
//                                "order by a.MaTieuChi";
//                        listKH = db.Database.SqlQuery<SanXuat>(sql, new SqlParameter("px", px_value),
//                                                                      new SqlParameter("date", date_sql2),
//                                                                      new SqlParameter("ca", ca),
//                                                                      new SqlParameter("thang", month),
//                                                                      new SqlParameter("nam", year)).ToList();
//                    }
//                    if (checkList3.Count <= 0)
//                    {
//                        string sql = @"select pbtc.MaTieuChi, pbtc.DonViDo, pbtc.TenTieuChi, case when khdc.KHDC is null then 0 else khdc.KHDC end 'KHDC', 
//                                            case when khdc.SoNgayLamViec is null then 0 else khdc.SoNgayLamViec end 'SoNgayLamViec'  from
//                                            (select pb.MaTieuChi, pb.MaPhongBan, tc.DonViDo, tc.TenTieuChi from PhongBan_TieuChi pb left
//                                                                                                           join TieuChi tc on pb.MaTieuChi = tc.MaTieuChi
//                                            where pb.MaPhongBan = @px) as pbtc
//                                            left join(select a.MaTieuChi, a.ThangKeHoach, a.NamKeHoach, b.SanLuong as 'KHDC',a.SoNgayLamViec from(
//                                            select headKH.MaPhongBan, khtt.ThangKeHoach, khtt.NamKeHoach,
//                                            khtt.SoNgayLamViec, khMonth.MaTieuChi, MAX(khMonth.ThoiGianNhapCuoiCung) as 'MaxDate'
//                                            from header_KeHoachTungThang headKH
//                                            left
//                                            join KeHoach_TieuChi_TheoThang khMonth
//                                            on headKH.HeaderID = khMonth.HeaderID
//                                            join KeHoachTungThang khtt on khtt.ThangID = headKH.ThangID
//                                            where headKH.MaPhongBan = @px
//                                            and khtt.ThangKeHoach = @thang and khtt.NamKeHoach = @nam
//                                            group by headKH.MaPhongBan, khtt.ThangKeHoach, khtt.NamKeHoach,  
//                                            khtt.SoNgayLamViec, khMonth.MaTieuChi) as a
//                                            left join(select* from KeHoach_TieuChi_TheoThang khMonth
//                                            ) as b on a.MaTieuChi = b.MaTieuChi and a.MaxDate = b.ThoiGianNhapCuoiCung) as khdc
//                                            on pbtc.MaTieuChi = khdc.MaTieuChi";
//                        listKHDC = db.Database.SqlQuery<SanXuat>(sql, new SqlParameter("px", px_value),
//                                                                      new SqlParameter("thang", month),
//                                                                      new SqlParameter("nam", year)).ToList();
//                    }
//                    else
//                    {
//                        string sql = @"select pbtc.MaTieuChi, pbtc.DonViDo, pbtc.TenTieuChi, case when khdc.KHDC is null then 0 else khdc.KHDC end 'KHDC', 
//                                        case when khdc.SoNgayLamViec is null then 0 else khdc.SoNgayLamViec end 'SoNgayLamViec' from
//                                        (select pb.MaTieuChi, pb.MaPhongBan, tc.DonViDo, tc.TenTieuChi from PhongBan_TieuChi pb left
//                                                                                                       join TieuChi tc on pb.MaTieuChi = tc.MaTieuChi
//                                        where pb.MaPhongBan = @px) as pbtc
//                                        left join(select a.MaTieuChi, a.ThangKeHoach, a.NamKeHoach, b.SanLuong as 'KHDC',a.SoNgayLamViec from(
//                                        select headKH.MaPhongBan, khtt.ThangKeHoach, khtt.NamKeHoach,
//                                        khtt.SoNgayLamViec, khMonth.MaTieuChi, MAX(khMonth.ThoiGianNhapCuoiCung) as 'MaxDate'
//                                        from header_KeHoachTungThang headKH
//                                        left
//                                        join KeHoach_TieuChi_TheoThang khMonth
//                                        on headKH.HeaderID = khMonth.HeaderID
//                                        join KeHoachTungThang khtt on khtt.ThangID = headKH.ThangID
//                                        where headKH.MaPhongBan = @px
//                                        and khtt.ThangKeHoach = @thang and khtt.NamKeHoach = @nam
//                                        group by headKH.MaPhongBan, khtt.ThangKeHoach, khtt.NamKeHoach,  
//                                        khtt.SoNgayLamViec, khMonth.MaTieuChi) as a
//                                        left join(select* from KeHoach_TieuChi_TheoThang khMonth
//                                        ) as b on a.MaTieuChi = b.MaTieuChi and a.MaxDate = b.ThoiGianNhapCuoiCung) as khdc
//                                        on pbtc.MaTieuChi = khdc.MaTieuChi";
//                        listKHDC = db.Database.SqlQuery<SanXuat>(sql, new SqlParameter("px", px_value),
//                                                                      new SqlParameter("thang", month),
//                                                                      new SqlParameter("nam", year)).ToList();
//                    }

//                    for (int i = 0; i < listSX.Count; i++)
//                    {
//                        for (int j = 0; j < listKH.Count; j++)
//                        {
//                            if (listSX[i].TenTieuChi.Equals(listKH[j].TenTieuChi))
//                            {
//                                listSX[i].KeHoach = listKH[j].KeHoach;
//                                break;
//                            }
//                        }
//                        for (int k = 0; k < listKHDC.Count; k++)
//                        {
//                            if (listSX[i].TenTieuChi.Equals(listKHDC[k].TenTieuChi))
//                            {
//                                listSX[i].KHDC = listKHDC[k].KHDC;
//                                break;
//                            }
//                        }
//                        if (listSX[i].GhiChu == null || listSX[i].GhiChu.Equals("null"))
//                        {
//                            listSX[i].GhiChu = "";
//                        }
//                    }



//                }
//            }

//            catch (Exception e)
//            {
//                e.Message.ToString();
//                return Json(new { success = false, message = "Có lỗi xảy ra" }, JsonRequestBehavior.AllowGet);
//            }
//            string sqltmep = @"select *
//                                from ThucHienTheoNgay
//                                where Ngay = @date";
//            ThucHienTheoNgay thtt = db.Database.SqlQuery<ThucHienTheoNgay>(sqltmep, new SqlParameter("date", date_sql2)).FirstOrDefault();
//            string temp = "0";
//            if (thtt != null)
//            {
//                temp = thtt.NgaySanXuat.ToString();
//            }
//            var ngaySX = db.KeHoachTungThangs.Where(x => x.ThangKeHoach == month && x.NamKeHoach == year).Select(x => x.SoNgayLamViec).FirstOrDefault();
//            ViewBag.SoNgaySX = ngaySX;

//            if (listSX != null) ViewBag.dem = listSX.Count();
//            else ViewBag.dem = 0;
//            int ngay_SX_now = 0;
//            try
//            {
//                try
//                {
//                    ngay_SX_now = Convert.ToInt32(temp);


//                    foreach (var item in listSX)
//                    {
//                        item.chenhlech = (Math.Round(Convert.ToDouble(item.SanLuong) - Convert.ToDouble(item.KeHoach), 2)).ToString();
//                        if (Convert.ToDouble(item.KeHoach) == 0)
//                        {
//                            item.percentDay = 0 + "";
//                        }
//                        else
//                        {
//                            item.percentDay = (Math.Round(Convert.ToDouble(item.SanLuong) / Convert.ToDouble(item.KeHoach) * 100, 2)).ToString();
//                        }
//                        if (Convert.ToDouble(item.KHDC) == 0)
//                        {
//                            item.percentMonth = 0 + "";
//                        }
//                        else
//                        {
//                            item.percentMonth = (Math.Round(Convert.ToDouble(item.LuyKe) / Convert.ToDouble(item.KHDC) * 100, 2)).ToString();
//                        }
//                        item.luyke_temp = (Math.Round(Convert.ToDouble(item.LuyKe), 2)).ToString();
//                        item.tong = (Math.Round(Convert.ToDouble(item.KHDC) - Convert.ToDouble(item.luyke_temp), 2)).ToString();
//                        if (Convert.ToDouble(ngaySX - ngay_SX_now) <= 0)
//                        {
//                            item.OneDay = 0 + "";
//                        }
//                        else
//                        {
//                            item.OneDay = (Math.Round(Convert.ToDouble(item.tong) / Convert.ToDouble(ngaySX - ngay_SX_now), 2)).ToString();
//                        }
//                        item.LuyKe = (Math.Round(Convert.ToDouble(item.LuyKe) - Convert.ToDouble(item.SanLuong), 2));
//                    }
//                }
//                catch (Exception e)
//                {
//                    e.Message.ToString();
//                    return Json(new { success = false, message = "Tháng chưa có kế hoạch cho tiêu chí" }, JsonRequestBehavior.AllowGet);
//                }


//            }
//            catch (Exception e)
//            {
//                e.Message.ToString();
//            }
            
//            return Json(new
//            {
//                success = true,
//                list = tcList,
//                dateSX = ngaySX,
//                NgaySX = temp,
//                luyKe = LK,
//                listSXLoad = listSX,
//                ngaySXnow = ngay_SX_now,
//                thang = date.Split('/')[1],
//                ngay = date.Split('/')[0]
//            }, JsonRequestBehavior.AllowGet);
//        }
//        public class MaxKHDate : KeHoach_TieuChi_TheoThang
//        {
//            public DateTime Max { get; set; }
//        }
//        public class Save_TH : header_ThucHienTheoNgay
//        {
//            public int MaTieuChi { get; set; }
//        }

//        public JsonResult SaveChange(string ngaySX, string ngayNhap, string px_value, string ca_value, string[] tenTieuChi,
//            string[] thucHien, string[] keHoach, string[] KHDC, string[] ghiChu)
//        {
//            List<Save_TH> checkList = new List<Save_TH>();
//            List<int> tcList = new List<int>();
//            List<int> pbtcList = new List<int>();

//            QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities();
//            int ca = 0;
//            if (!ca_value.Equals(""))
//            {
//                ca = Convert.ToInt32(ca_value);
//            }
//            DateTime dateTime = Convert.ToDateTime(ngayNhap.Split('/')[1] + "/" + ngayNhap.Split('/')[0] + "/" + ngayNhap.Split('/')[2]);
//            string date_sql = ngayNhap.Split('/')[1] + "/" + ngayNhap.Split('/')[0] + "/" + ngayNhap.Split('/')[2];
//            int month = DateTime.Now.Month;
//            int year = DateTime.Now.Year;
//            using (DbContextTransaction dbct = db.Database.BeginTransaction())
//            {
//                try
//                {
//                    DateTime ngaySXFix = Convert.ToDateTime(ngayNhap.Split('/')[1] + "/" + ngayNhap.Split('/')[0] + "/" + ngayNhap.Split('/')[2]);
//                    List<TieuChi> list = db.TieuChis.ToList();
//                    int[] maTieuChi = new int[tenTieuChi.Length];

//                    ThucHien_TieuChi_TheoNgay thtctn = new ThucHien_TieuChi_TheoNgay();
//                    if (!ngayNhap.Equals(""))
//                    {
//                        month = Convert.ToInt32(ngayNhap.Split('/')[1]);
//                        year = Convert.ToInt32(ngayNhap.Split('/')[2]);
//                        string queryTH = @"select MaTieuChi from PhongBan_TieuChi where MaPhongBan = @maPhongBan and Nam = @year and Thang = @month
//                                    except
//                                    select th.MaTieuChi from header_ThucHienTheoNgay he 
//                                                                            left join ThucHien_TieuChi_TheoNgay th 
//                                                                            on he.HeaderID = th.HeaderID 
//																			left join ThucHienTheoNgay thtn
//																			on he.NgayID = thtn.NgayID
//																			where he.MaPhongBan = @maPhongBan 
//                                                                            and he.Ca = @ca and thtn.Ngay = @ngay";
//                        tcList = db.Database.SqlQuery<int>(queryTH, new SqlParameter("maPhongBan", px_value),
//                                                                                        new SqlParameter("ca", ca),
//                                                                                        new SqlParameter("year", year),
//                                                                                        new SqlParameter("month", month),
//                                                                                        new SqlParameter("ngay", ngaySXFix)).ToList();

//                        string queryChenhLech = @"select MaTieuChi from PhongBan_TieuChi where MaPhongBan = @maPhongBan and Nam = @year and Thang = @month";
//                        pbtcList = db.Database.SqlQuery<int>(queryChenhLech, new SqlParameter("year", year),
//                                                                                        new SqlParameter("month", month),
//                                                                                        new SqlParameter("maPhongBan", px_value)).ToList();
//                        List<header_KeHoach_TieuChi_TheoNgay> checkList2 = db.header_KeHoach_TieuChi_TheoNgay.Where(x => x.MaPhongBan == px_value && x.Ca == ca && x.NgayNhapKH == dateTime).ToList();
//                        int caSXConvert = Convert.ToInt32(ca_value);
//                        KeHoach_TieuChi_TheoThang khMonth = new KeHoach_TieuChi_TheoThang();

//                        string queryHeaderIDMonth = "select * from header_KeHoachTungThang a left join KeHoachTungThang b on a.ThangID = b.ThangID where MaPhongBan = @px and b.ThangID = @thangID";
//                        var PlanMonth = db.Database.SqlQuery<header_KeHoachTungThang>(queryHeaderIDMonth, new SqlParameter("px", px_value),
//                                                                           new SqlParameter("thangID", ngaySXFix.Month)).FirstOrDefault();
//                        if (PlanMonth == null)
//                        {
//                            //string query_fix = @"insert into KeHoachTungThang values (@thang, @nam, @ngayLamViec)";
//                            //db.Database.ExecuteSqlCommand(query_fix,new SqlParameter("thang", month),
//                            //                                    new SqlParameter("nam", year),
//                            //                                    new SqlParameter("ngayLamViec", ngaySX));
//                            var thangID = db.KeHoachTungThangs.Where(x => x.ThangKeHoach == month && x.NamKeHoach == year).Select(x => x.ThangID).FirstOrDefault();
//                            string query = @"insert into header_KeHoachTungThang values (@pb,@thangID)";
//                            db.Database.ExecuteSqlCommand(query, new SqlParameter("pb", px_value),
//                                                                 new SqlParameter("thangID", thangID));
//                            PlanMonth = db.Database.SqlQuery<header_KeHoachTungThang>(queryHeaderIDMonth, new SqlParameter("px", px_value),
//                                                                           new SqlParameter("thangID", thangID)).FirstOrDefault();
//                        }
//                        if (tcList.Count == 0)
//                        {
//                            string sqltemp = @"select h.*
//                                                from header_ThucHienTheoNgay h join ThucHienTheoNgay t on h.NgayID = t.NgayID
//                                                where h.MaPhongBan = @px and t.Ngay = @ngay and h.Ca = @ca";

//                            header_ThucHienTheoNgay headerIDDay = db.Database.SqlQuery<header_ThucHienTheoNgay>(sqltemp, new SqlParameter("px", px_value), new SqlParameter("ngay", ngaySXFix), new SqlParameter("ca", caSXConvert)).FirstOrDefault();

//                            string queryHeaderIDPlanDay = "select * from header_KeHoach_TieuChi_TheoNgay where MaPhongBan = @px and NgayNhapKH = @date and Ca = @ca ";
//                            var PlanDay = db.Database.SqlQuery<header_KeHoach_TieuChi_TheoNgay>(queryHeaderIDPlanDay, new SqlParameter("px", px_value),
//                                                                                new SqlParameter("date", ngaySXFix),
//                                                                                new SqlParameter("ca", caSXConvert)).FirstOrDefault();
//                            for (int i = 0; i < tenTieuChi.Length; i++)
//                            {
//                                foreach (var item in list)
//                                {
//                                    if (item.TenTieuChi.Equals(tenTieuChi[i]))
//                                    {
//                                        maTieuChi[i] = item.MaTieuChi;
//                                    }
//                                }
//                                if (ghiChu[i].Equals(""))
//                                {
//                                    ghiChu[i] = "null";
//                                }
//                                if (thucHien[i].Equals(""))
//                                {
//                                    thucHien[i] = "0";
//                                }
//                                if (keHoach[i].Equals(""))
//                                {
//                                    keHoach[i] = "0";
//                                }
//                                if (KHDC[i].Equals(""))
//                                {
//                                    KHDC[i] = "0";
//                                }

//                                string query = "update ThucHien_TieuChi_TheoNgay set SanLuong = @thucHien ,GhiChu = @ghiChu " +
//                                "  where HeaderID = @headerIDDay and MaTieuChi = @maTieuChi " +
//                                "  insert into KeHoach_TieuChi_TheoNgay (HeaderID, MaTieuChi, KeHoach, ThoiGianNhapCuoiCung) " +
//                                "  values( @headerIDPlanDay, @maTieuChi, @keHoach, GETDATE())  " +
//                                "  insert into KeHoach_TieuChi_TheoThang (HeaderID, MaTieuChi, SanLuong, ThoiGianNhapCuoiCung) " +
//                                "  values( @headerIDMonth, @maTieuChi, @KHDC, GETDATE())";
//                                db.Database.ExecuteSqlCommand(query, new SqlParameter("thucHien", thucHien[i]),
//                                                                     new SqlParameter("ghiChu", ghiChu[i]),
//                                                                     new SqlParameter("headerIDDay", headerIDDay.HeaderID),
//                                                                     new SqlParameter("maTieuChi", maTieuChi[i]),
//                                                                     new SqlParameter("headerIDPlanDay", PlanDay.HeaderID),
//                                                                     new SqlParameter("keHoach", keHoach[i]),
//                                                                     new SqlParameter("headerIDMonth", PlanMonth.HeaderID),
//                                                                     new SqlParameter("KHDC", KHDC[i]),
//                                                                     new SqlParameter("px", px_value),
//                                                                     new SqlParameter("ca", ca_value),
//                                                                     new SqlParameter("date", date_sql));
//                            }
//                            Console.WriteLine();
//                        }
//                        else if (tcList.Count == pbtcList.Count)
//                        {
//                            string queryKHDate = "insert into header_KeHoach_TieuChi_TheoNgay (MaPhongBan, Ca, NgayNhapKH) values(@px, @ca, @date)";
//                            db.Database.ExecuteSqlCommand(queryKHDate, new SqlParameter("px", px_value),
//                                                                       new SqlParameter("ca", ca_value),
//                                                                       new SqlParameter("date", ngaySXFix));

//                            string queryHeaderIDPlanDay = "select * from header_KeHoach_TieuChi_TheoNgay where MaPhongBan = @px and NgayNhapKH = @date and Ca = @ca ";
//                            var PlanDay = db.Database.SqlQuery<header_KeHoach_TieuChi_TheoNgay>(queryHeaderIDPlanDay, new SqlParameter("px", px_value),
//                                                                                new SqlParameter("date", ngaySXFix),
//                                                                                new SqlParameter("ca", caSXConvert)).FirstOrDefault();

//                            string queryNgayID = "select NgayID from ThucHienTheoNgay where Ngay = @ngaySXFix";
//                            int NgayID = db.Database.SqlQuery<int>(queryNgayID, new SqlParameter("ngaySXFix", ngaySXFix)).FirstOrDefault();
//                            string queryTHDay = "insert into header_ThucHienTheoNgay (MaPhongBan, NgayID, Ca) values(@px, @date, @ca)";
//                            db.Database.ExecuteSqlCommand(queryTHDay, new SqlParameter("px", px_value),
//                                                                                       new SqlParameter("date", NgayID),
//                                                                                       new SqlParameter("ca", ca_value));
//                            string sqltemp = @"select h.*
//                                                from header_ThucHienTheoNgay h join ThucHienTheoNgay t on h.NgayID = t.NgayID
//                                                where h.MaPhongBan = @px and t.Ngay = @ngay and h.Ca = @ca";
//                            header_ThucHienTheoNgay headerIDDay = db.Database.SqlQuery<header_ThucHienTheoNgay>(sqltemp, new SqlParameter("px", px_value), new SqlParameter("ngay", ngaySXFix), new SqlParameter("ca", caSXConvert)).FirstOrDefault();

//                            for (int i = 0; i < tenTieuChi.Length; i++)
//                            {
//                                foreach (var item in list)
//                                {
//                                    if (item.TenTieuChi.Equals(tenTieuChi[i]))
//                                    {
//                                        maTieuChi[i] = item.MaTieuChi;
//                                    }
//                                }
//                                if (ghiChu[i].Equals(""))
//                                {
//                                    ghiChu[i] = "null";
//                                }
//                                if (thucHien[i].Equals(""))
//                                {
//                                    thucHien[i] = "0";
//                                }
//                                if (keHoach[i].Equals(""))
//                                {
//                                    keHoach[i] = "0";
//                                }
//                                if (KHDC[i].Equals(""))
//                                {
//                                    KHDC[i] = "0";
//                                }
//                                string query = "insert ThucHien_TieuChi_TheoNgay (HeaderID, MaTieuChi, SanLuong, GhiChu) " +
//                               "  values ( @headerIDDay, @maTieuChi, @thucHien, @ghiChu) " +
//                               "  insert into KeHoach_TieuChi_TheoNgay (HeaderID, MaTieuChi, KeHoach, ThoiGianNhapCuoiCung) " +
//                               "  values( @headerIDPlanDay, @maTieuChi, @keHoach, GETDATE())  " +
//                               "  insert into KeHoach_TieuChi_TheoThang (HeaderID, MaTieuChi, SanLuong, ThoiGianNhapCuoiCung) " +
//                               "  values( @headerIDMonth, @maTieuChi, @KHDC, GETDATE())";
//                                db.Database.ExecuteSqlCommand(query, new SqlParameter("thucHien", thucHien[i]),
//                                                                     new SqlParameter("ghiChu", ghiChu[i]),
//                                                                     new SqlParameter("headerIDDay", headerIDDay.HeaderID),
//                                                                     new SqlParameter("maTieuChi", maTieuChi[i]),
//                                                                     new SqlParameter("headerIDPlanDay", PlanDay.HeaderID),
//                                                                     new SqlParameter("keHoach", keHoach[i]),
//                                                                     new SqlParameter("headerIDMonth", PlanMonth.HeaderID),
//                                                                     new SqlParameter("KHDC", KHDC[i]));
//                            }
//                        }
//                        else if (tcList.Count > 0 && tcList.Count < pbtcList.Count)
//                        {

//                            string queryHeaderIDPlanDay = "select * from header_KeHoach_TieuChi_TheoNgay where MaPhongBan = @px and NgayNhapKH = @date and Ca = @ca ";
//                            var PlanDay = db.Database.SqlQuery<header_KeHoach_TieuChi_TheoNgay>(queryHeaderIDPlanDay, new SqlParameter("px", px_value),
//                                                                                new SqlParameter("date", ngaySXFix),
//                                                                                new SqlParameter("ca", caSXConvert)).FirstOrDefault();

//                            string sqltemp = @"select h.*
//                                                from header_ThucHienTheoNgay h join ThucHienTheoNgay t on h.NgayID = t.NgayID
//                                                where h.MaPhongBan = @px and t.Ngay = @ngay and h.Ca = @ca";
//                            header_ThucHienTheoNgay headerIDDay = db.Database.SqlQuery<header_ThucHienTheoNgay>(sqltemp, new SqlParameter("px", px_value), new SqlParameter("ngay", ngaySXFix), new SqlParameter("ca", caSXConvert)).FirstOrDefault();

//                            for (int i = 0; i < tenTieuChi.Length; i++)
//                            {
//                                foreach (var item in list)
//                                {
//                                    if (item.TenTieuChi.Equals(tenTieuChi[i]))
//                                    {
//                                        maTieuChi[i] = item.MaTieuChi;
//                                    }
//                                }
//                            }
//                            for (int i = 0; i < maTieuChi.Length; i++)
//                            {
//                                bool flag = true;
//                                for (int j = 0; j < tcList.Count; j++)
//                                {
//                                    if (maTieuChi[i] == tcList[j])
//                                    {
//                                        string query = "insert ThucHien_TieuChi_TheoNgay (HeaderID, MaTieuChi, SanLuong, GhiChu) " +
//                                       "  values ( @headerIDDay, @maTieuChi, @thucHien, @ghiChu) " +
//                                       "  insert into KeHoach_TieuChi_TheoNgay (HeaderID, MaTieuChi, KeHoach, ThoiGianNhapCuoiCung) " +
//                                       "  values( @headerIDPlanDay, @maTieuChi, @keHoach, GETDATE())  " +
//                                       "  insert into KeHoach_TieuChi_TheoThang (HeaderID, MaTieuChi, SanLuong, ThoiGianNhapCuoiCung) " +
//                                       "  values( @headerIDMonth, @maTieuChi, @KHDC, GETDATE())";
//                                        db.Database.ExecuteSqlCommand(query, new SqlParameter("thucHien", thucHien[i]),
//                                                                             new SqlParameter("ghiChu", ghiChu[i]),
//                                                                             new SqlParameter("headerIDDay", headerIDDay.HeaderID),
//                                                                             new SqlParameter("maTieuChi", maTieuChi[i]),
//                                                                             new SqlParameter("headerIDPlanDay", PlanDay.HeaderID),
//                                                                             new SqlParameter("keHoach", keHoach[i]),
//                                                                             new SqlParameter("headerIDMonth", PlanMonth.HeaderID),
//                                                                             new SqlParameter("KHDC", KHDC[i]));
//                                        tcList.RemoveAt(j);
//                                        flag = false;
//                                        break;
//                                    }
//                                }
//                                if (flag)
//                                {
//                                    string query = "update ThucHien_TieuChi_TheoNgay set SanLuong = @thucHien ,GhiChu = @ghiChu " +
//                                "  where HeaderID = @headerIDDay and MaTieuChi = @maTieuChi " +
//                                "  insert into KeHoach_TieuChi_TheoNgay (HeaderID, MaTieuChi, KeHoach, ThoiGianNhapCuoiCung) " +
//                                "  values( @headerIDPlanDay, @maTieuChi, @keHoach, GETDATE())  " +
//                                "  insert into KeHoach_TieuChi_TheoThang (HeaderID, MaTieuChi, SanLuong, ThoiGianNhapCuoiCung) " +
//                                "  values( @headerIDMonth, @maTieuChi, @KHDC, GETDATE())";
//                                    db.Database.ExecuteSqlCommand(query, new SqlParameter("thucHien", thucHien[i]),
//                                                                         new SqlParameter("ghiChu", ghiChu[i]),
//                                                                         new SqlParameter("headerIDDay", headerIDDay.HeaderID),
//                                                                         new SqlParameter("maTieuChi", maTieuChi[i]),
//                                                                         new SqlParameter("headerIDPlanDay", PlanDay.HeaderID),
//                                                                         new SqlParameter("keHoach", keHoach[i]),
//                                                                         new SqlParameter("headerIDMonth", PlanMonth.HeaderID),
//                                                                         new SqlParameter("KHDC", KHDC[i]),
//                                                                         new SqlParameter("px", px_value),
//                                                                         new SqlParameter("ca", ca_value),
//                                                                         new SqlParameter("date", date_sql));
//                                }

//                            }

//                        }
//                        else
//                        {
//                            return Json(new { success = "dataSuck" }, JsonRequestBehavior.AllowGet);
//                        }
//                    }
//                    dbct.Commit();
//                }
//                catch (Exception e)
//                {
//                    e.Message.ToString();
//                    dbct.Rollback();
//                    return Json(new { success = false }, JsonRequestBehavior.AllowGet);

//                }
//            }
//            return Json(new { success = true }, JsonRequestBehavior.AllowGet);
//        }
//    }
//}