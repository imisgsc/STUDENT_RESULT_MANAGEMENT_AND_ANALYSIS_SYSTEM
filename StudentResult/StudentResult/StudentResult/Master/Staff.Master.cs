using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentResult.Master
{
    public partial class Staff : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null || Session["Usertype"] == null || Session["Id"] == null)
            {
                Session.Abandon();
                Response.Redirect("~/Login.aspx");
            }
            else
            {
                lblUsername.Text = Session["Username"].ToString();
            }
        }
    }
}