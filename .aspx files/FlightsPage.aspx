<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FlightsPage.aspx.cs" Inherits="Airnova1.FlightsPage" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f4f4f4; /* Subtle background color */
            font-family: Arial, sans-serif;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: lightsteelblue; /* Background color for the content area */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Subtle box shadow */
        }

        h1 {
            text-align: center;
        }

 

        /* Add more styles as needed */
    </style>


    <body>
        <div class="container">
        <h1>Available Flights</h1>
        <div id="flightsContainer">
            <asp:Literal ID="litFlights" runat="server"></asp:Literal>
            <!-- Flight information will be dynamically inserted here -->
        </div>
    </div>
    </body>

</asp:Content>
