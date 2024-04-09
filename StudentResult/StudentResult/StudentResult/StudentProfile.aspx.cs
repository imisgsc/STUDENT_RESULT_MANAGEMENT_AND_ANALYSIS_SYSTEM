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
    public partial class StudentProfile : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        public bool noError = true;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand("sp_b_Student", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                cmd.Parameters.AddWithValue("@Id", Session["Id"].ToString());
                cmd.Parameters.AddWithValue("@qtype", "ViewDealer");
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.Read())
                {
                    lblname.Text = sdr["Name"].ToString();
                    lblReg.Text = sdr["RegNo"].ToString();
                    lblDOB.Text = Convert.ToDateTime(sdr["DOB"]).ToString("dd MMM yyyy");
                    lblBatch.Text = sdr["Batch"].ToString();
                    lblClass.Text = sdr["Class"].ToString();
                    lblSection.Text = sdr["Section"].ToString();
                    lblEmail.Text = sdr["EmailID"].ToString();
                    lblpassword.Text = sdr["Password"].ToString();
                    pnlImage.ImageUrl = "Upload/" + sdr["UploadFile"].ToString();
                }
                con.Close();
            }
        }

    }
}