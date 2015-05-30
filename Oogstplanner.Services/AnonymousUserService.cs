﻿using System;
using System.Configuration;

using Oogstplanner.Data;
using Oogstplanner.Models;

namespace Oogstplanner.Services
{
    public class AnonymousUserService : ServiceBase, IUserService
    {
        readonly ICookieProvider cookieProvider;

        public AnonymousUserService(IOogstplannerUnitOfWork unitOfWork, ICookieProvider cookieProvider)
            : base(unitOfWork)
        {
            if (cookieProvider == null)
            {
                throw new ArgumentNullException("cookieProvider");
            }

            this.cookieProvider = cookieProvider;
        }

        string anonymousUserKey;
        protected string AnonymousUserCookieKey
        {
            get
            {
                if (anonymousUserKey == null)
                {
                    anonymousUserKey = ConfigurationManager.AppSettings["AnonymousUserCookieKey"];
                }
                return anonymousUserKey;
            }
        }

        double? anonymousUserCookieExpiration;
        protected double AnonymousUserCookieExpiration
        {
            get
            {
                if (anonymousUserCookieExpiration == null)
                {
                    anonymousUserCookieExpiration = Convert.ToDouble(ConfigurationManager.AppSettings["AnonymousUserCookieExpiration"]);
                }
                return (double)anonymousUserCookieExpiration;
            }
        }
            
        protected User CurrentAnonymousUser 
        { 
            get 
            { 
                if (string.IsNullOrEmpty(GuidOnClient))
                {
                    var guid = Guid.NewGuid().ToString();
                    AddUser(guid, null, null);
                    GuidOnClient = guid;

                    return UnitOfWork.Users.GetUserByUserName(guid);
                }
                else
                {
                    return UnitOfWork.Users.GetUserByUserName(GuidOnClient);
                }

            }

        }

        string guidOnClient;
        protected string GuidOnClient
        {
            get 
            { 
                if (guidOnClient == null)
                {
                    guidOnClient = cookieProvider.GetCookie(AnonymousUserCookieKey);
                }
                return guidOnClient;
            }
            set 
            { 
                cookieProvider.SetCookie(AnonymousUserCookieKey, value, AnonymousUserCookieExpiration); 
            }
        }
            
        public void AddUser(string userName, string fullName, string email)
        {
            var user = new User 
                {
                    Name = userName,
                    AuthenticationStatus = AuthenticatedStatus.Anonymous, // by definition
                    CreationDate = DateTime.Now
                };
            user.Calendars.Add(new Calendar { Name = "Mijn kalender" } );
            UnitOfWork.Users.Add(user);
            UnitOfWork.Commit();
        }

        public int GetCurrentUserId()
        {
            return CurrentAnonymousUser.Id;
        }

        public User GetUser(int id)
        {
            return UnitOfWork.Users.GetById(id);
        }

        public User GetUserByName(string name)
        {
            return UnitOfWork.Users.GetUserByUserName(name);
        }
    }
}
