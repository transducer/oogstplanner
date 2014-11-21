﻿using System;

namespace Zk
{
	/// <summary>
	///     Enumeration for the months of the year. More months can be selected.
	/// </summary>
	[Flags]
	public enum Month
	{
		NotSet 		= 0,		/* 0b000000000000 */
		Januari		= 1 << 0,	/* 0b000000000001 */
		Februari 	= 1 << 1,	/* 0b000000000010 */
		Maart 		= 1 << 2,	/* 0b000000000100 */
		April 		= 1 << 3,	/* 0b000000001000 */
		Mei 		= 1 << 4,	/* 0b000000010000 */
		Juni 		= 1 << 5,	/* 0b000000100000 */	
		Juli 		= 1 << 6,	/* 0b000001000000 */		
		Augustus 	= 1 << 7,	/* 0b000010000000 */	
		September 	= 1 << 8,	/* 0b000100000000 */
		Oktober 	= 1 << 9,	/* 0b001000000000 */
		November 	= 1 << 10, 	/* 0b010000000000 */
		December 	= 1 << 11	/* 0b100000000000 */
	}

}