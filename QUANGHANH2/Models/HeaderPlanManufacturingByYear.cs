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
    
    public partial class HeaderPlanManufacturingByYear
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public HeaderPlanManufacturingByYear()
        {
            this.PlanManufacturingByYears = new HashSet<PlanManufacturingByYear>();
        }
    
        public int header_plan_manufacturing_by_year_id { get; set; }
        public string department_id { get; set; }
        public string year { get; set; }
        public string note { get; set; }
    
        public virtual Department Department { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlanManufacturingByYear> PlanManufacturingByYears { get; set; }
    }
}
