using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentResult
{
    public partial class Login : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand("sp_b_login", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@qtype", "stafflogin");
                cmd.Parameters.AddWithValue("@Username", txtusername.Value.Trim());
                cmd.Parameters.AddWithValue("@Password", txtpassword.Value.Trim());
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.Read())
                {
                    Session["Username"] = sdr["Username"].ToString();
                    Session["Usertype"] = sdr["Role"].ToString();
                    Session["Id"] = sdr["Id"].ToString();
                    Response.Redirect("~/Dashboard.aspx");
                }
                else if (txtusername.Type == "" && txtpassword.Type == "")
                {
                    lbl_errormsg.Text = "Enter Username and Password";
                }
                else
                {
                    this.chkEmployee();
                }

            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
            finally
            {
                con.Close();
            }
        }

        protected void chkEmployee()
        {
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand("sp_b_login", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@qtype", "studentlogin");
                cmd.Parameters.AddWithValue("@Username", txtusername.Value.Trim());
                cmd.Parameters.AddWithValue("@Password", txtpassword.Value.Trim());
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.Read())
                {
                    Session["Username"] = sdr["Name"].ToString();
                    Session["Usertype"] = sdr["RegNo"].ToString();
                    Session["Id"] = sdr["Id"].ToString();
                    Response.Redirect("~/StudentProfile.aspx");
                }
                else if (txtusername.Type == "" && txtpassword.Type == "")
                {
                    lbl_errormsg.Text = "Enter Username and Password";
                }
                else
                {
                    lbl_errormsg.Text = "Sorry,Invalid Username or Password";
                    txtusername.Value = "";
                    txtpassword.Value = "";
                }
            }


            catch (Exception ex)
            {
                Response.Write(ex);
            }
            finally
            {
                con.Close();
            }


        }
    }
}