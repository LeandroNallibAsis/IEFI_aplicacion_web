//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace IEFI_aplicacion_web.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Razas
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Razas()
        {
            this.Mascotas = new HashSet<Mascotas>();
        }
    
        public int ID { get; set; }
        public string Nombre { get; set; }
        public Nullable<int> ID_Animal { get; set; }
        public Nullable<System.DateTime> Fecha_Alta { get; set; }
        public Nullable<System.DateTime> Fecha_Baja { get; set; }
    
        public virtual Animales Animales { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Mascotas> Mascotas { get; set; }
    }
}
