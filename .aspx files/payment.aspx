<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="payment.aspx.cs" Inherits="Airnova1.payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <title>Card Payment Form</title>
      <style>
        body {
            background-color: lightblue;
            color: black; 
            font-family: Arial, sans-serif;
            height: 100vh; 
            margin: 0;
            display: flex; 
            justify-content: center; 
            align-items: center; 
        }

        form {
            background-color: whitesmoke;
            padding: 20px; 
            border-radius: 8px; 
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3); 
        }

        input, button {
            background-color: white; 
            color: black; 
            border: 1px solid #ccc;
            padding: 5px;
            margin-top: 10px;
        }

        button {
            cursor: pointer;
            background-color: gray;
            border-radius: 4px;
        }
    </style>
</head>
<body>
 
        <h2>Payment Form</h2>
        <p>Please enter your card information:</p>

    <div>
            <label for="card_type">Credit/Debit:</label>
            <asp:TextBox ID="TextBox4" runat="server" /><br />
        </div>    
    
    <div>
            <label for="cc-number">Card Number:</label>
            <asp:TextBox ID="TextBox1" runat="server" /><br />
        </div>
        <div>
            <label for="cc-expiration">Expiration Date:</label>
            <asp:TextBox ID="TextBox2" runat="server" /><br />
        </div>
        <div>
            <label for="cc-cvv">CVV:</label>
            <asp:TextBox ID="TextBox3" runat="server" /><br />
        </div>

        <asp:Button class="btn btn-success btn-block btn-lg" ID="submitButton" runat="server" Text="Submit" OnClick="Button1_click"/>

</body>

</asp:Content>
