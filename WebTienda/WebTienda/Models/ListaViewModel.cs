using PagedList;     // paginador de listas
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebTienda.Models
{
    /// <summary>
    /// Modelo Vista de TProductos
    /// </summary>
    public class ListaViewModel
    {
        //public List<TPRODUCTOS> tPRODUCTOs { get; set; }
        public IPagedList<TPRODUCTOS> tproducto { get; set; }
    }

}