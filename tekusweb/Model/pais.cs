namespace Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class pais
    {
        public int? id { get; set; }

        [Column("pais")]
        [StringLength(50)]
        public string pais1 { get; set; }

        [Key]
        public int idpais { get; set; }

        public virtual servicio servicio { get; set; }
    }
}
