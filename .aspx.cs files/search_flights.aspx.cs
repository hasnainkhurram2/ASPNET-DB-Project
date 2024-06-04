using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;


namespace Airnova1
{
    public partial class search_flights : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["id"]==null || Session["id"]=="")
                {
                    Response.Redirect("user_login.aspx");
                }

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }


                SqlCommand cmd = new SqlCommand("exec Searchflights @DepartureAirportName ='" + DropDownList1.Text.Trim() + "' , @ArrivalAirportName ='" + DropDownList2.Text.Trim() + "' ,  @FlightDate ='" + TextBox2.Text.Trim() + "'", con);

                SqlDataReader dr = cmd.ExecuteReader();
               
                if (dr.HasRows)
                {
                    //int i = 1;
                    string temp = "";
                    int seats = 100;
                    while (dr.Read())
                    {
                        temp += "<a href=\"test.aspx?FlightID=" + dr.GetValue(0).ToString() + "\" >" + "Airline: " + dr.GetValue(19).ToString() + " Dep Time: " + dr.GetValue(5).ToString() + " Arr time: " + dr.GetValue(6).ToString() + " Seats Left: " + seats.ToString() + " <br/> <br/> " +" </a> ";
                        //i++;
                    }

                    Response.Redirect($"FlightsPage.aspx?flights={HttpUtility.UrlEncode(temp)}", false);
                    Context.ApplicationInstance.CompleteRequest();
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