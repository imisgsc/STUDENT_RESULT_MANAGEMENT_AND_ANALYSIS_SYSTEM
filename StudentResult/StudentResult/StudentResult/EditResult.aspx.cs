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
    public partial class EditResult : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        public bool noError = true;
        public String Status = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindNewData();

                string editacc = Request.QueryString["Id"].ToString();
                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand("sp_b_Result", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                cmd.Parameters.AddWithValue("@Id", editacc);
                cmd.Parameters.AddWithValue("@qtype", "ViewDealer");
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.Read())
                {
                    ddlStudentName.SelectedValue = sdr["StudentId"].ToString();
                    txtInternal.Text = sdr["InternMarks"].ToString();
                    txtUniversity.Text = sdr["UniversityMarks"].ToString();
                    txtSubCode.Text = sdr["Sub_Code"].ToString();
                    txtTotal.Text = sdr["Total"].ToString();
                    txtPercentage.Text = sdr["Percentage"].ToString();
                }
                con.Close();
            }
        }
        protected void BindNewData()
        {
            SqlConnection conn = new SqlConnection(cs);
            conn.Open();
            SqlCommand cmd = new SqlCommand("sp_b_Result", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@qtype", "Studentlist");
            SqlDataAdapter adpt = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            ddlStudentName.DataSource = dt;
            ddlStudentName.DataTextField = "SName";
            ddlStudentName.DataValueField = "Id";
            ddlStudentName.DataBind();
            ddlStudentName.Items.Insert(0, new ListItem("-- Select Student --", ""));
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            UpdateData();

            if (noError)
            {
                Response.Write("<script language='javascript'>alert('Result Updated Successfully');window.location=('ViewResult.aspx')</script>");
            }
            else
            {
                //pnlerror.Visible = true;
                lblError.Text = "Error Occured please Contact Administrator";
            }
        }

        protected void UpdateData()
        {
            int Total = Convert.ToInt32(txtTotal.Text);

            if (Total > 35)
            {
                Status = "Pass";
            }
            else
            {
                Status = "Fail";
            }
            string editacc = Request.QueryString["Id"].ToString();
            SqlConnection con = new SqlConnection(cs);
            con.Close();
            try
            {
                SqlCommand cmd = new SqlCommand("sp_b_Result", con);
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@qtype", "UpdateDealer");
                cmd.Parameters.AddWithValue("@Id", editacc);
                cmd.Parameters.AddWithValue("@StudentId", ddlStudentName.SelectedValue);
                cmd.Parameters.AddWithValue("@StudentName", ddlStudentName.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Sub_Code", txtSubCode.Text.Trim());
                cmd.Parameters.AddWithValue("@InternMarks", txtInternal.Text.Trim());
                cmd.Parameters.AddWithValue("@UniversityMarks", txtUniversity.Text.Trim());
                cmd.Parameters.AddWithValue("@Total", txtTotal.Text.Trim());
                cmd.Parameters.AddWithValue("@Percentage", txtPercentage.Text.Trim());
                cmd.Parameters.AddWithValue("@OutComeStatus", Status);
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

        protected void txtUniversity_TextChanged(object sender, EventArgs e)
        {
            int Total = Convert.ToInt32(txtInternal.Text) + Convert.ToInt32(txtUniversity.Text);
            txtTotal.Text = Convert.ToString(Total);
            txtPercentage.Text = Convert.ToString(Total);
        }
    }
}