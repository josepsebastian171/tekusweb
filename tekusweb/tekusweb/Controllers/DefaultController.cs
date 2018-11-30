using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model;

namespace tekusweb.Controllers
{
    public class DefaultController : Controller
    {
        // GET: Default
        private cliente cliente = new cliente();
        
        public ActionResult Index()
        {
            return View(cliente.Listar());
        }

        public ActionResult verCliente(int id = 0)
        {
            return View(cliente.verCliente(id));
        }
    }
}