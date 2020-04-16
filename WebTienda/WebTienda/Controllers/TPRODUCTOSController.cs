using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebTienda.Models;

namespace WebTienda.Controllers
{
    public class TPRODUCTOSController : Controller
    {
        private EntidadesLibreria db = new EntidadesLibreria();

        // GET: TPRODUCTOS
        public ActionResult Index()
        {
            return View(db.TPRODUCTOS.ToList());
        }

        // GET: TPRODUCTOS/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TPRODUCTOS tPRODUCTOS = db.TPRODUCTOS.Find(id);
            if (tPRODUCTOS == null)
            {
                return HttpNotFound();
            }
            return View(tPRODUCTOS);
        }

        // GET: TPRODUCTOS/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: TPRODUCTOS/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CODPRODUCTO,PRODUCTO,VALOR")] TPRODUCTOS tPRODUCTOS)
        {
            if (ModelState.IsValid)
            {
                db.TPRODUCTOS.Add(tPRODUCTOS);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tPRODUCTOS);
        }

        // GET: TPRODUCTOS/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TPRODUCTOS tPRODUCTOS = db.TPRODUCTOS.Find(id);
            if (tPRODUCTOS == null)
            {
                return HttpNotFound();
            }
            return View(tPRODUCTOS);
        }

        // POST: TPRODUCTOS/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CODPRODUCTO,PRODUCTO,VALOR")] TPRODUCTOS tPRODUCTOS)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tPRODUCTOS).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tPRODUCTOS);
        }

        // GET: TPRODUCTOS/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TPRODUCTOS tPRODUCTOS = db.TPRODUCTOS.Find(id);
            if (tPRODUCTOS == null)
            {
                return HttpNotFound();
            }
            return View(tPRODUCTOS);
        }

        // POST: TPRODUCTOS/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TPRODUCTOS tPRODUCTOS = db.TPRODUCTOS.Find(id);
            db.TPRODUCTOS.Remove(tPRODUCTOS);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
