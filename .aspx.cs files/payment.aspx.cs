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
    public partial class payment : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        string seatNumber = "";
        int number;
        protected void Page_Load(object sender, EventArgs e)
        {
            string seatNumber = Request.QueryString["seat"];

            number = Int32.Parse(seatNumber);

            if (number > 50)
                Response.Write("<script>alert('Pay $300 for Luxury Seat');</script>");
            else
                Response.Write("<script>alert('Pay $150 for Economy Seat');</script>");
        }

        protected void Button1_click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }

                int fid = (int)Session["current_flight"];

                SqlCommand cmd = new SqlCommand("select* from flights where flight_id = '" + fid.ToString() + "'", con);

                SqlDataReader dr = cmd.ExecuteReader();

                if(dr.HasRows)
                {
                    string bd = dr.GetValue(2).ToString();

                    if (number < 50) {
                        SqlCommand cmd1 = new SqlCommand("exec InsertBooking @bid = '" + (string)Session["booking_number"] + "' , @pid = '" + (string)Session["id"] + "', @fid = '" + (string)Session["current_flight"] + "', @sno = '" + number.ToString() + "', @bd = '" + bd + "', @pmeth = '" + TextBox4.Text.ToString() + "',@class = 'Luxury', @stype = 'Aisle', @cno = '" + TextBox1.Text.ToString() + "'", con);
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                    else
                    {
                        SqlCommand cmd1 = new SqlCommand("exec InsertBooking @bid = '" + (string)Session["booking_number"] + "' , @pid = '" + (string)Session["id"] + "', @fid = '" + (string)Session["current_flight"] + "', @sno = '" + number.ToString() + "', @bd = '" + bd + "', @pmeth = '" + TextBox4.Text.ToString() + "',@class = 'Economy', @stype = 'Aisle', @cno = '" + TextBox1.Text.ToString() + "'", con);
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }

                    

                }



            }
            catch(Exception ex)
            {
                Response.Redirect("home.aspx");
            }
        }

       
    }
}