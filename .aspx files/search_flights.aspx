<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="search_flights.aspx.cs" Inherits="Airnova1.search_flights" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


  <style>
    /* Reset CSS */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    /* Basic styling */
    body {
      font-family: Arial, sans-serif;
    }

    header {
      background-color: #740e0e; 
      color: #fff;
      padding: 1rem 0;
    }

    .header-container {
      max-width: 1200px;
      margin: 0 auto;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .popup-container {
      display: none;
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.5); 
      justify-content: center;
      align-items: center;
    }

    .popup-content {
      background-color: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
    }

    header h1 {
      font-size: 2rem;
      margin-left: 1rem;
    }

    nav ul {
      list-style-type: none;
    }

    nav ul li {
      display: inline-block;
      margin-right: 1rem;
    }

    nav ul li a {
      color: #fff;
      text-decoration: none;
    }

    nav ul li a:hover {
      text-decoration: underline;
    }

    main {
      background-image: url('https://c1.wallpaperflare.com/path/743/189/161/airplane-airplane-wing-wing-flight-bb6d9c880a1cff28b9f06955c3abc474.jpg');
      background-size: cover;
      background-position: center;
      padding: 2rem 0;
    }

    .booking-form {
      background-color: rgba(255, 255, 255, 0.8);
      max-width: 600px;
      margin: 0 auto;
      padding: 2rem;
      border-radius: 8px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .booking-form h2 {
      font-size: 1.5rem;
      margin-bottom: 1rem;
      color: #740e0e;
    }

    .form-group {
      margin-bottom: 1rem;
    }

    .form-group label {
      display: block;
      font-weight: bold;
      margin-bottom: 0.5rem;
      color: #740e0e;
    }

    .form-group select, .form-group input[type="date"], .form-group input[type="number"] {
      width: calc(100% - 2rem);
      padding: 0.5rem;
      font-size: 1rem;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    button {
      display: block;
      width: calc(100% - 2rem);
      margin-left: auto;
      margin-right: auto;
      padding: 0.75rem;
      font-size: 1rem;
      background-color: #740e0e;
      color: #fff;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    button:hover {
      background-color: #555;
    }

    footer {
      text-align: center;
      margin-top: 2rem;
      padding: 1rem 0;
      background-color: #740e0e;
      color: #fff;
    }
  </style>
<body>


  <div id="aboutPopup" class="popup-container">
    <div class="popup-content">
      <p> Welcome to Airnova, where every journey is a seamless blend of comfort, convenience, and reliability. With a commitment to safety and exceptional service,we soar beyond expectations to connect you with the world. Experience the pinnacle of air travel with Airnova, where every flight is an unforgettable adventure.</p>
      <br>
      <button onclick="closeAbout()">Close</button>
    </div>
  </div>

  <main>
    <section class="booking-form">
      <h2>Book Your Flight</h2>
      <form action="available_flights.html" method="post">
        <div class="form-group">
          <label for="departure">Departure:</label>
           <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
               <asp:ListItem Text="John F. Kennedy International Airport" Value="John F. Kennedy International Airport"></asp:ListItem>
               <asp:ListItem Text="Los Angeles International Airport" Value="Los Angeles International Airport"></asp:ListItem>
               <asp:ListItem Text="Chicago O'Hare International Airport" Value="Chicago O'Hare International Airport"></asp:ListItem>
               <asp:ListItem Text="Zurich Airport" Value="Zurich Airport"></asp:ListItem>
               <asp:ListItem Text="Hong Kong International airport" Value="Hong Kong International airport"></asp:ListItem>
               <asp:ListItem Text="Denver International Airport" Value="Denver International Airport"></asp:ListItem>
               <asp:ListItem Text="Sydney Airport" Value="Sydney Airport"></asp:ListItem>
               <asp:ListItem Text="Dubai International Airport" Value="Dubai International Airport"></asp:ListItem>
               <asp:ListItem Text="Munich Airport" Value="Munich Airport"></asp:ListItem>
               <asp:ListItem Text="Auckland Airport" Value="Auckland Airport"></asp:ListItem>
               <asp:ListItem Text="London Heathrow Airport" Value="London Heathrow Airport"></asp:ListItem>
               <asp:ListItem Text="Beijing Capital International Airport" Value="Beijing Capital International Airport"></asp:ListItem>
               <asp:ListItem Text="Tokyo Haneda Airport" Value="Tokyo Haneda Airport"></asp:ListItem>
               <asp:ListItem Text="Paris charles de Gaulle Airport" Value="Paris charles de Gaulle Airport"></asp:ListItem>
               <asp:ListItem Text="Frankfurt Airport" Value="Frankfurt Airport"></asp:ListItem>
               <asp:ListItem Text="Toronto Pearson International Airport" Value="Toronto Pearson International Airport"></asp:ListItem>
               <asp:ListItem Text="Singapore Changi Airport" Value="Singapore Changi Airport"></asp:ListItem>
               <asp:ListItem Text="Incheon International Airport" Value="Incheon International Airport"></asp:ListItem>
               <asp:ListItem Text="Suvarnabhumi Airport" Value="Suvarnabhumi Airport"></asp:ListItem>
               <asp:ListItem Text="Sydney Kingsford Smith Airport" Value="Sydney Kingsford Smith Airport"></asp:ListItem>
               <asp:ListItem Text="Barcelona-El Prat Airport" Value="Barcelona-El Prat Airport"></asp:ListItem>
               <asp:ListItem Text="Vancouver International Airport" Value="Vancouver International Airport"></asp:ListItem>
               <asp:ListItem Text="Abu Dhabi International Airport" Value="Abu Dhabi International Airport"></asp:ListItem>
           </asp:DropDownList>
        </div>
        <div class="form-group">
          <label for="destination">Destination:</label>
            <asp:DropDownList class="form-control" ID="DropDownList2" runat="server">
               <asp:ListItem Text="John F. Kennedy International Airport" Value="John F. Kennedy International Airport"></asp:ListItem>
               <asp:ListItem Text="Los Angeles International Airport" Value="Los Angeles International Airport"></asp:ListItem>
               <asp:ListItem Text="Chicago O'Hare International Airport" Value="Chicago O'Hare International Airport"></asp:ListItem>
               <asp:ListItem Text="Zurich Airport" Value="Zurich Airport"></asp:ListItem>
               <asp:ListItem Text="Hong Kong International airport" Value="Hong Kong International airport"></asp:ListItem>
               <asp:ListItem Text="Denver International Airport" Value="Denver International Airport"></asp:ListItem>
               <asp:ListItem Text="Sydney Airport" Value="Sydney Airport"></asp:ListItem>
               <asp:ListItem Text="Dubai International Airport" Value="Dubai International Airport"></asp:ListItem>
               <asp:ListItem Text="Munich Airport" Value="Munich Airport"></asp:ListItem>
               <asp:ListItem Text="Auckland Airport" Value="Auckland Airport"></asp:ListItem>
               <asp:ListItem Text="London Heathrow Airport" Value="London Heathrow Airport"></asp:ListItem>
               <asp:ListItem Text="Beijing Capital International Airport" Value="Beijing Capital International Airport"></asp:ListItem>
               <asp:ListItem Text="Tokyo Haneda Airport" Value="Tokyo Haneda Airport"></asp:ListItem>
               <asp:ListItem Text="Paris charles de Gaulle Airport" Value="Paris charles de Gaulle Airport"></asp:ListItem>
               <asp:ListItem Text="Frankfurt Airport" Value="Frankfurt Airport"></asp:ListItem>
               <asp:ListItem Text="Toronto Pearson International Airport" Value="Toronto Pearson International Airport"></asp:ListItem>
               <asp:ListItem Text="Singapore Changi Airport" Value="Singapore Changi Airport"></asp:ListItem>
               <asp:ListItem Text="Incheon International Airport" Value="Incheon International Airport"></asp:ListItem>
               <asp:ListItem Text="Suvarnabhumi Airport" Value="Suvarnabhumi Airport"></asp:ListItem>
               <asp:ListItem Text="Sydney Kingsford Smith Airport" Value="Sydney Kingsford Smith Airport"></asp:ListItem>
               <asp:ListItem Text="Barcelona-El Prat Airport" Value="Barcelona-El Prat Airport"></asp:ListItem>
               <asp:ListItem Text="Vancouver International Airport" Value="Vancouver International Airport"></asp:ListItem>
               <asp:ListItem Text="Abu Dhabi International Airport" Value="Abu Dhabi International Airport"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="form-group">
          <label for="date">Date:</label>
           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Password" TextMode="Date"></asp:TextBox>
        </div>
        <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Search Flights" OnClick="Button1_Click" />
      </form>
    </section>
  </main>
  <footer>
    <p>&copy; 2024 Airline Booking. All rights reserved.</p>
  </footer>
  <script>
      function openAbout() {
          var popup = document.getElementById("aboutPopup");
          popup.style.display = "flex";
      }

      function closeAbout() {
          var popup = document.getElementById("aboutPopup");
          popup.style.display = "none";
      }

      function openContact() {
          var popup = document.getElementById("contactPopup");
          popup.style.display = "flex";
      }

      function closeContact() {
          var popup = document.getElementById("contactPopup");
          popup.style.display = "none";
      }
  </script>
</body>


</asp:Content>
