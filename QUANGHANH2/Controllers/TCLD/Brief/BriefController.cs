﻿
using Newtonsoft.Json.Linq;
using OfficeOpenXml;
using QUANGHANH2.Models;
using QUANGHANH2.SupportClass;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Linq.Dynamic;
using System.Threading.Tasks;
using System.Web.Hosting;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Script.Serialization;
using System.Data.SqlClient;
using QUANGHANH2.EntityResult;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace QUANGHANHCORE.Controllers.TCLD
{
    public class BriefController : Controller
    {
        // GET: /<controller>/

        public static string id_ = "";

        [Auther(RightID = "129")]
        [Route("phong-tcld/quan-ly-ho-so/ho-so-trong-cong-ty")]
        [HttpGet]
        public ActionResult Inside()
        {
            QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities();

            List<GetCustom_Employee_Result> employee_list = db.Database.SqlQuery<GetCustom_Employee_Result>("select employee_id,BASIC_INFO_full_name as employee_name from HumanResources.Employee where current_status_id != 2").ToList();

            List<SelectListItem> type_papers = new List<SelectListItem>
            {
                new SelectListItem { Text = "Gốc", Value = "Gốc" },
                new SelectListItem { Text = "Dấu đỏ", Value = "Dấu đỏ" },
                new SelectListItem { Text = "Sao,Công chứng", Value = "Sao,Công chứng" },
                new SelectListItem { Text = "Photo", Value = "Photo" }
            };

            List<string> paper_names = db.Database.SqlQuery<string>("select name from HumanResources.Papers").ToList();

            ViewBag.paper_names = paper_names;
            ViewBag.type_papers = type_papers;
            ViewBag.nameDepartment = "quanlyhoso";
            ViewBag.employee_list = employee_list;

            return View("/Views/TCLD/Brief/ManageBrief/Inside.cshtml");
        }

        [Auther(RightID = "132")]
        [Route("phong-tcld/quan-ly-ho-so/ho-so-ngoai-cong-ty")]
        public ActionResult Outside()
        {
            return View("/Views/TCLD/Brief/ManageBrief/Outside.cshtml");
        }

        [Route("phong-tcld/quan-ly-ho-so/ho-so-trong-cong-ty/giay-to/sua")]
        [Auther(RightID = "147")]
        [HttpPost]
        public ActionResult suaGiayTo(string paper_name, string type_name, int records_papers_id)
        {
            using (QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities())
            {
                try
                {
                    RecordsPaper rp = db.RecordsPapers.Where(x => x.records_papers_id == records_papers_id).First();
                    rp.papers_id = getPaperID(paper_name);
                    rp.papers_storage_type_id = getPaperStorageTypeID(type_name);
                    db.Entry(rp).State = EntityState.Modified;
                    db.SaveChanges();
                    return new HttpStatusCodeResult(201);
                }
                catch (Exception ex)
                {
                    return Json(new { success = false, message = ex.Message }, JsonRequestBehavior.AllowGet);
                }
            }
        }

        [Route("phong-tcld/quan-ly-ho-so/ho-so-trong-cong-ty/giay-to/record-paper")]
        [HttpPost]
        public ActionResult getRecordPaper(int records_papers_id)
        {
            try
            {
                QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities();
                string query = @"select rp.records_papers_id ,p.name as paper_name, pst.name as type_name
                    from HumanResources.Employee e
                    inner join HumanResources.Records r on r.employee_id = e.employee_id
                    inner join HumanResources.RecordsPapers rp on rp.records_id = r.records_id
                    inner join HumanResources.Papers p on rp.papers_id = p.papers_id
                    inner join HumanResources.PapersStorageType pst 
                    on pst.papers_storage_type_id = rp.papers_storage_type_id where e.current_status_id != 2 
                    and rp.records_papers_id = @records_papers_id";
                GetRelevant_Paper_Result rp = db.Database.SqlQuery<GetRelevant_Paper_Result>(query, new SqlParameter("records_papers_id", records_papers_id)).First();
                return Json(rp);
            }
            catch (Exception e)
            {
                return new HttpStatusCodeResult(400);
            }
        }

        [Route("phong-tcld/quan-ly-ho-so/ho-so-trong-cong-ty/giay-to/xoa")]
        [HttpPost]
        public ActionResult xoaGiayTo(int records_papers_id)
        {
            using (QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities())
            {
                try
                {
                    RecordsPaper rp = db.RecordsPapers.Where(x => x.records_papers_id == records_papers_id).First();
                    db.RecordsPapers.Remove(rp);
                    db.SaveChanges();
                    return Json("", JsonRequestBehavior.AllowGet);
                }
                catch (Exception e)
                {
                    return new HttpStatusCodeResult(400);
                }
            }
        }


        [Route("phong-tcld/quan-ly-ho-so/ho-so-trong-cong-ty/giay-to/them")]
        public ActionResult themGiayTo(string employee_id, string employee_name, string paper_name, string type_name)
        {
            using (QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities())
            {
                try
                {
                    RecordsPaper rp = new RecordsPaper();
                    rp.papers_id = getPaperID(paper_name);
                    rp.papers_storage_type_id = getPaperStorageTypeID(type_name);
                    rp.records_id = getRecordID(employee_id);
                    db.RecordsPapers.Add(rp);
                    db.SaveChanges();
                    return Json("", JsonRequestBehavior.AllowGet);
                }
                catch (Exception e)
                {
                    return new HttpStatusCodeResult(400);
                }
            }
        }

        private int getPaperID(string paper_name)
        {
            QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities();
            int paper_id = db.Database.SqlQuery<int>("select papers_id from HumanResources.Papers where name = @paper_name", new SqlParameter("paper_name", paper_name)).First();
            return paper_id;

        }

        private int getPaperStorageTypeID(string type_name)
        {
            QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities();
            int papers_storage_type_id = db.Database.SqlQuery<int>("select papers_storage_type_id from HumanResources.PapersStorageType where name = @type_name", new SqlParameter("type_name", type_name)).First();
            return papers_storage_type_id;
        }

        private int getRecordID(string employee_id)
        {
            QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities();
            int record_id = db.Database.SqlQuery<int>("select records_id from HumanResources.Records where employee_id = @employee_id", new SqlParameter("employee_id", employee_id)).First();
            return record_id;
        }

        [Route("phong-tcld/quan-ly-ho-so/ho-so-trong-cong-ty/giay-to/ten")]
        [HttpPost]
        public ActionResult getEmployeeName(int employee_id)
        {
            try
            {
                QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities();
                Employee e = db.Database.SqlQuery<Employee>("select * from HumanResources.Employee where employee_id = @employee_id", new SqlParameter("employee_id", employee_id)).First();
                return Json(e);
            }
            catch (Exception)
            {
                Response.Write("Có lỗi xảy ra, xin vui lòng nhập lại");
                return new HttpStatusCodeResult(400);
            }
        }

        [Route("phong-tcld/quan-ly-ho-so/ho-so-trong-cong-ty/giay-to")]
        [HttpPost]
        public ActionResult Search(string employee_id, string employee_name, string paper_name, string type_name)
        {
            QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities();
            db.Configuration.LazyLoadingEnabled = false;

            int start = Convert.ToInt32(Request["start"]);
            int length = Convert.ToInt32(Request["length"]);
            string searchValue = Request["search[value]"];
            string sortColumnName = Request["columns[" + Request["order[0][column]"] + "][name]"];
            string sortDirection = Request["order[0][dir]"];

            string query = @"select e.employee_id,e.BASIC_INFO_full_name as employee_name ,p.name as paper_name, pst.name as type_name
                    , p.papers_id, rp.records_papers_id from HumanResources.Employee e 
                    inner join HumanResources.Records r on r.employee_id = e.employee_id
                    inner join HumanResources.RecordsPapers rp on rp.records_id = r.records_id
                    inner join HumanResources.Papers p on rp.papers_id = p.papers_id
                    inner join HumanResources.PapersStorageType pst 
                    on pst.papers_storage_type_id = rp.papers_storage_type_id where e.current_status_id != 2 ";


            if (!employee_id.Equals("") || !employee_name.Equals("") || !paper_name.Equals("") || !type_name.Equals(""))
            {
                if (!employee_id.Equals("")) query += " AND e.employee_id like @employee_id ";
                if (!employee_name.Equals("")) query += "AND e.BASIC_INFO_full_name LIKE @employee_name ";
                if (!paper_name.Equals("")) query += "AND p.name LIKE @paper_name ";
                if (!type_name.Equals("")) query += "AND pst.name LIKE @paper_storage_type_name ";
            }


            List<GetRelevant_Paper_Result> searchList = db.Database.SqlQuery<GetRelevant_Paper_Result>(query,
                new SqlParameter("employee_id", '%' + employee_id + '%'),
                new SqlParameter("employee_name", '%' + employee_name + '%'),
                new SqlParameter("paper_name", '%' + paper_name + '%'),
                new SqlParameter("paper_storage_type_name", type_name)
                ).ToList();

            int totalrows = searchList.Count;
            int totalrowsafterfiltering = searchList.Count;
            //sorting
            searchList = searchList.OrderBy(sortColumnName + " " + sortDirection).ToList<GetRelevant_Paper_Result>();
            //paging
            searchList = searchList.Skip(start).Take(length).ToList<GetRelevant_Paper_Result>();

            return Json(new { data = searchList, draw = Request["draw"], recordsTotal = totalrows, recordsFiltered = totalrowsafterfiltering }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult listAllHoSo(string delivery_employee_name, string management_employee_name, string date_of_birth,
            string received_date, string employee_name, string employee_id)
        {

            using (QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities())
            {
                db.Configuration.LazyLoadingEnabled = false;

                int start = Convert.ToInt32(Request["start"]);
                int length = Convert.ToInt32(Request["length"]);
                string searchValue = Request["search[value]"];
                string sortColumnName = Request["columns[" + Request["order[0][column]"] + "][name]"];
                string sortDirection = Request["order[0][dir]"];

                string query = @"select e.employee_id, r.records_id,
                    e.BASIC_INFO_full_name as employee_name,
                    e.BASIC_INFO_date_of_birth as date_of_birth,
                    e2.BASIC_INFO_full_name as delivery_employee_name,
                    e3.BASIC_INFO_full_name as handover_employee_name,
                    e4.BASIC_INFO_full_name as management_employee_name
                    from HumanResources.Employee e
                    inner join HumanResources.Records r on e.employee_id = r.employee_id
                    left join HumanResources.Employee e2 on e2.employee_id = r.delivery_employee_id
                    left join HumanResources.Employee e3 on e3.employee_id = r.handover_employee_id
                    left join HumanResources.Employee e4 on e4.employee_id = r.management_employee_id
                    where e.current_status_id != 2 ";

                if (!delivery_employee_name.Equals("") || !employee_name.Equals("") || !management_employee_name.Equals("") || !employee_id.Equals(""))
                {
                    if (!employee_id.Equals("")) query += " AND e.employee_id like @employee_id ";
                    if (!employee_name.Equals("")) query += " AND e.BASIC_INFO_full_name LIKE @employee_name ";
                    if (!delivery_employee_name.Equals("")) query += " AND e2.BASIC_INFO_full_name LIKE @delivery_employee_name ";
                    if (!management_employee_name.Equals("")) query += " AND e4.BASIC_INFO_full_name LIKE @management_employee_name  ";
                }

                query += "order by e.employee_id ";
                List<GetRecord_Employee_Result> listRecords = db.Database.SqlQuery<GetRecord_Employee_Result>(query,
                    new SqlParameter("employee_id", '%' + employee_id + '%'),
                    new SqlParameter("employee_name", '%' + employee_name + '%'),
                    new SqlParameter("delivery_employee_name", '%' + delivery_employee_name + '%'),
                    new SqlParameter("management_employee_name", '%' + management_employee_name + '%')
                ).ToList();


                int totalrows = listRecords.Count;
                int totalrowsafterfiltering = listRecords.Count;
                listRecords = listRecords.OrderBy(sortColumnName + " " + sortDirection).ToList<GetRecord_Employee_Result>();
                //paging
                listRecords = listRecords.Skip(start).Take(length).ToList<GetRecord_Employee_Result>();
                var dataJson = Json(new { success = true, data = listRecords, draw = Request["draw"], recordsTotal = totalrows, recordsFiltered = totalrowsafterfiltering }, JsonRequestBehavior.AllowGet);

                //string dataSerialize = new JavaScriptSerializer().Serialize(dataJson.Data);

                return dataJson;
            }

        }

        [Auther(RightID = "129")]
        [Route("phong-tcld/quan-ly-ho-so/detail")]
        [HttpGet]
        public ActionResult InsideDetail(string employee_id)
        {
            id_ = employee_id;

            return View("/Views/TCLD/Brief/ManageBrief/InsideDetail.cshtml");
        }

        [Auther(RightID = "129")]
        [Route("phong-tcld/quan-ly-ho-so/ho-so-trong-cong-ty/chi-tiet-ho-so")]
        [HttpPost]
        public ActionResult listRecordDetail()
        {
            QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities();
            db.Configuration.LazyLoadingEnabled = false;

            int start = Convert.ToInt32(Request["start"]);
            int length = Convert.ToInt32(Request["length"]);
            string searchValue = Request["search[value]"];
            string sortColumnName = Request["columns[" + Request["order[0][column]"] + "][name]"];
            string sortDirection = Request["order[0][dir]"];

            string query = @"select  r.records_id, r.employee_id, r.received_date,
                    e2.BASIC_INFO_full_name as delivery_employee_name,
                    e3.BASIC_INFO_full_name as handover_employee_name,
                    e4.BASIC_INFO_full_name as management_employee_name,
                    tb1.recruitment_date ,d.date as recruitment_decision_date,
                    gd.department_name , tb2.terminate_date , tb2.termination_type,
                    d2.date as termination_decision_date
                    from HumanResources.Employee e
                    inner join HumanResources.Records r on e.employee_id = r.employee_id
                    left join HumanResources.Employee e2 on e2.employee_id = r.delivery_employee_id
                    left join HumanResources.Employee e3 on e3.employee_id = r.handover_employee_id
                    left join HumanResources.Employee e4 on e4.employee_id = r.management_employee_id 
                    inner join (select decision_id,r.employee_id,r.recruitment_date,
                    r.department_id
                    from HumanResources.Recruitment r inner join 
                    (select employee_id,max(recruitment_date) as recruitment_date,
                    department_id
                    from HumanResources.Recruitment r2
                    where r2.employee_id = @employee_id
                    group by employee_id,department_id) tb1a 
                    on r.employee_id = tb1a.employee_id 
                    and r.recruitment_date = tb1a.recruitment_date
                    and r.department_id = tb1a.department_id) tb1
                    on e.employee_id = tb1.employee_id  
                    inner join HumanResources.Decision d on d.decision_id = tb1.decision_id
                    inner join General.Department gd on gd.department_id = tb1.department_id
                    inner join (select top 1 t.decision_id,t.employee_id,t.terminate_date,
                    tt.name as termination_type
                    from HumanResources.Termination t
                    inner join HumanResources.TerminationType tt on 
                    t.termination_type_id = tt.termination_type_id
                    order by terminate_date desc) tb2
                    on tb1.employee_id = tb2.employee_id
                    inner join HumanResources.Decision d2 on d2.decision_id = tb2.decision_id
                    where e.employee_id = @employee_id ";

            List<GetRecord_Detail_Result> recordList = db.Database.SqlQuery<GetRecord_Detail_Result>(query,
                new SqlParameter("employee_id", id_)
                ).ToList();

            int totalrows = recordList.Count;
            int totalrowsafterfiltering = recordList.Count;
            //sorting
            recordList = recordList.OrderBy(sortColumnName + " " + sortDirection).ToList<GetRecord_Detail_Result>();
            //paging
            recordList = recordList.Skip(start).Take(length).ToList<GetRecord_Detail_Result>();

            return Json(new { data = recordList, draw = Request["draw"], recordsTotal = totalrows, recordsFiltered = totalrowsafterfiltering }, JsonRequestBehavior.AllowGet);
        }

        [Auther(RightID = "130")]
        [HttpPost]
        public ActionResult getInsideBasicInfo()
        {
            using (QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities())
            {
                db.Configuration.LazyLoadingEnabled = false;
                string query = @"select employee_id,BASIC_INFO_full_name as full_name,
                    BASIC_INFO_date_of_birth as date_of_birth,
                    BASIC_INFO_identity_card as identity_card,
                    BASIC_INFO_social_insurance_number as social_insurance_number,
                    BASIC_INFO_phone_number as phone_number,
                    BASIC_INFO_home_town as home_town,
                    BASIC_INFO_current_residence as current_residence,
                    ACADEMIC_academic_level as academic_level
                    from HumanResources.Employee e
                    where e.employee_id = @employee_id ";

                GetBasic_Info_Employee_Result em = db.Database.SqlQuery<GetBasic_Info_Employee_Result>(query,
                    new SqlParameter("employee_id", id_)).First();

                //Basic_Info_Employee em = db.Database.SqlQuery<Basic_Info_Employee>(query).FirstOrDefault();

                return Json(em);
            }
        }

        [Route("phong-tcld/quan-ly-ho-so/ho-so-trong-cong-ty/chi-tiet-ho-so/edit")]
        [HttpPost]
        public ActionResult edit_record_detail(string management_employee_name, string received_date, string recruitment_decision_date,
            string delivery_employee_name, string handover_employee_name, string department_name, string recruitment_date,
            string termination_date, string termination_decision_date, string termination_type)
        {
            QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities();
            using (DbContextTransaction transaction = db.Database.BeginTransaction())
            {
                try
                {
                    string query_r = @"select employee_id,max(recruitment_date) as recruitment_date,
                        department_id from HumanResources.Recruitment
                        group by employee_id,department_id where employee_id = @employee_id";
                    //Get data
                    Termination t = db.Terminations.Where(x => x.employee_id == id_).OrderByDescending(x => x.terminate_date).First();
                    Recruitment r = db.Database.SqlQuery<Recruitment>(query_r,
                        new SqlParameter("employee_id", id_)).First();
                    Department d = db.Departments.Where(x => x.department_name == department_name).First();
                    TerminationType tt = db.TerminationTypes.Where(x => x.name == termination_type).First();
                    Employee management = db.Employees.Where(x => x.BASIC_INFO_full_name == management_employee_name).First();
                    Employee delivery = db.Employees.Where(x => x.BASIC_INFO_full_name == delivery_employee_name).First();
                    Employee handover = db.Employees.Where(x => x.BASIC_INFO_full_name == handover_employee_name).First();

                    //Edit
                    Termination ter_edit = db.Terminations.Where(x => (x.employee_id == id_ && x.terminate_date == t.terminate_date)).First();
                    Recruitment re_edit = db.Recruitments.Where(x => (x.employee_id == id_ && x.department_id == d.department_id
                        && x.recruitment_date == r.recruitment_date)).First();
                    Record record_edit = db.Records.Where(x => x.employee_id == id_).First();
                    Decision de_ter_edit = db.Decisions.Where(x => x.decision_id == t.decision_id).First();
                    Decision de_re_edit = db.Decisions.Where(x => x.decision_id == r.decision_id).First();


                    ter_edit.terminate_date = DateTime.ParseExact(termination_date, "yyyy-MM-dd HH:mm", CultureInfo.InvariantCulture);
                    ter_edit.termination_type_id = tt.termination_type_id;
                    re_edit.recruitment_date = DateTime.ParseExact(recruitment_date, "yyyy-MM-dd HH:mm", CultureInfo.InvariantCulture);
                    re_edit.department_id = d.department_id;
                    de_ter_edit.date = DateTime.ParseExact(termination_decision_date, "yyyy-MM-dd HH:mm", CultureInfo.InvariantCulture);
                    de_re_edit.date = DateTime.ParseExact(recruitment_decision_date, "yyyy-MM-dd HH:mm", CultureInfo.InvariantCulture);
                    record_edit.handover_employee_id = handover.employee_id;
                    record_edit.management_employee_id = management.employee_id;
                    record_edit.delivery_employee_id = delivery.employee_id;
                    record_edit.received_date = DateTime.ParseExact(received_date, "yyyy-MM-dd HH:mm", CultureInfo.InvariantCulture);

                    db.Entry(ter_edit).State = EntityState.Modified;
                    db.Entry(re_edit).State = EntityState.Modified;
                    db.Entry(record_edit).State = EntityState.Modified;
                    db.Entry(de_ter_edit).State = EntityState.Modified;
                    db.Entry(de_re_edit).State = EntityState.Modified;

                    db.SaveChanges();
                    transaction.Commit();

                    return Json("", JsonRequestBehavior.AllowGet);
                }
                catch (Exception e)
                {
                    transaction.Rollback();
                    return new HttpStatusCodeResult(400);
                }
            }
        }


        [HttpPost]
        public ActionResult addYear(string year)
        {
            using (QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities())
            {
                try
                {
                    AdditionalHistoryResume ahr = new AdditionalHistoryResume();
                    ahr.additional_history_resume_year = year;
                    Record r = db.Records.Where(x => x.employee_id == id_).First();
                    ahr.note = null;
                    ahr.records_id = r.records_id;
                    db.AdditionalHistoryResumes.Add(ahr);
                    db.SaveChanges();
                    return Json("", JsonRequestBehavior.AllowGet);
                }
                catch (Exception e)
                {
                    return new HttpStatusCodeResult(400);
                }
            }
        }


        [Auther(RightID = "130")]
        [Route("phong-tcld/quan-ly-ho-so/ho-so-trong-cong-ty/syll-bo-sung")]
        [HttpPost]
        public ActionResult listLichSuBoSung()
        {
            QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities();
            db.Configuration.LazyLoadingEnabled = false;

            int start = Convert.ToInt32(Request["start"]);
            int length = Convert.ToInt32(Request["length"]);
            string searchValue = Request["search[value]"];
            string sortColumnName = Request["columns[" + Request["order[0][column]"] + "][name]"];
            string sortDirection = Request["order[0][dir]"];


            List<AdditionalHistoryResume> aList = db.Database.SqlQuery<AdditionalHistoryResume>(@"select a.*
                from HumanResources.AdditionalHistoryResume a
                inner join HumanResources.Records r on r.records_id = a.records_id 
                where r.employee_id = @employee_id",
                new SqlParameter("employee_id", id_)).ToList();

            int totalrows = aList.Count;
            int totalrowsafterfiltering = aList.Count;
            //sorting
            //aList = aList.OrderBy(sortColumnName + " " + sortDirection).ToList<AdditionalHistoryResume>();
            //paging
            //aList = aList.Skip(start).Take(length).ToList<AdditionalHistoryResume>();
            return Json(new { data = aList, draw = Request["draw"], recordsTotal = totalrows, recordsFiltered = totalrowsafterfiltering }, JsonRequestBehavior.AllowGet);
        }

        [Auther(RightID = "130")]
        [Route("phong-tcld/quan-ly-ho-so/ho-so-trong-cong-ty/chi-tiet-giay-to")]
        [HttpPost]
        public ActionResult listGiayTo()
        {
            QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities();
            db.Configuration.LazyLoadingEnabled = false;

            int start = Convert.ToInt32(Request["start"]);
            int length = Convert.ToInt32(Request["length"]);
            string searchValue = Request["search[value]"];
            string sortColumnName = Request["columns[" + Request["order[0][column]"] + "][name]"];
            string sortDirection = Request["order[0][dir]"];

            string query = @"select r.employee_id,
                p.name as paper_name , pst.name as type_name
                from HumanResources.Records r 
                inner join HumanResources.RecordsPapers rp on r.records_id = rp.records_id
                inner join HumanResources.Papers p on p.papers_id =  rp.papers_id
                inner join HumanResources.PapersStorageType pst on
                pst.papers_storage_type_id = rp.papers_storage_type_id
                where r.employee_id = @employee_id ";

            List<GetRelevant_Paper_Result> recordList = db.Database.SqlQuery<GetRelevant_Paper_Result>(query,
                new SqlParameter("employee_id", id_)
                ).ToList();

            int totalrows = recordList.Count;
            int totalrowsafterfiltering = recordList.Count;
            //sorting
            recordList = recordList.OrderBy(sortColumnName + " " + sortDirection).ToList<GetRelevant_Paper_Result>();
            //paging
            recordList = recordList.Skip(start).Take(length).ToList<GetRelevant_Paper_Result>();
            return Json(new { data = recordList, draw = Request["draw"], recordsTotal = totalrows, recordsFiltered = totalrowsafterfiltering }, JsonRequestBehavior.AllowGet);

        }

        [Auther(RightID = "130")]
        [Route("phong-tcld/quan-ly-ho-so/ho-so-trong-cong-ty/chi-tiet-bang-cap")]
        [HttpPost]
        public ActionResult chiTietbangCap()
        {
            QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities();
            db.Configuration.LazyLoadingEnabled = false;

            int start = Convert.ToInt32(Request["start"]);
            int length = Convert.ToInt32(Request["length"]);
            string searchValue = Request["search[value]"];
            string sortColumnName = Request["columns[" + Request["order[0][column]"] + "][name]"];
            string sortDirection = Request["order[0][dir]"];

            string query = @"select records_papers_id,
                s.name as school_name,
                sp.name as spe_name,
                c.name as career_name,
                papers_number,p.name as paper_name,
                duration,given_date,pst.name as paper_stotype_name, 
                pt.name as type_name
                from HumanResources.RecordsPapers rp
                inner join HumanResources.Records r on rp.records_id = r.records_id
                left join HumanResources.School s on rp.school_id = s.school_id
                left join HumanResources.Specializations sp on sp.specializations_id = rp.specializations_id
                left join HumanResources.Career c on c.career_id = rp.career_id
                left join HumanResources.Papers p on rp.papers_id = p.papers_id
                left join HumanResources.PapersStorageType pst on pst.papers_storage_type_id = rp.papers_storage_type_id
                left join HumanResources.PapersType pt on pt.papers_type_id = p.papers_type_id
                where r.employee_id = @employee_id";

            List<GetPaper_Detail_Result> paperList = db.Database.SqlQuery<GetPaper_Detail_Result>(query,
                new SqlParameter("employee_id", id_)
                ).ToList();

            int totalrows = paperList.Count;
            int totalrowsafterfiltering = paperList.Count;
            //sorting
            paperList = paperList.OrderBy(sortColumnName + " " + sortDirection).ToList<GetPaper_Detail_Result>();
            //paging
            paperList = paperList.Skip(start).Take(length).ToList<GetPaper_Detail_Result>();
            return Json(new { data = paperList, draw = Request["draw"], recordsTotal = totalrows, recordsFiltered = totalrowsafterfiltering }, JsonRequestBehavior.AllowGet);
        }


        [Auther(RightID = "130")]
        [Route("phong-tcld/quan-ly-ho-so/ho-so-trong-cong-ty/quan-he-gia-dinh")]
        [HttpPost]
        public ActionResult quanHeGiadinh()
        {
            QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities();
            db.Configuration.LazyLoadingEnabled = false;

            int start = Convert.ToInt32(Request["start"]);
            int length = Convert.ToInt32(Request["length"]);
            string searchValue = Request["search[value]"];
            string sortColumnName = Request["columns[" + Request["order[0][column]"] + "][name]"];
            string sortDirection = Request["order[0][dir]"];

            string query = @"select full_name,date_of_birth,background,
                ft.name as type_family,
                fr.name as relationship
                from HumanResources.Family f
                inner join HumanResources.FamilyType ft on 
                ft.family_type_id = f.family_type_id
                inner join HumanResources.FamilyRelationship fr on 
                fr.family_relationship_id = f.family_relationship_id
                where f.employee_id = @employee_id ";

            List<GetFamily_Detail_Result> familyList = db.Database.SqlQuery<GetFamily_Detail_Result>(query,
                new SqlParameter("employee_id", id_)
                ).ToList();

            int totalrows = familyList.Count;
            int totalrowsafterfiltering = familyList.Count;
            //sorting
            familyList = familyList.OrderBy(sortColumnName + " " + sortDirection).ToList<GetFamily_Detail_Result>();
            //paging
            familyList = familyList.Skip(start).Take(length).ToList<GetFamily_Detail_Result>();
            return Json(new { data = familyList, draw = Request["draw"], recordsTotal = totalrows, recordsFiltered = totalrowsafterfiltering }, JsonRequestBehavior.AllowGet);

        }

        [Route("phong-tcld/quan-ly-ho-so/detail")]
        [Auther(RightID = "169")]
        [HttpPost]
        public ActionResult EditAHR(string year, string ahr_id)
        {
            QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities();
            using (DbContextTransaction transaction = db.Database.BeginTransaction())
            {
                try
                {
                    int ahr_id_num = Int32.Parse(ahr_id);
                    AdditionalHistoryResume ahr = db.AdditionalHistoryResumes.Where(x => x.additional_history_resume_id == ahr_id_num).First();
                    ahr.additional_history_resume_year = year;
                    db.Entry(ahr).State = EntityState.Modified;
                    db.SaveChanges();
                    transaction.Commit();
                    return Json("", JsonRequestBehavior.AllowGet);
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    return new HttpStatusCodeResult(400);
                }
            }
        }

        [HttpPost]
        public ActionResult getYear(int ahr_id)
        {
            try
            {
                QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities();
                AdditionalHistoryResume ahr = new AdditionalHistoryResume();
                ahr = db.Database.SqlQuery<AdditionalHistoryResume>("select * from HumanResources.AdditionalHistoryResume where additional_history_resume_id = @ahr_id", new SqlParameter("ahr_id", ahr_id)).First();
                return Json(ahr);
            }
            catch (Exception)
            {
                Response.Write("Có lỗi xảy ra, xin vui lòng nhập lại");
                return new HttpStatusCodeResult(400);
            }
        }

        [HttpPost]
        public ActionResult GetOutsideRecord(string employee_id, string employee_name, string termination_name)
        {
            using (QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities())
            {
                db.Configuration.LazyLoadingEnabled = false;

                int start = Convert.ToInt32(Request["start"]);
                int length = Convert.ToInt32(Request["length"]);
                string searchValue = Request["search[value]"];
                string sortColumnName = Request["columns[" + Request["order[0][column]"] + "][name]"];
                string sortDirection = Request["order[0][dir]"];

                string query = @"select e.employee_id,
                    BASIC_INFO_full_name as full_name, 
                    gd.department_name,
                    BASIC_INFO_phone_number as phone_number, 
                    BASIC_INFO_current_residence as current_residence, 
                    BASIC_INFO_social_insurance_number as social_insurance_number, 
                    tb3.termination_name
                    from HumanResources.Employee e
                    inner join General.Department gd on gd.department_id = e.current_department_id
                    inner join HumanResources.Records r on r.employee_id = e.employee_id
                    left join (
                    select tb1.employee_id,tt1.name as termination_name 
                    from HumanResources.Termination tb1
                    inner join HumanResources.TerminationType tt1 
                    on tb1.termination_type_id = tt1.termination_type_id
                    inner join 
                    (
                    select t.employee_id ,max(terminate_date) as terminate_date
                    from HumanResources.Termination t 
                    inner join HumanResources.TerminationType tt 
                    on tt.termination_type_id = t.termination_type_id
                    group by t.employee_id ) tb2
                    on  tb1.terminate_date = tb2.terminate_date and tb1.employee_id = tb2.employee_id) tb3
                    on tb3.employee_id = r.employee_id
                    where r.records_status_id = 2 ";

                if (!employee_id.Equals("") || !employee_name.Equals("") || !termination_name.Equals(""))
                {
                    if (!employee_id.Equals("")) query += " AND e.employee_id like @employee_id ";
                    if (!employee_name.Equals("")) query += " AND e.BASIC_INFO_full_name LIKE @employee_name ";
                    if (!termination_name.Equals("")) query += " AND tb3.termination_name LIKE @termination_name ";
                }

                query += "order by e.employee_id ";

                List<GetOutside_Record_Result> outside_Records = db.Database.SqlQuery<GetOutside_Record_Result>(query,
                    new SqlParameter("employee_id", employee_id),
                    new SqlParameter("employee_name", '%' + employee_name + '%'),
                    new SqlParameter("termination_name", '%' + termination_name + '%')).ToList();


                int totalrows = outside_Records.Count;
                int totalrowsafterfiltering = outside_Records.Count;
                //outside_Records = outside_Records.OrderBy(sortColumnName + " " + sortDirection).ToList<Outside_Record>();
                //paging
                outside_Records = outside_Records.Skip(start).Take(length).ToList<GetOutside_Record_Result>();
                var dataJson = Json(new { success = true, data = outside_Records, draw = Request["draw"], recordsTotal = totalrows, recordsFiltered = totalrowsafterfiltering }, JsonRequestBehavior.AllowGet);

                //string dataSerialize = new JavaScriptSerializer().Serialize(dataJson.Data);

                return dataJson;
            }
        }

        [Auther(RightID = "133")]
        [HttpGet]
        [Route("phong-tcld/quan-ly-ho-so/ho-so-ngoai-cong-ty/chi-tiet-ho-so")]
        public ActionResult OutSideDetail(string employee_id)
        {
            id_ = employee_id;
            return View("/Views/TCLD/Brief/ManageBrief/OutSideDetail.cshtml");
        }

        [Route("phong-tcld/quan-ly-ho-so/ho-so-ngoai-cong-ty/basic-info")]
        [HttpPost]
        public ActionResult getOutsideBasicInfo()
        {
            QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities();
            db.Configuration.LazyLoadingEnabled = false;

            int start = Convert.ToInt32(Request["start"]);
            int length = Convert.ToInt32(Request["length"]);
            string searchValue = Request["search[value]"];
            string sortColumnName = Request["columns[" + Request["order[0][column]"] + "][name]"];
            string sortDirection = Request["order[0][dir]"];

            string query = @"select e.employee_id,
                BASIC_INFO_full_name as full_name
                ,BASIC_INFO_date_of_birth as date_of_birth,
                gd.department_name,
                BASIC_INFO_phone_number as phone_number
                , BASIC_INFO_current_residence as current_residence, 
                BASIC_INFO_social_insurance_number as social_insurance_number
                from HumanResources.Employee e
                inner join General.Department gd on gd.department_id = e.current_department_id
                inner join HumanResources.Records r on r.employee_id = e.employee_id
                where e.employee_id = @employee_id ";

            GetBasic_Info_Employee_Result obj = db.Database.SqlQuery<GetBasic_Info_Employee_Result>(query,
                    new SqlParameter("employee_id", id_)).First();
            return Json(obj);

        }

        [Route("phong-tcld/quan-ly-ho-so/ho-so-ngoai-cong-ty/termination")]
        [HttpPost]
        public ActionResult getOutsideTerminationType()
        {
            QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities();
            db.Configuration.LazyLoadingEnabled = false;

            int start = Convert.ToInt32(Request["start"]);
            int length = Convert.ToInt32(Request["length"]);
            string searchValue = Request["search[value]"];
            string sortColumnName = Request["columns[" + Request["order[0][column]"] + "][name]"];
            string sortDirection = Request["order[0][dir]"];

            string query = @"select top 1 d.number as decision_number, tt.name as termination_name , 
                d.date as decision_date , t.terminate_date , d.decision_id
                from HumanResources.Decision d
                inner join HumanResources.Termination t on t.decision_id = d.decision_id
                inner join HumanResources.TerminationType tt on
                t.termination_type_id = tt.termination_type_id
                inner join HumanResources.Records r on r.employee_id = t.employee_id 
                where t.employee_id = @employee_id
                order by d.date desc ";

            GetOutside_Termination_Result obj = db.Database.SqlQuery<GetOutside_Termination_Result>(query,
                    new SqlParameter("employee_id", id_)).First();
            return Json(obj);
        }

        [Route("phong-tcld/quan-ly-ho-so/ho-so-ngoai-cong-ty/authorization")]
        [HttpPost]
        public ActionResult getOutsideAuthorization()
        {
            QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities();
            db.Configuration.LazyLoadingEnabled = false;

            int start = Convert.ToInt32(Request["start"]);
            int length = Convert.ToInt32(Request["length"]);
            string searchValue = Request["search[value]"];
            string sortColumnName = Request["columns[" + Request["order[0][column]"] + "][name]"];
            string sortDirection = Request["order[0][dir]"];

            string query = @"select r.full_name,r.identity_card_number,r.phone_number,
                fr.name as family_relationship_name
                from HumanResources.RecordsGettingAuthorize r
                inner join HumanResources.FamilyRelationship fr
                on fr.family_relationship_id = r.family_relationship_id
                inner join HumanResources.Records rs on rs.records_id = r.records_id
                where rs.employee_id = @employee_id ";

            GetOutside_Authorization_Result obj = db.Database.SqlQuery<GetOutside_Authorization_Result>(query,
                    new SqlParameter("employee_id", id_)).First();
            return Json(obj);
        }

        [Route("phong-tcld/quan-ly-ho-so/ho-so-ngoai-cong-ty/paper")]
        [HttpPost]
        public ActionResult getOutsidePaperInfo()
        {
            QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities();
            db.Configuration.LazyLoadingEnabled = false;

            int start = Convert.ToInt32(Request["start"]);
            int length = Convert.ToInt32(Request["length"]);
            string searchValue = Request["search[value]"];
            string sortColumnName = Request["columns[" + Request["order[0][column]"] + "][name]"];
            string sortDirection = Request["order[0][dir]"];

            string query = @"select rp.papers_number,rp.papers_id,p.name as paper_name ,pst.name as type_name,
                rp.received_date , rp.given_date , rp.records_papers_id
                from HumanResources.RecordsPapers rp
                inner join HumanResources.Papers p on
                p.papers_id = rp.papers_id
                inner join HumanResources.PapersStorageType pst on 
                pst.papers_storage_type_id = rp.papers_storage_type_id
                inner join HumanResources.Records r on
                r.records_id = rp.records_id
                where r.employee_id = @employee_id ";

            List<GetOutside_Paper_Result> list = db.Database.SqlQuery<GetOutside_Paper_Result>(query,
                new SqlParameter("employee_id", id_)
                ).ToList();

            int totalrows = list.Count;
            int totalrowsafterfiltering = list.Count;
            return Json(new { data = list, draw = Request["draw"], recordsTotal = totalrows, recordsFiltered = totalrowsafterfiltering }, JsonRequestBehavior.AllowGet);

        }

        [Route("phong-tcld/quan-ly-ho-so/ho-so-ngoai-cong-ty/edit-basic-info")]
        [HttpPost]
        public ActionResult updateOutsideBasicInfo(string json)
        {
            QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities();
            using (DbContextTransaction transaction = db.Database.BeginTransaction())
            {
                try
                {
                    dynamic js = JObject.Parse(json);
                    string employee_id = js.employee_id;
                    DateTime? date_of_birth = js.date_of_birth;
                    string full_name = js.full_name;
                    string department_name = js.department_name;
                    string social_insurance_number = js.social_insurance_number;
                    string phone_number = js.phone_number;
                    string current_residence = js.current_residence;

                    Department d = db.Departments.Where(x => x.department_name == department_name).First();

                    Employee e = db.Employees.Where(x => x.employee_id == employee_id).First();
                    e.BASIC_INFO_date_of_birth = date_of_birth;
                    e.current_department_id = d.department_id;
                    e.BASIC_INFO_phone_number = phone_number;
                    e.BASIC_INFO_current_residence = current_residence;
                    e.BASIC_INFO_social_insurance_number = social_insurance_number;

                    db.Entry(e).State = EntityState.Modified;

                    db.SaveChanges();
                    transaction.Commit();

                    return Json("", JsonRequestBehavior.AllowGet);
                }
                catch (Exception e)
                {
                    transaction.Rollback();
                    return new HttpStatusCodeResult(400);
                }
            }

        }

        [Route("phong-tcld/quan-ly-ho-so/ho-so-ngoai-cong-ty/edit-termination")]
        [HttpPost]
        public ActionResult updateOutsideTermination(string json)
        {
            QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities();
            using (DbContextTransaction transaction = db.Database.BeginTransaction())
            {
                try
                {
                    dynamic js = JObject.Parse(json);
                    int decision_id = js.decision_id;
                    string termination_name = js.termination_name;
                    string decision_number = js.decision_number;
                    DateTime? decision_date = js.decision_date;
                    DateTime? terminate_date = js.terminate_date;


                    TerminationType tt = db.TerminationTypes.Where(x => x.name == termination_name).First();

                    //Edit
                    Termination t_edit = db.Terminations.Where(x => (x.decision_id == decision_id && x.employee_id == id_)).First();
                    Decision de_edit = db.Decisions.Where(x => x.decision_id == decision_id).First();

                    t_edit.terminate_date = terminate_date;
                    t_edit.termination_type_id = tt.termination_type_id;
                    de_edit.date = decision_date;

                    db.Entry(t_edit).State = EntityState.Modified;
                    db.Entry(de_edit).State = EntityState.Modified;

                    db.SaveChanges();
                    transaction.Commit();

                    return Json("", JsonRequestBehavior.AllowGet);
                }
                catch (Exception e)
                {
                    transaction.Rollback();
                    return new HttpStatusCodeResult(400);
                }
            }
        }

        [Route("phong-tcld/quan-ly-ho-so/ho-so-ngoai-cong-ty/edit-authorization")]
        [HttpPost]
        public ActionResult updateOutsideAuthorization(string json)
        {
            QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities();
            using (DbContextTransaction transaction = db.Database.BeginTransaction())
            {
                try
                {
                    dynamic js = JObject.Parse(json);
                    string full_name = js.full_name;
                    string family_relationship_name = js.family_relationship_name;
                    string identity_card_number = js.identity_card_number;
                    string phone_number = js.phone_number;

                    Record r = db.Records.Where(x => x.employee_id == id_).First();
                    FamilyRelationship f = db.FamilyRelationships.Where(x => x.name == family_relationship_name).First();

                    //edit
                    RecordsGettingAuthorize rga_edit = db.RecordsGettingAuthorizes.Where(x => x.records_id == r.records_id).FirstOrDefault();
                    rga_edit.full_name = full_name;
                    rga_edit.identity_card_number = identity_card_number;
                    rga_edit.phone_number = phone_number;
                    rga_edit.family_relationship_id = f.family_relationship_id;

                    if (rga_edit == null)
                    {
                        db.RecordsGettingAuthorizes.Add(rga_edit);
                    }
                    else
                    {
                        db.Entry(rga_edit).State = EntityState.Modified;
                    }

                    db.SaveChanges();
                    transaction.Commit();

                    return Json("", JsonRequestBehavior.AllowGet);
                }
                catch (Exception e)
                {
                    transaction.Rollback();
                    return new HttpStatusCodeResult(400);
                }
            }

        }

        [Route("phong-tcld/quan-ly-ho-so/ho-so-ngoai-cong-ty/add-paper")]
        [HttpPost]
        public ActionResult addOutsidePaper(string papers_type, string papers_name)
        {
            using (QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities())
            {
                try
                {
                    Record r = db.Records.Where(x => x.employee_id == id_).First();
                    Paper p = db.Papers.Where(x => x.name == papers_name).First();
                    PapersStorageType pst = db.PapersStorageTypes.Where(x => x.name == papers_type).First();

                    //add
                    RecordsPaper rp_add = new RecordsPaper();
                    rp_add.papers_id = p.papers_id;
                    rp_add.papers_storage_type_id = pst.papers_storage_type_id;
                    rp_add.records_id = r.records_id;

                    db.RecordsPapers.Add(rp_add);

                    db.SaveChanges();
                    return Json("", JsonRequestBehavior.AllowGet);
                }
                catch (Exception e)
                {
                    return new HttpStatusCodeResult(400);
                }
            }
        }

        [Route("phong-tcld/quan-ly-ho-so/ho-so-ngoai-cong-ty/add-paper")]
        [HttpPost]
        public ActionResult getOutsidePaperEdit(string records_papers_id)
        {
            QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities();
            db.Configuration.LazyLoadingEnabled = false;

            int start = Convert.ToInt32(Request["start"]);
            int length = Convert.ToInt32(Request["length"]);
            string searchValue = Request["search[value]"];
            string sortColumnName = Request["columns[" + Request["order[0][column]"] + "][name]"];
            string sortDirection = Request["order[0][dir]"];

            string query = @"select rp.papers_number,rp.papers_id,p.name as paper_name ,pst.name as type_name,
                rp.received_date , rp.given_date , rp.records_papers_id
                from HumanResources.RecordsPapers rp
                inner join HumanResources.Papers p on
                p.papers_id = rp.papers_id
                inner join HumanResources.PapersStorageType pst on 
                pst.papers_storage_type_id = rp.papers_storage_type_id
                inner join HumanResources.Records r on
                r.records_id = rp.records_id
                where rp.records_papers_id = @records_papers_id ";

            GetOutside_Paper_Result p = db.Database.SqlQuery<GetOutside_Paper_Result>(query, new SqlParameter("records_papers_id", records_papers_id)).First();
            return Json(p);
        }

        [Route("phong-tcld/quan-ly-ho-so/ho-so-ngoai-cong-ty/edit-paper")]
        [HttpPost]
        public ActionResult updateOutsidePaper(string json)
        {
            QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities();
            using (DbContextTransaction transaction = db.Database.BeginTransaction())
            {
                try
                {
                    dynamic js = JObject.Parse(json);
                    string papers_number = js.papers_number;
                    int records_papers_id = js.records_papers_id;
                    DateTime? received_date = js.received_date;
                    int papers_id = js.papers_id;
                    string type_name = js.type_name;
                    string paper_name = js.paper_name;
                    DateTime? given_date = js.given_date;

                    //get id
                    Record r = db.Records.Where(x => x.employee_id == id_).First();
                    Paper p = db.Papers.Where(x => x.name == paper_name).First();
                    PapersStorageType pst = db.PapersStorageTypes.Where(x => x.name == type_name).First();

                    //edit
                    RecordsPaper rp_edit = db.RecordsPapers.Where(x => x.records_papers_id == records_papers_id).FirstOrDefault();
                    rp_edit.papers_id = p.papers_id;
                    rp_edit.papers_storage_type_id = pst.papers_storage_type_id;
                    rp_edit.records_id = r.records_id;
                    rp_edit.given_date = given_date;
                    rp_edit.received_date = received_date;
                    rp_edit.papers_number = papers_number;

                    db.Entry(rp_edit).State = EntityState.Modified;
                    db.SaveChanges();
                    transaction.Commit();

                    return Json("", JsonRequestBehavior.AllowGet);
                }
                catch (Exception e)
                {
                    transaction.Rollback();
                    return new HttpStatusCodeResult(400);
                }
            }

        }

        [Auther(RightID = "130")]
        [Route("phong-tcld/quan-ly-ho-so/ho-so-trong-cong-ty/chi-tiet-chung-chi")]
        [HttpPost]
        public ActionResult listCertiDetail()
        {
            QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities();
            db.Configuration.LazyLoadingEnabled = false;

            int start = Convert.ToInt32(Request["start"]);
            int length = Convert.ToInt32(Request["length"]);
            string searchValue = Request["search[value]"];
            string sortColumnName = Request["columns[" + Request["order[0][column]"] + "][name]"];
            string sortDirection = Request["order[0][dir]"];

            string query = @"select rp.papers_number,p.name as paper_name,rp.given_date, pst.name as type_name
                from HumanResources.RecordsPapers rp
                inner join HumanResources.Papers p on rp.papers_id = p.papers_id
                inner join HumanResources.PapersStorageType pst on pst.papers_storage_type_id = rp.papers_storage_type_id
                inner join HumanResources.Records r on r.records_id = rp.records_id
                where r.employee_id = @employee_id ";

            List<GetCerti_Detail_Result> CertiList = db.Database.SqlQuery<GetCerti_Detail_Result>(query,
                new SqlParameter("employee_id", id_)
                ).ToList();

            int totalrows = CertiList.Count;
            int totalrowsafterfiltering = CertiList.Count;
            //sorting
            CertiList = CertiList.OrderBy(sortColumnName + " " + sortDirection).ToList<GetCerti_Detail_Result>();
            //paging
            CertiList = CertiList.Skip(start).Take(length).ToList<GetCerti_Detail_Result>();
            return Json(new { data = CertiList, draw = Request["draw"], recordsTotal = totalrows, recordsFiltered = totalrowsafterfiltering }, JsonRequestBehavior.AllowGet);
        }

        [Auther(RightID = "130")]
        [Route("phong-tcld/chung-chi/danh-sach-ho-so-trong/xuat-file-excel")]
        [HttpPost]
        public ActionResult InsideExportToExcel()
        {
            try
            {

                string path = HostingEnvironment.MapPath("/excel/TCLD/Brief/Inside.xlsx");
                string saveAsPath = ("/excel/TCLD/Certificate/List/download/Hồ sơ trong.xlsx");
                FileInfo file = new FileInfo(path);
                using (ExcelPackage excelPackage = new ExcelPackage(file))
                {
                    ExcelWorkbook excelWorkbook = excelPackage.Workbook;
                    ExcelWorksheet ws = excelWorkbook.Worksheets.First();
                    using (QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities())
                    {
                        string query = @"select * from (
                            select employee_id,BASIC_INFO_full_name as full_name,
                            BASIC_INFO_date_of_birth as date_of_birth,
                            BASIC_INFO_identity_card as identity_card,
                            BASIC_INFO_social_insurance_number as social_insurance_number,
                            BASIC_INFO_phone_number as phone_number,
                            BASIC_INFO_home_town as home_town,
                            BASIC_INFO_current_residence as current_residence,
                            ACADEMIC_academic_level as academic_level
                            from HumanResources.Employee e
                            ) 
                            p1 
                            left join 
                            (select  r.records_id, r.employee_id, r.received_date,
                            e2.BASIC_INFO_full_name as delivery_employee_name,
                            e3.BASIC_INFO_full_name as handover_employee_name,
                            e4.BASIC_INFO_full_name as management_employee_name,
                            tb1.recruitment_date ,d.date as recruitment_decision_date,
                            gd.department_name , tb2.terminate_date , tb2.termination_type,
                            d2.date as termination_decision_date
                            from HumanResources.Employee e
                            inner join HumanResources.Records r on e.employee_id = r.employee_id
                            left join HumanResources.Employee e2 on e2.employee_id = r.delivery_employee_id
                            left join HumanResources.Employee e3 on e3.employee_id = r.handover_employee_id
                            left join HumanResources.Employee e4 on e4.employee_id = r.management_employee_id 
                            inner join (select top 1 decision_id,employee_id,recruitment_date,
                            department_id
                            from HumanResources.Recruitment
                            order by recruitment_date desc) tb1
                            on e.employee_id = tb1.employee_id 
                            inner join HumanResources.Decision d on d.decision_id = tb1.decision_id
                            inner join General.Department gd on gd.department_id = tb1.department_id
                            inner join (select top 1 t.decision_id,t.employee_id,t.terminate_date,
                            tt.name as termination_type
                            from HumanResources.Termination t
                            inner join HumanResources.TerminationType tt on 
                            t.termination_type_id = tt.termination_type_id
                            order by terminate_date desc) tb2
                            on tb1.employee_id = tb2.employee_id
                            inner join HumanResources.Decision d2 on d2.decision_id = tb2.decision_id) 
                            p2 
                            on p1.employee_id = p2.employee_id
                            left join 
                            (select r.records_id,r.employee_id,rp.papers_storage_type_id,
                            p.name as paper_name , pst.name as type_name
                            from HumanResources.Records r 
                            inner join HumanResources.RecordsPapers rp on r.records_id = rp.records_id
                            inner join HumanResources.Papers p on p.papers_id =  rp.papers_id
                            inner join HumanResources.PapersStorageType pst on
                            pst.papers_storage_type_id = rp.papers_storage_type_id) 
                            p3 
                            on p1.employee_id = p3.employee_id
                            left join 
                            (select records_papers_id,
                            s.name as school_name,
                            sp.name as spe_name,
                            c.name as career_name,
                            papers_number,p.name as paper_name,
                            duration,given_date,pst.name as paper_stotype_name, 
                            pt.name as type_name,r.employee_id
                            from HumanResources.RecordsPapers rp
                            inner join HumanResources.Records r on rp.records_id = r.records_id
                            left join HumanResources.School s on rp.school_id = s.school_id
                            left join HumanResources.Specializations sp on sp.specializations_id = rp.specializations_id
                            left join HumanResources.Career c on c.career_id = rp.career_id
                            left join HumanResources.Papers p on rp.papers_id = p.papers_id
                            left join HumanResources.PapersStorageType pst on pst.papers_storage_type_id = rp.papers_storage_type_id
                            left join HumanResources.PapersType pt on pt.papers_type_id = p.papers_type_id)
                            p4 
                            on p1.employee_id = p4.employee_id
                            left join
                            (select rp.papers_number,p.name as paper_name,rp.given_date,
                            pst.name as type_name, r.employee_id
                            from HumanResources.RecordsPapers rp
                            inner join HumanResources.Papers p on rp.papers_id = p.papers_id
                            inner join HumanResources.PapersStorageType pst on pst.papers_storage_type_id = rp.papers_storage_type_id
                            inner join HumanResources.Records r on r.records_id = rp.records_id)
                            p5
                            on p1.employee_id = p5.employee_id
                            left join
                            (select full_name as fa_full_name,date_of_birth as fa_date_of_birth,background,
                            ft.name as type_family,
                            fr.name as relationship,
                            f.employee_id
                            from HumanResources.Family f
                            inner join HumanResources.FamilyType ft on 
                            ft.family_type_id = f.family_type_id
                            inner join HumanResources.FamilyRelationship fr on 
                            fr.family_relationship_id = f.family_relationship_id)
                            p6
                            on p1.employee_id = p6.employee_id
                            ";

                        List<GetInside_Excel_Result> dic = db.Database.SqlQuery<GetInside_Excel_Result>(query).ToList();

                        int rowStart = 3;
                        foreach (var l in dic)
                        {
                            ws.Cells[rowStart, 1].Value = l.employee_id;
                            ws.Cells[rowStart, 2].Value = l.full_name;
                            ws.Cells[rowStart, 3].Value = l.date_of_birth.HasValue ? l.date_of_birth.Value.ToString("dd/MM/yyyy") : string.Empty;
                            ws.Cells[rowStart, 4].Value = l.social_insurance_number;
                            ws.Cells[rowStart, 5].Value = l.phone_number;
                            ws.Cells[rowStart, 6].Value = l.home_town;
                            ws.Cells[rowStart, 7].Value = l.current_residence;
                            ws.Cells[rowStart, 8].Value = l.identity_card;
                            ws.Cells[rowStart, 9].Value = l.academic_level;
                            ws.Cells[rowStart, 10].Value = l.received_date;
                            ws.Cells[rowStart, 11].Value = l.delivery_employee_name;
                            ws.Cells[rowStart, 12].Value = l.handover_employee_name;
                            ws.Cells[rowStart, 13].Value = l.management_employee_name;
                            ws.Cells[rowStart, 14].Value = l.recruitment_date;
                            ws.Cells[rowStart, 15].Value = l.recruitment_decision_date;
                            ws.Cells[rowStart, 16].Value = l.terminate_date.HasValue ? l.terminate_date.Value.ToString("dd/MM/yyyy") : string.Empty;
                            ws.Cells[rowStart, 17].Value = l.department_name;
                            ws.Cells[rowStart, 18].Value = l.termination_decision_date.HasValue ? l.termination_decision_date.Value.ToString("dd/MM/yyyy") : string.Empty;
                            ws.Cells[rowStart, 19].Value = l.termination_type;
                            ws.Cells[rowStart, 20].Value = l.paper_name;
                            ws.Cells[rowStart, 21].Value = l.type_name;
                            ws.Cells[rowStart, 22].Value = l.school_name;
                            ws.Cells[rowStart, 23].Value = l.spe_name;
                            ws.Cells[rowStart, 24].Value = l.career_name;
                            ws.Cells[rowStart, 25].Value = l.papers_number;
                            ws.Cells[rowStart, 26].Value = l.duration;
                            ws.Cells[rowStart, 27].Value = l.fa_full_name;
                            ws.Cells[rowStart, 28].Value = l.fa_date_of_birth;
                            ws.Cells[rowStart, 29].Value = l.background;
                            ws.Cells[rowStart, 30].Value = l.given_date.HasValue ? l.given_date.Value.ToString("dd/MM/yyyy") : string.Empty;
                            ws.Cells[rowStart, 31].Value = l.type_family;
                            ws.Cells[rowStart, 32].Value = l.relationship;
                            rowStart++;
                        }

                    }
                    excelPackage.SaveAs(new FileInfo(HostingEnvironment.MapPath(saveAsPath)));
                }
                return Json(new { success = true, location = saveAsPath }, JsonRequestBehavior.AllowGet);
            }

            catch (Exception e)
            {
                return null;
            }

        }

        [Auther(RightID = "130")]
        [Route("phong-tcld/chung-chi/danh-sach-ho-so-ngoai/xuat-file-excel")]
        [HttpPost]
        public ActionResult OutsideExportToExcel()
        {
            try
            {

                string path = HostingEnvironment.MapPath("/excel/TCLD/Hoso/ho-so-ngoai.xlsx");
                string saveAsPath = ("/excel/TCLD/download/ho-so-ngoai.xlsx");
                FileInfo file = new FileInfo(path);
                using (ExcelPackage excelPackage = new ExcelPackage(file))
                {
                    ExcelWorkbook excelWorkbook = excelPackage.Workbook;
                    ExcelWorksheet ws = excelWorkbook.Worksheets.First();
                    using (QuangHanhManufacturingEntities db = new QuangHanhManufacturingEntities())
                    {
                        string query = @"select * from 
                            (select e.employee_id,BASIC_INFO_full_name, gd.department_name,
                            BASIC_INFO_phone_number, BASIC_INFO_current_residence, 
                            BASIC_INFO_social_insurance_number, tb3.termination_name
                            from HumanResources.Employee e
                            inner join General.Department gd on gd.department_id = e.current_department_id
                            inner join HumanResources.Records r on r.employee_id = e.employee_id
                            left join (
                            select tb1.employee_id,tt1.name as termination_name 
                            from HumanResources.Termination tb1
                            inner join HumanResources.TerminationType tt1
                            on tb1.termination_type_id = tt1.termination_type_id
                            inner join 
                            (
                            select t.employee_id ,max(terminate_date) as terminate_date
                            from HumanResources.Termination t 
                            inner join HumanResources.TerminationType tt 
                            on tt.termination_type_id = t.termination_type_id
                            group by t.employee_id ) tb2
                            on  tb1.terminate_date = tb2.terminate_date and tb1.employee_id = tb2.employee_id) tb3
                            on tb3.employee_id = r.employee_id
                            where r.records_status_id = 2) 
                            p1
                            left join
                            (select e.employee_id,
                            BASIC_INFO_full_name as full_name
                            ,BASIC_INFO_date_of_birth as date_of_birth,
                            gd.department_name,
                            BASIC_INFO_phone_number as phone_number
                            , BASIC_INFO_current_residence as current_residence, 
                            BASIC_INFO_social_insurance_number as social_insurance_number
                            from HumanResources.Employee e
                            inner join General.Department gd on gd.department_id = e.current_department_id
                            inner join HumanResources.Records r on r.employee_id = e.employee_id)
                            p2
                            on p1.employee_id = p2.employee_id
                            left join
                            (select top 1 d.number as decision_number, tt.name as termination_name , 
                            d.date as decision_date , t.terminate_date , t.employee_id
                            from HumanResources.Decision d
                            inner join HumanResources.Termination t on t.decision_id = d.decision_id
                            inner join HumanResources.TerminationType tt on
                            t.termination_type_id = tt.termination_type_id
                            inner join HumanResources.Records r on r.employee_id = t.employee_id )
                            p3
                            on p1.employee_id = p3.employee_id
                            left join 
                            (select r.full_name as au_full_name,
                            r.identity_card_number as au_identity_card_number,
                            r.phone_number as au_phone_number,
                            fr.name as family_relationship_name, rs.employee_id
                            from HumanResources.RecordsGettingAuthorize r
                            inner join HumanResources.FamilyRelationship fr
                            on fr.family_relationship_id = r.family_relationship_id
                            inner join HumanResources.Records rs on rs.records_id = r.records_id)
                            p4
                            on p1.employee_id = p4.employee_id
                            left join
                            (select rp.papers_number,rp.papers_id,p.name as paper_name ,pst.name as type_name,
                            rp.received_date , rp.given_date , rp.records_papers_id, r.employee_id
                            from HumanResources.RecordsPapers rp
                            inner join HumanResources.Papers p on
                            p.papers_id = rp.papers_id
                            inner join HumanResources.PapersStorageType pst on 
                            pst.papers_storage_type_id = rp.papers_storage_type_id
                            inner join HumanResources.Records r on
                            r.records_id = rp.records_id)
                            p5
                            on p1.employee_id = p5.employee_id
                            ";

                        List<GetOutside_Excel_Result> dic = db.Database.SqlQuery<GetOutside_Excel_Result>(query).ToList();

                        int rowStart = 3;
                        foreach (var l in dic)
                        {
                            ws.Cells[rowStart, 1].Value = l.employee_id;
                            ws.Cells[rowStart, 2].Value = l.BASIC_INFO_full_name;
                            ws.Cells[rowStart, 3].Value = l.date_of_birth.HasValue ? l.date_of_birth.Value.ToString("dd/MM/yyyy") : string.Empty;
                            ws.Cells[rowStart, 4].Value = l.BASIC_INFO_phone_number;
                            ws.Cells[rowStart, 5].Value = l.department_name;
                            ws.Cells[rowStart, 6].Value = l.BASIC_INFO_current_residence;
                            ws.Cells[rowStart, 7].Value = l.BASIC_INFO_social_insurance_number;
                            ws.Cells[rowStart, 8].Value = l.termination_name;
                            ws.Cells[rowStart, 10].Value = l.decision_number;
                            ws.Cells[rowStart, 11].Value = l.au_full_name;
                            ws.Cells[rowStart, 12].Value = l.au_identity_card_number;
                            ws.Cells[rowStart, 13].Value = l.au_phone_number;
                            ws.Cells[rowStart, 14].Value = l.family_relationship_name;
                            ws.Cells[rowStart, 15].Value = l.papers_number;
                            ws.Cells[rowStart, 16].Value = l.paper_name;
                            ws.Cells[rowStart, 17].Value = l.type_name;
                            ws.Cells[rowStart, 18].Value = l.decision_date.HasValue ? l.decision_date.Value.ToString("dd/MM/yyyy") : string.Empty;
                            ws.Cells[rowStart, 19].Value = l.terminate_date.HasValue ? l.terminate_date.Value.ToString("dd/MM/yyyy") : string.Empty;
                            ws.Cells[rowStart, 20].Value = l.given_date.HasValue ? l.given_date.Value.ToString("dd/MM/yyyy") : string.Empty;
                            ws.Cells[rowStart, 21].Value = l.received_date.HasValue ? l.received_date.Value.ToString("dd/MM/yyyy") : string.Empty;
                            rowStart++;
                        }

                    }
                    excelPackage.SaveAs(new FileInfo(HostingEnvironment.MapPath(saveAsPath)));
                }
                return Json(new { success = true, location = saveAsPath }, JsonRequestBehavior.AllowGet);
            }

            catch (Exception e)
            {
                return null;
            }

        }
    }
}
