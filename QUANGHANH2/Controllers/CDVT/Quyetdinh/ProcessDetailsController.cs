﻿using QUANGHANH2.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QUANGHANH2.Controllers.CDVT.Quyetdinh
{
    public class ProcessDetailsController : Controller
    {
        [Route("phong-cdvt/quyet-dinh/GetSupply")]
        [HttpPost]
        public ActionResult GetSupply(string documentary_id, string equipmentId)
        {
            QuangHanhManufacturingEntities DBContext = new QuangHanhManufacturingEntities();
            List<Supply_Detail> supplies = DBContext.Database.SqlQuery<Supply_Detail>("SELECT doc.supply_id as MaVT,s.supply_name as TenVT,doc.quantity_plan as SLVT FROM Supply_Documentary_Equipment doc INNER JOIN Supply s on doc.supply_id = s.supply_id WHERE doc.equipmentId = @equipmentId AND doc.documentary_id = @documentary_id",
                new SqlParameter("equipmentId", equipmentId),
                new SqlParameter("documentary_id", documentary_id)).ToList();
            int count = supplies.Count;
            if (count == 0)
            {
                return Json(new
                {
                    success = false,
                    data = supplies,
                    message = "Không có vật tư nào!"
                }, JsonRequestBehavior.AllowGet);
            }
            else
                return Json(new
                {
                    success = true,
                    data = supplies
                }, JsonRequestBehavior.AllowGet);

        }
        public class Supply_Detail
        {
            public string MaVT { get; set; }
            public string TenVT { get; set; }
            public int SLVT { get; set; }
        }
    }
}