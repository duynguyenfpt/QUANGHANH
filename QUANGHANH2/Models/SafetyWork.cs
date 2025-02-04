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
    
    public partial class SafetyWork
    {
        public int safety_work_id { get; set; }
        public string employee_id { get; set; }
        public string reason { get; set; }
        public Nullable<System.DateTime> date { get; set; }
        public Nullable<int> shifts_id { get; set; }
        public Nullable<int> safety_work_type_id { get; set; }
        public string note { get; set; }
    
        public virtual Employee Employee { get; set; }
        public virtual SafetyWorkType SafetyWorkType { get; set; }
        public virtual Shift Shift { get; set; }
    }
}
