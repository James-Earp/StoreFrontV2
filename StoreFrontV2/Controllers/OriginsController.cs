using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using StoreFrontEFSecured.DATA.EF;

namespace StoreFrontV2.Controllers
{
    public class OriginsController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();


      


        // GET: Origins
        public ActionResult Index()
        {
            var origins = db.Origins.Include(o => o.Oddity);
            return View(origins.ToList());
        }
  #region OG Content
        //// GET: Origins/Details/5
        //public ActionResult Details(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Origin origin = db.Origins.Find(id);
        //    if (origin == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(origin);
        //}

        //// GET: Origins/Create
        //public ActionResult Create()
        //{
        //    ViewBag.OriginID = new SelectList(db.Oddities, "OddityID", "OddityName");
        //    return View();
        //}

        //// POST: Origins/Create
        //// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        //// more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Create([Bind(Include = "OriginID,Origin1")] Origin origin)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Origins.Add(origin);
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }

        //    ViewBag.OriginID = new SelectList(db.Oddities, "OddityID", "OddityName", origin.OriginID);
        //    return View(origin);
        //}

        //// GET: Origins/Edit/5
        //public ActionResult Edit(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Origin origin = db.Origins.Find(id);
        //    if (origin == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    ViewBag.OriginID = new SelectList(db.Oddities, "OddityID", "OddityName", origin.OriginID);
        //    return View(origin);
        //}

        //// POST: Origins/Edit/5
        //// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        //// more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Edit([Bind(Include = "OriginID,Origin1")] Origin origin)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Entry(origin).State = EntityState.Modified;
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }
        //    ViewBag.OriginID = new SelectList(db.Oddities, "OddityID", "OddityName", origin.OriginID);
        //    return View(origin);
        //}

        //// GET: Origins/Delete/5
        //public ActionResult Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Origin origin = db.Origins.Find(id);
        //    if (origin == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(origin);
        //}

        //// POST: Origins/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    Origin origin = db.Origins.Find(id);
        //    db.Origins.Remove(origin);
        //    db.SaveChanges();
        //    return RedirectToAction("Index");
        //}
        #endregion

        [AcceptVerbs(HttpVerbs.Post)]
        public JsonResult AjaxDelete(int id)
        {
            Origin origin = db.Origins.Find(id);
            db.Origins.Remove(origin);
            db.SaveChanges();

            string confirmMessage = string.Format("Deleted Origin '{0}' from the database.", origin.Origin1);
            return Json(new { id = id, message = confirmMessage });
        }

        [HttpGet]
        public PartialViewResult OriginDetails(int id)
        {
            Origin origin = db.Origins.Find(id);
            return PartialView(origin);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public JsonResult AjaxCreate(Origin origin)
        {
            db.Origins.Add(origin);
            db.SaveChanges();
            return Json(origin);
        }

        [HttpGet]
        public PartialViewResult OriginEdit(int id)
        {
            Origin origin = db.Origins.Find(id);
            return PartialView(origin);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public JsonResult AjaxEdit(Origin origin)
        {
            db.Entry(origin).State = EntityState.Modified;
            db.SaveChanges();
            return Json(origin);
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
