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
    public partial class UploadMarksheet : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        public bool noError = true;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            InserData();

            if (noError)
            {
                Response.Write("<script language='javascript'>alert('Mark Sheet Updated Successfully');window.location=('ViewResult.aspx')</script>");
            }
            else
            {
                //pnlerror.Visible = true;
                lblError.Text = "Error Occured please Contact Administrator";
            }
        }


        protected void InserData()
        {
            string editacc = Request.QueryString["Id"].ToString();
            SqlConnection con = new SqlConnection(cs);
            con.Close();
            try
            {
                SqlCommand cmd = new SqlCommand("sp_b_Result", con);
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@qtype", "updatemarksheet");
                cmd.Parameters.AddWithValue("@Id", editacc);
                if (FileUpload.HasFiles)
                {
                    foreach (HttpPostedFile uploadedFile1 in FileUpload.PostedFiles)
                    {
                        uploadedFile1.SaveAs(System.IO.Path.Combine(Server.MapPath("~/MUpload/"), uploadedFile1.FileName.Replace(" ","")));
                        lblUpload.Text += String.Format("{0}", uploadedFile1.FileName.Replace(" ", ""));

                    }
                    cmd.Parameters.AddWithValue("@UploadMarksheet", lblUpload.Text.Replace(" ", ""));
                }
                cmd.Parameters.AddWithValue("@Updatedby", Session["Username"].ToString());
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Response.Write(ex);
                lblError.Text = "Error Occured, Please Contact Administrator";
                noError = false;
            }
            finally
            {
                con.Close();
            }
        }
    }
}