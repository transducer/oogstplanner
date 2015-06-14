﻿using System.Linq;

using Oogstplanner.Common;
using Oogstplanner.Models;

namespace Oogstplanner.Data
{
    public class UserRepository : EntityFrameworkRepository<User>, IUserRepository
    {
        public UserRepository(IOogstplannerContext db) 
            : base(db)
        { }
            
        public User GetUserByUserName(string name)
        {
            var user = DbSet.SingleOrDefault(u => u.Name == name);

            if (user == null)
            {
                throw new UserNotFoundException("The user with the specified name does not exist.");
            }

            return user; 
        }

        public int GetUserIdByEmail(string email)
        {
            var user = DbSet.SingleOrDefault(u => u.Email == email);

            if (user == null)
            {
                throw new UserNotFoundException("The user with the specified email does not exist.");
            }

            return user.Id; 
        }

        public int GetUserIdByName(string name)
        {
            var user = DbSet.SingleOrDefault(u => u.Name == name);

            if (user == null)
            {
                throw new UserNotFoundException("The user with the specified name does not exist.");
            }

            return user.Id; 
        }
    }
}
