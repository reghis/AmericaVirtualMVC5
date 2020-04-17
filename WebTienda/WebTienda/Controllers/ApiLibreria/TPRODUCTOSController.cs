using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using WebTienda.Models;

namespace WebTienda.Controllers.ApiLibreria
{
    public class TPRODUCTOSController : ApiController
    {
        private EntidadesLibreria db = new EntidadesLibreria();    // COntext

        // GET: api/TPRODUCTOS IHttpActionResult 
        public IHttpActionResult GetTPRODUCTOS()
        {
            var Lista = db.TPRODUCTOS.ToList();
            List<Productos> _lst = new List<Productos>();

            foreach (var item in Lista)
            {
                Productos _p = new Productos()
                {
                    CODPRODUCTO = item.CODPRODUCTO,
                    PRODUCTO = item.PRODUCTO,
                    VALOR = item.VALOR ==null? 0: Convert.ToDecimal(item.VALOR),
                };
                _lst.Add(_p);
            }
            return Ok(_lst);
        }

        // GET: api/TPRODUCTOS/5
        [ResponseType(typeof(TPRODUCTOS))]
        public IHttpActionResult GetTPRODUCTOS(int id)
        {
            TPRODUCTOS tPRODUCTOS = db.TPRODUCTOS.Find(id);
            if (tPRODUCTOS == null)
            {
                return NotFound();
            }

            return Ok(tPRODUCTOS);
        }

        // PUT: api/TPRODUCTOS/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutTPRODUCTOS(int id, TPRODUCTOS tPRODUCTOS)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != tPRODUCTOS.CODPRODUCTO)
            {
                return BadRequest();
            }

            db.Entry(tPRODUCTOS).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TPRODUCTOSExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/TPRODUCTOS
        [ResponseType(typeof(TPRODUCTOS))]
        public IHttpActionResult PostTPRODUCTOS(TPRODUCTOS tPRODUCTOS)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.TPRODUCTOS.Add(tPRODUCTOS);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (TPRODUCTOSExists(tPRODUCTOS.CODPRODUCTO))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = tPRODUCTOS.CODPRODUCTO }, tPRODUCTOS);
        }

        // DELETE: api/TPRODUCTOS/5
        [ResponseType(typeof(TPRODUCTOS))]
        public IHttpActionResult DeleteTPRODUCTOS(int id)
        {
            TPRODUCTOS tPRODUCTOS = db.TPRODUCTOS.Find(id);
            if (tPRODUCTOS == null)
            {
                return NotFound();
            }

            db.TPRODUCTOS.Remove(tPRODUCTOS);
            db.SaveChanges();

            return Ok(tPRODUCTOS);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool TPRODUCTOSExists(int id)
        {
            return db.TPRODUCTOS.Count(e => e.CODPRODUCTO == id) > 0;
        }
    }
}