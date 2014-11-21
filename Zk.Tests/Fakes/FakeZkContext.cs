﻿using System.Data.Entity;
using Zk.Models;

namespace Zk.Tests.Fakes
{
	public class FakeZkContext : IZkContext
	{
		public FakeZkContext()
		{
			Crops = new FakeCropSet();
		}

		public IDbSet<Crop> Crops { get; private set; }

		public int SaveChanges()
		{
			return 0;
		}

	}
}