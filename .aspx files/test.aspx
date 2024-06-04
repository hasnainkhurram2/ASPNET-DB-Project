<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="Airnova1.test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8" />
    <title>Seat Booking</title>
    <style>
        body {
            background-color: lightblue;
            color: white;
            text-align: center;
        }

        .container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 20px;
        }

        .row {
            display: flex;
            justify-content: center;
            margin-bottom: 10px;
        }

        .seat {
            width: 40px;
            height: 40px;
            border: 1px solid white;
            text-align: center;
            line-height: 40px;
            margin: 5px;
            cursor: pointer;
            background-color: blue;
            color: white;
        }

        .seat:hover {
            background-color: lightblue;
        }

        .booked {
            background-color: black;
            color: white;
            cursor: not-allowed;
        }

        .selected {
            background-color: green;
            color: white;
        }

        /* Modal styles */
        .modal {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            color: black;
            padding: 20px;
            border-radius: 10px;
            z-index: 1000;
            text-align: center;
        }

        .modal-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 999;
        }

        .modal button {
            padding: 5px 10px;
            background-color: blue;
            color: white;
            border-radius: 5px;
            border: none;
            cursor: pointer;
        }

    </style>
</head>
<body>
   
        <h1>Seat Booking</h1>
        <br />
        <h2>Luxury: $300, Economy: $150</h2>

        <div class="container" id="seatContainer">
          
                 <div class="row">
                <% for (int i = 1; i <= 100; i++) { %>

                     <%if (i<50){ %>
                    <div class="seat" id="seat<%= i%>"><%= i %>L</div>
                     <% } %>
                     <% else{ %>
                        <div class="seat" id="seat<%= i%>"><%= i %>E</div>
                     <% } %>

                <% } %>

            </div>
        </div>

        <div id="modalBooked" class="modal">
            <div>Seat Not Available: The seat was already booked.</div>
            <asp:LinkButton ID="CloseBookedModalButton" runat="server" OnClick="CloseBookedModalButton_Click">Close</asp:LinkButton>
        </div>

        <div id="modalAvailable" class="modal">
            <div>Seat is available. Would you like to select it?</div>
            <asp:LinkButton ID="ConfirmSelectionButton" runat="server" OnClick="ConfirmSelectionButton_Click">Yes</asp:LinkButton>
            <asp:LinkButton ID="CloseAvailableModalButton" runat="server" OnClick="CloseAvailableModalButton_Click">No</asp:LinkButton>
        </div>

        <div id="modalOverlay" class="modal-overlay" onclick="closeModalAll()"></div>
   <%--  --%>
</body>
</html>

    <script>

    document.addEventListener('DOMContentLoaded', function() {
        var seatElements = document.querySelectorAll('.seat');
        seatElements.forEach(function(seat) {
            seat.addEventListener('click', function() {
                // Extract seat number from the seat id
                var seatNumber = this.id.replace('seat', '');
                
                window.location.href = 'payment.aspx?seat=' + seatNumber;

            });
        });
    });
    </script>

</asp:Content>
