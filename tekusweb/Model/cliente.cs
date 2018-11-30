namespace Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Linq;

    [Table("cliente")]
    public partial class cliente
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public cliente()
        {
            servicio = new HashSet<servicio>();
        }

        public int id { get; set; }

        public int? nit { get; set; }

        [StringLength(50)]
        public string nombre { get; set; }

        [StringLength(50)]
        public string correo { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<servicio> servicio { get; set; }

        public List<cliente> Listar()
        {
            var clientes = new List<cliente>();

            try
            {
                using (var ctx = new tekusContext())
                {
                    clientes = ctx.cliente.ToList();
                }
            }
            catch (Exception E)
            {

                throw;
            }

            return clientes;
        }

    }
}
