﻿using System;

namespace SowingCalendar.Models
{
    /// <summary>
    ///     Enumeration for the months of the year. More months can be selected.
    /// </summary>
    [Flags]
    public enum Month
    {
        NotSet = 0,
        January = 1,
        February = 2,
        March = 4,
        April = 8,
        May = 16,
        June = 32,
        July = 64,
        August = 128,
        September = 256,
        October = 612,
        November = 1024,
        December = 2048
    }

}

