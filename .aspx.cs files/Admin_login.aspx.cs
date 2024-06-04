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
    public partial class Admin_login : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("exec Check_admins @admin_id = '" + TextBox1.Text.Trim() + "' , @password='" + TextBox2.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    string temp = "User Found:\n";
                    while (dr.Read())
                    {
                        //temp = temp + "Name: " + dr.GetValue(1).ToString() + "\nDate of Birth: " + dr.GetValue(2).ToString() + "\nEmail: " + dr.GetValue(3) + "\nPhone Number: " + dr.GetValue(4).ToString() + "\nCountry: " + dr.GetValue(5).ToString() + "\nCity: " + dr.GetValue(6).ToString() + "\nAddress: " + dr.GetValue(8).ToString();
                        Session["id"] = dr.GetValue(0).ToString();
                        Session["username"] = dr.GetValue(1).ToString();
                        Session["role"] = "admin";
                    }
                    Response.Redirect("home.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid credentials');</script>");
                }

            }
            catch (Exception ex)
            {

            }
        }
    }
}