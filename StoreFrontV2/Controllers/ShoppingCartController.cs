using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StoreFrontV2.Models;

namespace StoreFrontV2.Controllers
{
    public class ShoppingCartController : Controller
    {
        
        public ActionResult Index()
        {
            
            var shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];

            if (shoppingCart == null || shoppingCart.Count == 0)
            {
     
                shoppingCart = new Dictionary<int, CartItemViewModel>();

                ViewBag.Message = "There are not items in your cart";
            }
            else
            {
                ViewBag.Message = null;
            }

            return View(shoppingCart);
        }

        public ActionResult UpdateCart(int oddityID, int qty)
        {
            Dictionary<int, CartItemViewModel> shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];

            shoppingCart[oddityID].Qty = qty;

            Session["cart"] = shoppingCart;

            return RedirectToAction("Index");
        }

        public ActionResult RemoveFromCart(int id)
        {
            Dictionary<int, CartItemViewModel> shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];

            shoppingCart.Remove(id);


            return RedirectToAction("Index");
        }

    }
}