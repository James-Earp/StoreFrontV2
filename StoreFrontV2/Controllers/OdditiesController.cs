using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using StoreFrontEFSecured.DATA.EF;
using StoreFrontV2.Models;

namespace StoreFrontV2.Controllers
{
    public class OdditiesController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();

        // GET: Oddities
        public ActionResult Index()
        {
            var oddities = db.Oddities.Include(o => o.Genre).Include(o => o.OddityStatu).Include(o => o.Origin);
            return View(oddities.ToList());
        }

        // GET: Oddities/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Oddity oddity = db.Oddities.Find(id);
            if (oddity == null)
            {
                return HttpNotFound();
            }
            return View(oddity);
        }

        #region Add to Cart
        public ActionResult AddToCart(int qty, int oddityID)
        {
            //Create an empty shell for the local shopping cart variable
            //A dictionary is a collection. It holds a key and a value per record.
            //Local version of our cart
            Dictionary<int, CartItemViewModel> shoppingCart = null;

            //Check if a session-cart exists; if so, use it to populate local version
            //By default a session will last for 20 minutes. After 20 minutes of inactivity the session will expire.
            if (Session["cart"] != null)
            {
                //Session cart exists - put the items in local version, which is easier to work with.
                shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];
                //When we unbox session object to its smaller more specific type, we use explicit casting
            }
            else
            {
                //if session cart does not exist yet, we need to "instantiate it"
                shoppingCart = new Dictionary<int, CartItemViewModel>();
            }
            //We now have a local cart thats ready to add things to it.

            //Find the product they referenced by ID
            Oddity product = db.Oddities.Where(b => b.OddityID == oddityID).FirstOrDefault();

            if (product == null)
            {
                //if they sent in a bad ID, kick them back to some page to try again
                return RedirectToAction("Index");
            }
            else
            {
                //If a book is valid, add the line-item to card
                CartItemViewModel item = new CartItemViewModel(qty, product);

                //Put the item in the local cart but if we already have that product as a cart item then update the qty instead. This is the main reason we use a dictionary.
                if (shoppingCart.ContainsKey(product.OddityID))
                {
                    shoppingCart[product.OddityID].Qty += qty;
                }
                else
                {
                    shoppingCart.Add(product.OddityID, item);
                }
                //Update the session version of the cart so we can maintain info between requests
                Session["cart"] = shoppingCart;// No casting because we are going from a smaller to a larger container

                //Confirmation message goes into session to be available after the redirect
                Session["confirm"] = $"'{product.OddityName}' (Quantity: {qty} added to cart.";

            }
            return RedirectToAction("Index", "ShoppingCart");

        }
        #endregion

        // GET: Oddities/Create
        public ActionResult Create()
        {
            ViewBag.GenreID = new SelectList(db.Genres, "GenreID", "Genre1");
            ViewBag.OddityStatusID = new SelectList(db.OddityStatus, "OddityStatusID", "Status");
            ViewBag.OddityID = new SelectList(db.Origins, "OriginID", "Origin1");
            return View();
        }

        // POST: Oddities/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "OddityID,OddityName,OriginID,RecoveryDate,Price,OddityStatusID,GenreID,UnitsSold")] Oddity oddity)
        {
            if (ModelState.IsValid)
            {
                db.Oddities.Add(oddity);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.GenreID = new SelectList(db.Genres, "GenreID", "Genre1", oddity.GenreID);
            ViewBag.OddityStatusID = new SelectList(db.OddityStatus, "OddityStatusID", "Status", oddity.OddityStatusID);
            ViewBag.OddityID = new SelectList(db.Origins, "OriginID", "Origin1", oddity.OddityID);
            return View(oddity);
        }

        // GET: Oddities/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Oddity oddity = db.Oddities.Find(id);
            if (oddity == null)
            {
                return HttpNotFound();
            }
            ViewBag.GenreID = new SelectList(db.Genres, "GenreID", "Genre1", oddity.GenreID);
            ViewBag.OddityStatusID = new SelectList(db.OddityStatus, "OddityStatusID", "Status", oddity.OddityStatusID);
            ViewBag.OddityID = new SelectList(db.Origins, "OriginID", "Origin1", oddity.OddityID);
            return View(oddity);
        }

        // POST: Oddities/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "OddityID,OddityName,OriginID,RecoveryDate,Price,OddityStatusID,GenreID,UnitsSold")] Oddity oddity)
        {
            if (ModelState.IsValid)
            {
                db.Entry(oddity).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.GenreID = new SelectList(db.Genres, "GenreID", "Genre1", oddity.GenreID);
            ViewBag.OddityStatusID = new SelectList(db.OddityStatus, "OddityStatusID", "Status", oddity.OddityStatusID);
            ViewBag.OddityID = new SelectList(db.Origins, "OriginID", "Origin1", oddity.OddityID);
            return View(oddity);
        }

        // GET: Oddities/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Oddity oddity = db.Oddities.Find(id);
            if (oddity == null)
            {
                return HttpNotFound();
            }
            return View(oddity);
        }

        // POST: Oddities/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Oddity oddity = db.Oddities.Find(id);
            db.Oddities.Remove(oddity);
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
