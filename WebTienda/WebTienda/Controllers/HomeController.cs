using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebTienda.Models;
using PagedList;

namespace WebTienda.Controllers
{
    public class HomeController : Controller
    {

        private IRepositorio repository;
        private const int NumeroItemsPorPagina = 4;


        private EntidadesLibreria db = new EntidadesLibreria();

        public int PageSize = 2;
        public ActionResult Index()
        {

            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult RacerHoodie()
        {
            return View();
        }

        public ActionResult ExplorerHoodie()
        {
            return View();
        }

        public ActionResult FishermanTS()
        {
            return View();
        }

        public ActionResult MontainWare()
        {
            return View();
        }

        public ActionResult MarketTS()
        {
            return View();
        }

        public ActionResult BrewskiHoodie()
        {
            return View();
        }

        public ActionResult MontainTShirt()
        {
            return View();
        }

        public ActionResult MointainBikeTShirt()
        {
            return View();
        }

        public ActionResult MountainwareHoodie()
        {
            return View();
        }

        public ActionResult CoffeeTShirt()
        {
            return View();
        }

        public ActionResult Contact(int? pagina)
        {
            ViewBag.Message = "Listado de Productos";
            //var _lista = db.TPRODUCTOS.ToList();
            //return View(_lista
            //            .OrderBy(p => p.CODPRODUCTO)
            //            .Skip((page - 1) * PageSize)
            //            .Take(PageSize));
            int pageNumber = (pagina ?? 1);
            var viewModel = new ListaViewModel
            {
                tproducto = db.TPRODUCTOS
                .OrderByDescending(m => m.PRODUCTO)
                .ToPagedList(pageNumber, pageSize: NumeroItemsPorPagina)
            };
            var _LtsProd = viewModel;
            return View(viewModel);
        }

        public ActionResult ListaProductosAPI()
        {
            return View();
        }



    }

}