using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Airnova1
{
    public partial class FlightsPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string flightsInfo = Request.QueryString["flights"];

                // Display the flight information
                litFlights.Text = flightsInfo;
            }
            catch (Exception ex)
            {

            }
        }
    }
}