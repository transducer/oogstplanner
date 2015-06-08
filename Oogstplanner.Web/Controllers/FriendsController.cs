﻿using System;
using System.Web.Mvc;

using Oogstplanner.Services;

namespace Oogstplanner.Web.Controllers
{
    [Authorize]
    public sealed class FriendsController : Controller
    {        
        readonly ICalendarLikingService calendarLikingService;

        public FriendsController(ICalendarLikingService calendarLikingService)
        {
            if (calendarLikingService == null)
            {
                throw new ArgumentNullException("calendarLikingService");
            }
      
            this.calendarLikingService = calendarLikingService;
        }
            
        //
        // POST /zaaikalender/like
        [HttpPost]
        public JsonResult Like(int calendarId)
        {
            try
            {
                calendarLikingService.Like(calendarId);
                return Json(new { success = true });
            }
            catch (Exception ex) 
            { 
                // TODO: Implement logging
                return Json(new { success = false });
            }
        }

        //
        // POST /zaaikalender/unlike
        [HttpPost]
        public JsonResult UnLike(int calendarId)
        {
            try
            {
                calendarLikingService.UnLike(calendarId);
                return Json(new { success = true });
            }
            catch (Exception ex) 
            { 
                // TODO: Implement logging
                return Json(new { success = false });
            }
        }
            
    }
}