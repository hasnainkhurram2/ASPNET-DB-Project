using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Airnova1
{
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string flightId = Request.QueryString["flightID"];

            Session["current_flight"] = flightId;
        }

        protected void SeatButton_Click(object sender, EventArgs e)
        {
            LinkButton clickedSeat = (LinkButton)sender;
            string seatId = clickedSeat.ID;
            // Perform any server-side logic here based on the clicked seat
            // For example, you can change the color of the clicked seat or perform any other action.
            // You can also call JavaScript functions from the server-side if needed.
        }

        protected void CloseBookedModalButton_Click(object sender, EventArgs e)
        {
            // Close booked modal functionality here
            closeModal("modalBooked");
        }

        protected void ConfirmSelectionButton_Click(object sender, EventArgs e)
        {
            // Confirm selection functionality here
            confirmSelection();
        }

        protected void CloseAvailableModalButton_Click(object sender, EventArgs e)
        {
            // Close available modal functionality here
            closeModal("modalAvailable");
        }

        private void closeModal(string modalId)
        {
            // Close modal functionality here
            ScriptManager.RegisterStartupScript(this, GetType(), "closeModal", $"document.getElementById('{modalId}').style.display = 'none';document.getElementById('modalOverlay').style.display = 'none';", true);
        }

        private void confirmSelection()
        {
            // Confirm selection functionality here
            // For example:
            // seat.classList.remove("available");
            // seat.classList.add("selected");
            // currentSeat = null;
            closeModal("modalAvailable");
        }
    }
}