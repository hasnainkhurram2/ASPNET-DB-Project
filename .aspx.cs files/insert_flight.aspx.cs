using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Airnova1
{
    public partial class insert_flight : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkFlightExists())
            {

                Response.Write("<script>alert('Flight Already Exists with this Flgiht ID, try other ID');</script>");
            }
            else
            {
                InsertNewFlight();
                Response.Redirect("home.aspx");
            }
        }
        bool checkFlightExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select* from flights where flight_id ='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        void InsertNewFlight()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);

                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("insert into flights values ( '" + TextBox1.Text.Trim() + "', '" + TextBox7.Text.Trim() + "' ,'" + TextBox2.Text.Trim() + "', '" + TextBox3.Text.Trim() + "','" + TextBox4.Text.Trim() + "', '" + TextBox6.Text.Trim() + "','" + TextBox5.Text.Trim() + "', '" + TextBox8.Text.Trim() + "','" + TextBox9.Text.Trim() + "','" + TextBox10.Text.Trim() + "')", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Insertion Successful.');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


    }
}