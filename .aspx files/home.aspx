<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Airnova1.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <img src="imgs/bg_home.jpg" class="img-fluid" width="5000px" />
    </section>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <center>
                        <br />
                        <h2>Our Features</h2>
                        <p><b>Our 3 Primary Features -</b></p>
                    </center>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <center>
                        <img width="300px" src="imgs/inventory.jpg" />
                        <h4>Digital Flight Inventory</h4>
                    </center>
                </div>
                <div class="col-md-4">
                    <center>
                        <img width="300px" src="imgs/search_flights2.jpg" />
                        <h4>Search Flights</h4>

                    </center>
                </div>
                <div class="col-md-4">
                    <center>
                        <img width="300px" src="imgs/premium_customers1.jpg" />
                        <h4>Premium Customers</h4>
                    </center>
                </div>
            </div>
        </div>
    </section>
    <section>
    </section>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <center>
                        <h2>Our Process</h2>
                        <p><b>We have a Simple 3 Step Process</b></p>
                    </center>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <center>
                        <img width="300px" src="imgs/signup.jpg" />
                        <h4>Sign Up</h4>
                    </center>
                </div>
                <div class="col-md-4">
                    <center>
                        <img width="300px" src="imgs/search_flights1.jpg" />
                        <h4>Search Flights</h4>
                    </center>
                </div>
                <div class="col-md-4">
                    <center>
                        <img width="300px" src="imgs/travel.jpg" />
                        <h4>Travel and Enjoy</h4>
                        <br />
                    </center>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
