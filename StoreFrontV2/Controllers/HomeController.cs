using StoreFrontV2.Models;
using System.Web.Mvc;
using System.Net;
using System.Net.Mail;
using System;

namespace IdentitySample.Controllers
{
    public class HomeController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        [HttpGet]
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Contact(ContactViewModel cvm)
        {

            if (!ModelState.IsValid)
            {

                return View(cvm);
            }

            string body = $"You have recieved an email from {cvm.Name} with a subject of {cvm.Subject}. Please respond to {cvm.Email} in regards to the following email: <br><br>{cvm.Message}";

            MailMessage msg = new MailMessage("admin@jamesearp.com", "jamesaearp@outlook.com", "Something about the Store", body);
            //2) OPTIONAL: Customize the MailMessage -- set priority, add attachments, enable html...
            msg.IsBodyHtml = true;
            msg.Priority = MailPriority.High;
            //3) Create the SmtpClient
            SmtpClient client = new SmtpClient("mail.jamesearp.com");
            client.Credentials = new NetworkCredential("admin@jamesearp.com", "Incorrect1999#");
            client.Port = 8889;
            //4) Attempt to send the email
            try
            {
                client.Send(msg);
            }
            catch (Exception ex)
            {
                ViewBag.SendEmailError = $"You have angered the Souls of the Dead. The Oracle states: {ex.Message}";
                return View(cvm);

            }
            return View("EmailConfirmation", cvm);
        }

        [HttpGet]
        public ActionResult Blog()
        {
            ViewBag.Message = "Your blog page.";

            return View();
        }

        [HttpGet]
        public ActionResult Portfolio()
        {
            ViewBag.Message = "Your portfolio page.";

            return View();
        }
    }
}
