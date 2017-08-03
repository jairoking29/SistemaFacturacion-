using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using SF.Models;

namespace SF.Controllers
{
    public class AsientosContablesController : Controller
    {
        private SistemaFacturacionEntities db = new SistemaFacturacionEntities();

        // GET: AsientosContables
        public ActionResult Index()
        {
            var asientosContables = db.AsientosContables.Include(a => a.Clientes).Include(a => a.Clientes);
            return View(asientosContables.ToList());
        }

        // GET: AsientosContables/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AsientosContables asientosContables = db.AsientosContables.Find(id);
            if (asientosContables == null)
            {
                return HttpNotFound();
            }
            return View(asientosContables);
        }

        // GET: AsientosContables/Create
        public ActionResult Create()
        {
            ViewBag.Id_Cliente = new SelectList(db.Clientes, "Id_Cliente", "nombreComercial");
            ViewBag.Id_Cliente = new SelectList(db.Clientes, "Id_Cliente", "nombreComercial");
            return View();
        }

        // POST: AsientosContables/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id_AsientoContable,Id_Cliente,Descripcion,Cuenta,TipoMovimiento,FechaAsiento,MontoAsiento,Estado")] AsientosContables asientosContables)
        {
            if (ModelState.IsValid)
            {
                db.AsientosContables.Add(asientosContables);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Id_Cliente = new SelectList(db.Clientes, "Id_Cliente", "nombreComercial", asientosContables.Id_Cliente);
            ViewBag.Id_Cliente = new SelectList(db.Clientes, "Id_Cliente", "nombreComercial", asientosContables.Id_Cliente);
            return View(asientosContables);
        }

        // GET: AsientosContables/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AsientosContables asientosContables = db.AsientosContables.Find(id);
            if (asientosContables == null)
            {
                return HttpNotFound();
            }
            ViewBag.Id_Cliente = new SelectList(db.Clientes, "Id_Cliente", "nombreComercial", asientosContables.Id_Cliente);
            ViewBag.Id_Cliente = new SelectList(db.Clientes, "Id_Cliente", "nombreComercial", asientosContables.Id_Cliente);
            return View(asientosContables);
        }

        // POST: AsientosContables/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id_AsientoContable,Id_Cliente,Descripcion,Cuenta,TipoMovimiento,FechaAsiento,MontoAsiento,Estado")] AsientosContables asientosContables)
        {
            if (ModelState.IsValid)
            {
                db.Entry(asientosContables).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Id_Cliente = new SelectList(db.Clientes, "Id_Cliente", "nombreComercial", asientosContables.Id_Cliente);
            ViewBag.Id_Cliente = new SelectList(db.Clientes, "Id_Cliente", "nombreComercial", asientosContables.Id_Cliente);
            return View(asientosContables);
        }

        // GET: AsientosContables/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AsientosContables asientosContables = db.AsientosContables.Find(id);
            if (asientosContables == null)
            {
                return HttpNotFound();
            }
            return View(asientosContables);
        }

        // POST: AsientosContables/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            AsientosContables asientosContables = db.AsientosContables.Find(id);
            db.AsientosContables.Remove(asientosContables);
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
