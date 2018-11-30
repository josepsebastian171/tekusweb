namespace Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("servicio")]
    public partial class servicio
    {
        public int id { get; set; }

        [StringLength(50)]
        public string nombre { get; set; }

        public float? valor { get; set; }

        public int? idcliente { get; set; }

        public virtual cliente cliente { get; set; }
    }
}
