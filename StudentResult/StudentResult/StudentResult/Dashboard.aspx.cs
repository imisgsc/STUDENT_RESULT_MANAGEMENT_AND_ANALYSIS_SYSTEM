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
    public partial class Dashboard : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        public int PageSize = 25;
        public int pageIndex = 1;
        public bool noError = true;
        public string PresentWeek = "";
        public string PresentWeek1 = "";
        public string PresentWeek2 = "";
        public string PresentWeek3 = "";
        public string PresentWeek4 = "";
        public string PresentWeek5 = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                GetData();
                PresWeek();
                getlist();
                getfail();
                getData(pageIndex);
            }
        }

        protected void GetData()
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("sp_b_Result", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            cmd.Parameters.AddWithValue("@qtype", "Passcount");
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            if(ds.Tables[0].Rows.Count > 0)
            {
                lblStudent.Text = ds.Tables[0].Rows[0]["Total"].ToString();
            }
            if(ds.Tables[1].Rows.Count > 0)
            {
                lblPass.Text = ds.Tables[1].Rows[0]["Total"].ToString();
            }
            if(ds.Tables[2].Rows.Count > 0)
            {
                lblFail.Text = ds.Tables[2].Rows[0]["Total"].ToString();
            }
            con.Close();

        }

        protected void PresWeek()
        {
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("sp_b_Result", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@qtype", "StatusCount");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            dt.Columns.ToString();

            string[] x = new string[dt.Rows.Count];
            int[] y = new int[dt.Rows.Count];

            PresentWeek = "[";
            for (int i = 0; i < dt.Rows.Count; i++)
            {

                x[i] = dt.Rows[i][0].ToString();
                // Console.WriteLine(dt.Rows[i].ItemArray[i] + "");
                y[i] = Convert.ToInt32(dt.Rows[i][1]);

                PresentWeek += "" + y[i] + ",";
            }
            PresentWeek = PresentWeek.TrimEnd(',') + "]";
            PresentWeek1 = "[";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                x[i] = dt.Rows[i][0].ToString();
                // Console.WriteLine(dt.Rows[i].ItemArray[i] + "");
                y[i] = Convert.ToInt32(dt.Rows[i][1]);
                PresentWeek1 += "'" + x[i] + "',";
            }
            PresentWeek1 = PresentWeek1.TrimEnd(',') + "]";
            con.Close();
        }

        protected void getlist()
        {
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("sp_b_Result", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@qtype", "SubjectPassWise");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            dt.Columns.ToString();

            string[] x = new string[dt.Rows.Count];
            int[] y = new int[dt.Rows.Count];

            PresentWeek2 = "[";
            for (int i = 0; i < dt.Rows.Count; i++)
            {

                x[i] = dt.Rows[i][0].ToString();
                // Console.WriteLine(dt.Rows[i].ItemArray[i] + "");
                y[i] = Convert.ToInt32(dt.Rows[i][1]);

                PresentWeek2 += "" + y[i] + ",";


            }
            PresentWeek2 = PresentWeek2.TrimEnd(',') + "]";

            PresentWeek3 = "[";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                x[i] = dt.Rows[i][0].ToString();
                // Console.WriteLine(dt.Rows[i].ItemArray[i] + "");
                y[i] = Convert.ToInt32(dt.Rows[i][1]);

                PresentWeek3 += "'" + x[i] + "',";
            }
            PresentWeek3 = PresentWeek3.TrimEnd(',') + "]";

            con.Close();
        }

        protected void getfail()
        {
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("sp_b_Result", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@qtype", "SubjectFailWise");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            dt.Columns.ToString();

            string[] x = new string[dt.Rows.Count];
            int[] y = new int[dt.Rows.Count];

            PresentWeek4 = "[";
            for (int i = 0; i < dt.Rows.Count; i++)
            {

                x[i] = dt.Rows[i][0].ToString();
                // Console.WriteLine(dt.Rows[i].ItemArray[i] + "");
                y[i] = Convert.ToInt32(dt.Rows[i][1]);

                PresentWeek4 += "" + y[i] + ",";
            }
            PresentWeek4 = PresentWeek4.TrimEnd(',') + "]";

            PresentWeek5 = "[";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                x[i] = dt.Rows[i][0].ToString();
                // Console.WriteLine(dt.Rows[i].ItemArray[i] + "");
                y[i] = Convert.ToInt32(dt.Rows[i][1]);

                PresentWeek5 += "'" + x[i] + "',";
            }
            PresentWeek5 = PresentWeek5.TrimEnd(',') + "]";

            con.Close();
        }

        protected void getData(int pageIndex)
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand Cmd = new SqlCommand();
            SqlDataReader sqlReader;
            try
            {
                Cmd = new SqlCommand("sp_b_Result", con);
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.Parameters.Add("@qtype", SqlDbType.VarChar, 50).Value = "ClassToppper";
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
            }
            catch (Exception ex)
            {
                Response.Write(ex);
                lblError.Text = "Error Occured please Contact Administrator";
                noError = false;
            }
            finally
            {
                con.Close();
            }

        }
    }
}