namespace Model
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class tekusContext : DbContext
    {
        public tekusContext()
            : base("name=tekusContext")
        {
        }

        public virtual DbSet<cliente> cliente { get; set; }
        public virtual DbSet<pais> pais { get; set; }
        public virtual DbSet<servicio> servicio { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<cliente>()
                .HasMany(e => e.servicio)
                .WithOptional(e => e.cliente)
                .HasForeignKey(e => e.idcliente);
        }
    }
}
