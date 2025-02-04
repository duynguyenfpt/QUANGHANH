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
    
    public partial class CarMaintenance
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CarMaintenance()
        {
            this.CarMaintenanceDetails = new HashSet<CarMaintenanceDetail>();
        }
    
        public int maintain_id { get; set; }
        public string equipment_id { get; set; }
        public System.DateTime date { get; set; }
        public string department_id { get; set; }
        public string maintain_content { get; set; }
    
        public virtual Equipment Equipment { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CarMaintenanceDetail> CarMaintenanceDetails { get; set; }
        public virtual Department Department { get; set; }
    }
}
