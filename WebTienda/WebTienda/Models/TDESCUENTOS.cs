//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebTienda.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class TDESCUENTOS
    {
        public int CODPRODUCTO { get; set; }
        public Nullable<int> CANTIDAD { get; set; }
        public Nullable<decimal> DESCUENTOS { get; set; }
        public int CODFACTURA { get; set; }
    
        public virtual TFACTURA TFACTURA { get; set; }
        public virtual TPRODUCTOS TPRODUCTOS { get; set; }
    }
}