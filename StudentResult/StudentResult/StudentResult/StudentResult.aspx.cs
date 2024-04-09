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
    public partial class StudentResult : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        public int PageSize = 25;
        public int pageIndex = 1;
        public bool noError = true;
        public Common db = new Common();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getData(pageIndex);
            }

        }
        protected void getData(int pageIndex)
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand Cmd = new SqlCommand();
            SqlDataReader sqlReader;
            try
            {
                string Data = Session["Id"].ToString();
                Cmd = new SqlCommand("sp_b_Result", con);
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.Parameters.Add("@StudentName", SqlDbType.NVarChar, 200).Value = txtStudentname.Text.Trim();
                Cmd.Parameters.Add("@OutComeStatus", SqlDbType.NVarChar, 200).Value = txtStatus.Text.Trim();
                Cmd.Parameters.Add("@Sub_Code", SqlDbType.NVarChar, 200).Value = txtSubCode.Text.Trim();
                Cmd.Parameters.Add("@qtype", SqlDbType.VarChar, 50).Value = "studentresultlist";
                Cmd.Parameters.Add("@Id", SqlDbType.VarChar, 50).Value = Session["Id"].ToString();
                //Cmd.Parameters.Add("@Id", SqlDbType.Int).Value = Convert.ToInt32(Session["Id"].ToString());
                Cmd.Parameters.Add("@pageIndex", SqlDbType.Int).Value = pageIndex;
                Cmd.Parameters.Add("@pageSize", SqlDbType.Int).Value = PageSize;
                Cmd.Parameters.Add("@RecordCount", SqlDbType.Int).Direction = ParameterDirection.Output;
                Cmd.Parameters.Add("@MSG", SqlDbType.VarChar, 100).Direction = ParameterDirection.Output;
                con.Open();
                sqlReader = Cmd.ExecuteReader();
                if (sqlReader.HasRows)
                {
                    rptUsers.DataSource = sqlReader;
                    rptUsers.DataBind();
                    pnlNoRecord.Visible = false;
                }
                else
                {
                    rptUsers.DataSource = null;
                    rptUsers.DataBind();
                    pnlNoRecord.Visible = true;
                }
                sqlReader.Close();
                int recordCount = Convert.ToInt32(Cmd.Parameters["@RecordCount"].Value);
                this.PopulatePager(recordCount, pageIndex);
            }
            catch (Exception ex)
            {
                Response.Write(ex);
                pnlerror.Visible = true;
                lblError.Text = "Error Occured please Contact Administrator";
                noError = false;
            }
            finally
            {
                con.Close();
            }

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            getData(pageIndex);
        }

        protected void rptUsers_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {
                int Id = Convert.ToInt32(e.CommandArgument.ToString());
                string rMSG = "";
                rMSG = deleteFn(Id);
                if (noError)
                {
                    Response.Redirect("ViewResult.aspx?msg=" + rMSG);
                }
                else
                {
                    pnlerror.Visible = true;
                    lblError.Text = "Error Occured please Contact Administrator";
                    noError = false;
                }
            }

        }
        protected string deleteFn(int Id)
        {
            SqlConnection con = new SqlConnection(cs);
            //SqlConnection conn = new SqlConnection(db.connetionString);
            SqlCommand Cmd = new SqlCommand();
            string rStatus = "";
            try
            {
                Cmd = new SqlCommand("sp_b_Result", con);
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.Parameters.Add("@Id", SqlDbType.Int).Value = Id;
                Cmd.Parameters.Add("@qtype", SqlDbType.VarChar, 20).Value = "DeleteDealer";
                Cmd.Parameters.Add("@MSG", SqlDbType.VarChar, 100).Direction = ParameterDirection.Output;
                con.Open();
                Cmd.ExecuteNonQuery();
                rStatus = Cmd.Parameters["@MSG"].Value.ToString();
                con.Close();
            }
            catch (Exception ex)
            {
                // Response.Write(ex);
                pnlerror.Visible = true;
                lblError.Text = "Error Occured please Contact Administrator";
                noError = false;
            }
            return rStatus;
        }


        private void PopulatePager(int recordCount, int currentPage)
        {
            double dblPageCount = (double)((decimal)recordCount / Convert.ToDecimal(PageSize));
            int pageCount = (int)Math.Ceiling(dblPageCount);
            List<ListItem> pages = new List<ListItem>();
            if (pageCount > 0)
            {
                for (int i = 1; i <= pageCount; i++)
                {
                    pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
                }
            }
            rptPager.DataSource = pages;
            rptPager.DataBind();
        }
        protected void Page_Changed(object sender, EventArgs e)
        {
            int pageIndex = int.Parse((sender as LinkButton).CommandArgument);
            this.getData(pageIndex);

        }

    }
}