﻿using System.Web.Mvc;
using Zk.Models;
using Zk.Repositories;
using System.Linq;
using System.Net;

namespace Zk.Controllers
{
    public class FarmingMonthController : Controller
    {
        readonly Repository _repo;

        /// <summary>
        ///     Initializes a new instance of the <see cref="Controllers.FarmingMonthController"/> class which
        ///     makes use of the real Entity Framework context that connects with the database.
        /// </summary>
        public FarmingMonthController()
        {
            _repo = new Repository();
        }

        /// <summary>
        ///     Initializes a new instance of the <see cref="Controllers.FarmingMonthController"/> class which
        ///     can make use of a "Fake" Entity Framework context for unit testing purposes.
        /// </summary>
        /// <param name="db">Database context.</param>
        public FarmingMonthController(IZkContext db)
        {
            _repo = new Repository(db);
        }

        /// <summary>
        ///     GET: /Edit/{month}
        ///     Returns the selected month.
        /// </summary>
        /// <returns></returns>
        /// <param name="month">Requested month.</param>
        public ActionResult Edit(Month month)
        {
            // TODO: Get farming month (TODO: of user))
            return Json(new { name = month.ToString() }, JsonRequestBehavior.AllowGet);
        }

    }
}