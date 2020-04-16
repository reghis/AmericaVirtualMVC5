using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebTienda.Controllers
{
    public class HomeController : Controller
    {

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


        public ActionResult Contact()
        {
            ViewBag.Message = "Listado de Productos";

            return View();
        }
    }

}