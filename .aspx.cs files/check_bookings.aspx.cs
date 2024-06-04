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
    public partial class check_bookings : System.Web.UI.Page
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

                SqlCommand cmd = new SqlCommand("exec GetBookingDetails @BookingID ='" + TextBox1.Text.Trim() + "' , @PassengerId ='" + TextBox2.Text.Trim() + "'", con);
                
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    string temp = "Booking found:\n";
                    while (dr.Read())
                    {
                        temp = temp + "Name: " + dr.GetValue(0).ToString() + "   Seat Number: " + dr.GetValue(1).ToString() + "\nDate: " + dr.GetValue(2).ToString() + "\nDeparture Airport: " + dr.GetValue(3).ToString() + "\nArrival Airport: " + dr.GetValue(4).ToString() + "\n";
                    }
                    string encodedTemp = HttpUtility.JavaScriptStringEncode(temp);
                    Response.Write("<script>alert('" + encodedTemp + "');</script>");
                }
                else
                {
                    Response.Write("<script>alert('No Booking Found');</script>");
                }

            }
            catch (Exception ex)
            {

            }
        }
    }
}