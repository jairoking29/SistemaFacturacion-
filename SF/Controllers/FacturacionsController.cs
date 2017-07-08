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
    public class FacturacionsController : Controller
    {
        private SistemaFacturacionEntities db = new SistemaFacturacionEntities();

        // GET: Facturacions
        public ActionResult Index()
        {
            var facturacion = db.Facturacion.Include(f => f.Articulos).Include(f => f.Articulos1).Include(f => f.Clientes).Include(f => f.Clientes1).Include(f => f.Vendedores).Include(f => f.Vendedores1);
            return View(facturacion.ToList());
        }

        // GET: Facturacions/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Facturacion facturacion = db.Facturacion.Find(id);
            if (facturacion == null)
            {
                return HttpNotFound();
            }
            return View(facturacion);
        }

        // GET: Facturacions/Create
        public ActionResult Create()
        {
            ViewBag.Id_Articulo = new SelectList(db.Articulos, "Id_Articulo", "Descripcion");
            ViewBag.Id_Articulo = new SelectList(db.Articulos, "Id_Articulo", "Descripcion");
            ViewBag.Id_Cliente = new SelectList(db.Clientes, "Id_Cliente", "nombreComercial");
            ViewBag.Id_Cliente = new SelectList(db.Clientes, "Id_Cliente", "nombreComercial");
            ViewBag.Id_Vendedor = new SelectList(db.Vendedores, "Id_Vendedor", "Nombre");
            ViewBag.Id_Vendedor = new SelectList(db.Vendedores, "Id_Vendedor", "Nombre");
            return View();
        }

        // POST: Facturacions/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id_Factura,Id_Vendedor,Id_Cliente,Id_Articulo,Fecha,Comentario,Cantidad,PrecioUnitario")] Facturacion facturacion)
        {
            if (ModelState.IsValid)
            {
                db.Facturacion.Add(facturacion);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Id_Articulo = new SelectList(db.Articulos, "Id_Articulo", "Descripcion", facturacion.Id_Articulo);
            ViewBag.Id_Articulo = new SelectList(db.Articulos, "Id_Articulo", "Descripcion", facturacion.Id_Articulo);
            ViewBag.Id_Cliente = new SelectList(db.Clientes, "Id_Cliente", "nombreComercial", facturacion.Id_Cliente);
            ViewBag.Id_Cliente = new SelectList(db.Clientes, "Id_Cliente", "nombreComercial", facturacion.Id_Cliente);
            ViewBag.Id_Vendedor = new SelectList(db.Vendedores, "Id_Vendedor", "Nombre", facturacion.Id_Vendedor);
            ViewBag.Id_Vendedor = new SelectList(db.Vendedores, "Id_Vendedor", "Nombre", facturacion.Id_Vendedor);
            return View(facturacion);
        }

        // GET: Facturacions/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Facturacion facturacion = db.Facturacion.Find(id);
            if (facturacion == null)
            {
                return HttpNotFound();
            }
            ViewBag.Id_Articulo = new SelectList(db.Articulos, "Id_Articulo", "Descripcion", facturacion.Id_Articulo);
            ViewBag.Id_Articulo = new SelectList(db.Articulos, "Id_Articulo", "Descripcion", facturacion.Id_Articulo);
            ViewBag.Id_Cliente = new SelectList(db.Clientes, "Id_Cliente", "nombreComercial", facturacion.Id_Cliente);
            ViewBag.Id_Cliente = new SelectList(db.Clientes, "Id_Cliente", "nombreComercial", facturacion.Id_Cliente);
            ViewBag.Id_Vendedor = new SelectList(db.Vendedores, "Id_Vendedor", "Nombre", facturacion.Id_Vendedor);
            ViewBag.Id_Vendedor = new SelectList(db.Vendedores, "Id_Vendedor", "Nombre", facturacion.Id_Vendedor);
            return View(facturacion);
        }

        // POST: Facturacions/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id_Factura,Id_Vendedor,Id_Cliente,Id_Articulo,Fecha,Comentario,Cantidad,PrecioUnitario")] Facturacion facturacion)
        {
            if (ModelState.IsValid)
            {
                db.Entry(facturacion).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Id_Articulo = new SelectList(db.Articulos, "Id_Articulo", "Descripcion", facturacion.Id_Articulo);
            ViewBag.Id_Articulo = new SelectList(db.Articulos, "Id_Articulo", "Descripcion", facturacion.Id_Articulo);
            ViewBag.Id_Cliente = new SelectList(db.Clientes, "Id_Cliente", "nombreComercial", facturacion.Id_Cliente);
            ViewBag.Id_Cliente = new SelectList(db.Clientes, "Id_Cliente", "nombreComercial", facturacion.Id_Cliente);
            ViewBag.Id_Vendedor = new SelectList(db.Vendedores, "Id_Vendedor", "Nombre", facturacion.Id_Vendedor);
            ViewBag.Id_Vendedor = new SelectList(db.Vendedores, "Id_Vendedor", "Nombre", facturacion.Id_Vendedor);
            return View(facturacion);
        }

        // GET: Facturacions/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Facturacion facturacion = db.Facturacion.Find(id);
            if (facturacion == null)
            {
                return HttpNotFound();
            }
            return View(facturacion);
        }

        // POST: Facturacions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Facturacion facturacion = db.Facturacion.Find(id);
            db.Facturacion.Remove(facturacion);
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
