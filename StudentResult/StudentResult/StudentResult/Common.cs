using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StudentResult
{
    public class Common
    {
        public string IsActive(string active)
        {
            
            if (active == "Pass")
            {
                return "<b class='text-success'>" + active + "</b>";
            }
            else if (active == "Fail")
            {
                return "<b class='text-danger'>" + active + "</b>";
            }
            else if (active == "Active")
            {
                return "<b class='text-success'>" + active + "</b>";
            }
            else if (active == "Deactive")
            {
                return "<b class='text-danger'>" + active + "</b>";
            }
            else if (active == "Rejected FIR")
            {
                return "<b class='text-danger'>" + active + "</b>";
            }
            else if (active == "Admin Approved")
            {
                return "<b class='text-success'>" + active + "</b>";
            }
            else
            {
                return active;
            }
        }
    }
}