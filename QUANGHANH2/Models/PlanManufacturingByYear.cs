//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace QUANGHANH2.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class PlanManufacturingByYear
    {
        public int header_plan_manufacturing_by_year_id { get; set; }
        public int criteria_id { get; set; }
        public string plan_quantity { get; set; }
        public System.DateTime last_time_update { get; set; }
        public string note { get; set; }
    
        public virtual Criterion Criterion { get; set; }
        public virtual HeaderPlanManufacturingByYear HeaderPlanManufacturingByYear { get; set; }
    }
}
