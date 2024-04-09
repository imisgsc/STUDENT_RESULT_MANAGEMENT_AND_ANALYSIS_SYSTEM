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
    public partial class EditStudent : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        public bool noError = true;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string editacc = Request.QueryString["Id"].ToString();

                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand("sp_b_Student", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                cmd.Parameters.AddWithValue("@Id", editacc);
                cmd.Parameters.AddWithValue("@qtype", "ViewDealer");
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.Read())
                {
                    txtStudentName.Text = sdr["Name"].ToString();
                    txtRegNo.Text = sdr["RegNo"].ToString();
                    txtdobDate.Text = Convert.ToDateTime(sdr["DOB"]).ToString("yyyy-MM-dd");
                    txtBatch.Text = sdr["Batch"].ToString();
                    txtClass.Text = sdr["Class"].ToString();
                    txtSection.Text = sdr["Section"].ToString();
                    txtEmailID.Text = sdr["EmailID"].ToString();
                    txtPassword.Text = sdr["Password"].ToString();
                    lblUpload.Text = sdr["UploadFile"].ToString();
                    ddlStatus.SelectedValue = sdr["Status"].ToString();
                }
                con.Close();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            UpdateData();

            if (noError)
            {
                Response.Write("<script language='javascript'>alert('Profile Updated Successfully');window.location=('ViewStudent.aspx')</script>");
            }
            else
            {
                //pnlerror.Visible = true;
                lblError.Text = "Error Occured please Contact Administrator";
            }
        }

        protected void UpdateData()
        {

            string editacc = Request.QueryString["Id"].ToString();

            SqlConnection con = new SqlConnection(cs);
            con.Close();
            try
            {
                SqlCommand cmd = new SqlCommand("sp_b_Student", con);
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@qtype", "UpdateDealer");
                cmd.Parameters.AddWithValue("@Id", editacc);
                cmd.Parameters.AddWithValue("@Name", txtStudentName.Text.Trim());
                cmd.Parameters.AddWithValue("@RegNo", txtRegNo.Text.Trim());
                cmd.Parameters.AddWithValue("@DOB", txtdobDate.Text.Trim());
                cmd.Parameters.AddWithValue("@Batch", txtBatch.Text.Trim());
                cmd.Parameters.AddWithValue("@Class", txtClass.Text.Trim());
                cmd.Parameters.AddWithValue("@Section", txtSection.Text.Trim());
                cmd.Parameters.AddWithValue("@EmailID", txtEmailID.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                if (FileUpload.HasFiles == false)
                {
                    if (lblUpload.Text != "")
                    {
                        cmd.Parameters.AddWithValue("@UploadFile", lblUpload.Text);
                    }
                    else
                    {
                        if (FileUpload.HasFiles)
                        {
                            foreach (HttpPostedFile uploadedFile1 in FileUpload.PostedFiles)
                            {
                                uploadedFile1.SaveAs(System.IO.Path.Combine(Server.MapPath("~/Upload/"), DateTime.Now.ToString("yyyyMMdd") + "-" + DateTime.Now.Minute + "-" + DateTime.Now.Second + "-" + uploadedFile1.FileName));
                                lblUpload.Text += String.Format("{0}", DateTime.Now.ToString("yyyyMMdd") + "-" + DateTime.Now.Minute + "-" + DateTime.Now.Second + "-" + uploadedFile1.FileName);
                            }
                            cmd.Parameters.AddWithValue("@UploadFile", lblUpload.Text);
                        }
                    }
                }
                else
                {
                    lblUpload.Text = "";
                    foreach (HttpPostedFile uploadedFile1 in FileUpload.PostedFiles)
                    {
                        uploadedFile1.SaveAs(System.IO.Path.Combine(Server.MapPath("~/Upload/"), DateTime.Now.ToString("yyyyMMdd") + "-" + DateTime.Now.Minute + "-" + DateTime.Now.Second + "-" + uploadedFile1.FileName));
                        lblUpload.Text += String.Format("{0}", DateTime.Now.ToString("yyyyMMdd") + "-" + DateTime.Now.Minute + "-" + DateTime.Now.Second + "-" + uploadedFile1.FileName);

                    }
                    cmd.Parameters.AddWithValue("@UploadFile", lblUpload.Text);
                }
                cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
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