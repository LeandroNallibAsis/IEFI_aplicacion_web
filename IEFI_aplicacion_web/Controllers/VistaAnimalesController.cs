using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using IEFI_aplicacion_web.Models;

namespace IEFI_aplicacion_web.Controllers
{
    public class VistaAnimalesController : Controller
    {
        private Veterinari_PampitaEntities1 db = new Veterinari_PampitaEntities1();

        // GET: VistaAnimales
        public ActionResult Index()
        {
            return View(db.VistaAnimales.ToList());
        }

        // GET: VistaAnimales/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            VistaAnimales vistaAnimales = db.VistaAnimales.Find(id);
            if (vistaAnimales == null)
            {
                return HttpNotFound();
            }
            return View(vistaAnimales);
        }

        // GET: VistaAnimales/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: VistaAnimales/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Nombre,Fecha_Alta,Fecha_Baja,ID")] VistaAnimales vistaAnimales)
        {
            if (ModelState.IsValid)
            {
                db.VistaAnimales.Add(vistaAnimales);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(vistaAnimales);
        }

        // GET: VistaAnimales/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            VistaAnimales vistaAnimales = db.VistaAnimales.Find(id);
            if (vistaAnimales == null)
            {
                return HttpNotFound();
            }
            return View(vistaAnimales);
        }

        // POST: VistaAnimales/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Nombre,Fecha_Alta,Fecha_Baja,ID")] VistaAnimales vistaAnimales)
        {
            if (ModelState.IsValid)
            {
                db.Entry(vistaAnimales).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(vistaAnimales);
        }

        // GET: VistaAnimales/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            VistaAnimales vistaAnimales = db.VistaAnimales.Find(id);
            if (vistaAnimales == null)
            {
                return HttpNotFound();
            }
            return View(vistaAnimales);
        }

        // POST: VistaAnimales/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            VistaAnimales vistaAnimales = db.VistaAnimales.Find(id);
            db.VistaAnimales.Remove(vistaAnimales);
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
