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
    public partial class Site1 : System.Web.UI.MasterPage
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["id"]== null || Session["id"].Equals(""))
                {
                    LinkButton1.Visible = true; // user login link button
                    LinkButton3.Visible = true; // sign up link button

                    LinkButton6.Visible = false; // logout link button
                    LinkButton7.Visible = false; // hello user link button
                    LinkButton11.Visible = false; 
                    LinkButton12.Visible = false; 
                    LinkButton8.Visible = true;
                    LinkButton9.Visible = false;
                    LinkButton10.Visible = false; // member management link button
                    LinkButton13.Visible = false;
                    LinkButton14.Visible = false;
                }
                else if (Session["role"].Equals("user"))
                {
                    LinkButton1.Visible = false; // user login link button
                    LinkButton3.Visible = false; // sign up link button

                    LinkButton6.Visible = true; // logout link button
                    LinkButton7.Visible = true; // hello user link button
                    LinkButton7.Text = "         Hello, " + Session["username"].ToString();
                    LinkButton8.Visible = false;
                }
                else
                {
                    LinkButton1.Visible = false; // user login link button
                    LinkButton3.Visible = false; // sign up link button
                    LinkButton7.Visible = true; // sign up link button
                    LinkButton7.Text = "         Hello, " + Session["username"].ToString();
                    LinkButton6.Visible = false; // logout link button
                    LinkButton8.Visible = false;
                    LinkButton11.Visible = true; 
                    LinkButton12.Visible = true; 
                    LinkButton9.Visible = true; 
                    LinkButton10.Visible = true;
                    
                    LinkButton14.Visible = true;
                }
                
            }
            catch (Exception ex)
            {

            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("user_login.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("check_bookings.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("sign_up.aspx");
        }

        protected void LinkButton13_Click(object sender, EventArgs e)
        {
            Response.Redirect("fire_staff.aspx");
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_login.aspx");
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }


                SqlCommand cmd = new SqlCommand("select* from staff", con);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    string temp = "";
                    while (dr.Read())
                    {
                        temp = temp + "Staff ID: " + dr.GetValue(0).ToString() + "  Name: " + dr.GetValue(1).ToString() + "  Role: " + dr.GetValue(2).ToString() + "\n";
                    }
                    string encodedTemp = HttpUtility.JavaScriptStringEncode(temp);
                    Response.Write("<script>alert('" + encodedTemp + "');</script>");


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

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Session["id"] = null;
        }

        protected void LinkButton11_Click(object sender, EventArgs e)
        {
        }

        protected void LinkButton12_Click(object sender, EventArgs e)
        {
            Response.Redirect("insert_staff.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("search_flights.aspx");
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx");
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Session["id"] = null;
            LinkButton1.Visible = true; // user login link button
            LinkButton3.Visible = true; // sign up link button

            LinkButton6.Visible = false; // logout link button
            LinkButton7.Visible = false; // hello user link button


        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
           
        }

        protected void LinkButton14_Click(object sender, EventArgs e)
        {
            Response.Redirect("insert_flight.aspx");
        }
    }
}