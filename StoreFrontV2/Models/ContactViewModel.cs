using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace StoreFrontV2.Models
{
    public class ContactViewModel
    {
        [Required(ErrorMessage = "Aint no Games when it comes to Names bruh bruh")]
        public string Name { get; set; }
        [Required(ErrorMessage = "Aint no Fails when it comes to Emails bruh bruh")]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }
        public string Subject { get; set; }
        [Required(ErrorMessage = "Aint no Lesson when it comes to a Message bruh bruh")]
        [StringLength(250, ErrorMessage = "You got too much strength for this length bruh bruh")]
        [UIHint("MultilineText")]
        public string Message { get; set; }
    }
}