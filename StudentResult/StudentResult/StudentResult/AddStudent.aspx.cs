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
    public partial class AddStudent : System.Web.UI.Page
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
                Response.Write("<script language='javascript'>alert('Batch Created Successfully');window.location=('AddStudent.aspx')</script>");
            }
            else
            {
                //pnlerror.Visible = true;
                lblError.Text = "Error Occured please Contact Administrator";
            }
        }

       
        protected void InserData()
        {
            SqlConnection con = new SqlConnection(cs);
            con.Close();
            try
            {
                SqlCommand cmd = new SqlCommand("sp_b_Student", con);
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@qtype", "insertdealer");
                cmd.Parameters.AddWithValue("@Name", txtStudentName.Text.Trim());
                cmd.Parameters.AddWithValue("@RegNo", txtRegNo.Text.Trim());
                cmd.Parameters.AddWithValue("@DOB", txtdobDate.Text.Trim());
                cmd.Parameters.AddWithValue("@Batch", txtBatch.Text.Trim());
                cmd.Parameters.AddWithValue("@Class", txtClass.Text.Trim());
                cmd.Parameters.AddWithValue("@Section", txtSection.Text.Trim());
                cmd.Parameters.AddWithValue("@EmailID", txtEmailID.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                if (FileUpload.HasFiles)
                {
                    foreach (HttpPostedFile uploadedFile1 in FileUpload.PostedFiles)
                    {
                        uploadedFile1.SaveAs(System.IO.Path.Combine(Server.MapPath("~/Upload/"), uploadedFile1.FileName));
                        lblUpload.Text += String.Format("{0}", uploadedFile1.FileName);

                    }
                    cmd.Parameters.AddWithValue("@UploadFile", lblUpload.Text);
                }
                cmd.Parameters.AddWithValue("@Createdby", Session["Username"].ToString());
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