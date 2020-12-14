using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StoreFrontEFSecured.DATA.EF;
using System.ComponentModel.DataAnnotations;

namespace StoreFrontV2.Models
{
    public class CartItemViewModel
    {
        [Range(1, int.MaxValue)]//Ensure values are greater than 0
        public int Qty { get; set; }

        public Oddity Product { get; set; }

        //Fully-Qualified ctor
        public CartItemViewModel(int qty, Oddity product)
        {
            Qty = qty;
            Product = product;
        }
    }
}