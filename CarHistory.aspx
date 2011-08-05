<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CarHistory.aspx.cs" Inherits="CarTrackingSystem.CarHistory" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head  >
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
    <meta name="description" content="" />
    <meta name="generator" content="HTML-Kit" />
    <title>Car History</title>
    <link rel="stylesheet" type="text/css" href="layout.css" />
    <link rel="stylesheet" type="text/css" href="color.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="perm-links">
        <ul>
            <li><a href="Login.aspx">Logout</a></li>
        </ul>
    </div>
        <h1 id="top">&nbsp;<asp:Image ID="Image2" runat="server" Height="51px" 
             ImageUrl="~/images/VW_logo_redo1copy1.jpg" Width="75px" />
            &nbsp;Car Tracking System</h1>
    <div id="inside">
        <div id="main-menu">
            <h3>Site Index</h3>
            <ul>
                <li><a href="Browse_Cars.aspx">Inventory</a></li>
                <li><a href="Browse_History.aspx">History</a></li>
                <li><a href="Browse_Customers.aspx">Customers</a></li>
                <li><a href="Process_Order.aspx">Process Order</a></li>
                <li><a href="Maintenance.aspx">Maintenance</a></li>
                <li><a href="Add_Car.aspx">New Car</a></li>
                <li><a href="Add_Employee.aspx">New Employee</a></li>
            </ul>
        </div>
        <div id="content">
        <h5 class="info-title">Car History</h5>
            <br />
            <h3>Customer Info</h3> 
            <br />
            <asp:Label ID="lblLastName" runat="server" Text="Last Name" 
                style="position: relative; left: 25px;"></asp:Label>
            <asp:TextBox ID="tbLastName" runat="server" ReadOnly="true"      
                style="left: 86px; position: relative; height: 20px; width: 148px;"></asp:TextBox>
            
            <asp:Label ID="lblFirstName" runat="server" Text="First Name" 
                style="position: relative; left: 120px;"></asp:Label>
            <asp:TextBox ID="tbFirstName" runat="server" ReadOnly="true"        
                style="left: 174px; position: relative; height: 20px; width: 148px;"></asp:TextBox>
            
            <br /><br />
            <asp:Label ID="lblAddress" runat="server" Text="Address" 
                style="position: relative; left: 25px"></asp:Label>   
            <asp:TextBox ID="tbAddress" runat="server" ReadOnly="true" 
                style="left: 101px; position: relative; height: 20px; width: 148px"></asp:TextBox>
            

            <asp:Label ID="lblCity" runat="server" Text="City" 
                style="position: relative; left: 136px;"></asp:Label>
            <asp:TextBox ID="tbCity" runat="server" ReadOnly="true" 
                style="left: 230px; position: relative; height: 20px; width: 148px;"></asp:TextBox>
            
            <br /><br />
            <asp:Label ID="lblState" runat="server" Text="State" 
                style="position: relative; left: 25px; height: 16px;"></asp:Label>
            <asp:TextBox ID="tbState" runat="server" ReadOnly="true"  
                style="left: 118px; position: relative; height: 20px; width: 148px"></asp:TextBox>
         

            <asp:Label ID="lblZipCode" runat="server" Text="Zip Code" 
                style="position: relative; left:153px;"></asp:Label>
            <asp:TextBox ID="tbZipCode" runat="server" ReadOnly="true" 
                style="left: 219px; position: relative; height: 20px; width: 148px;"></asp:TextBox>
                   
            <br /><br />
            <asp:Label ID="lblPhoneNumber" runat="server" Text="Phone Number" 
                style="position: relative; left: 25px;"></asp:Label>
            <asp:TextBox ID="tbAreaCode" runat="server" ReadOnly="true"   
                style="left: 64px; position: relative; height: 20px; width: 40px; top: 0px;" 
                MaxLength="3"></asp:TextBox>
            <asp:TextBox ID="tbPhoneNumber" runat="server" ReadOnly="true" 
                style="left: 70px; position: relative; height: 20px; width: 91px;" 
                MaxLength="7"></asp:TextBox>
            
            <asp:Label ID="lblCustomerID" runat="server" Text="Customer ID" 
                style="position: relative; left:105px;"></asp:Label>
            <asp:TextBox ID="tbCustomerID" runat="server" ReadOnly="true" 
                style="left: 150px; position: relative; height: 20px; width: 148px;"></asp:TextBox>
                   
            <br /><br />
            <h3>Car Info</h3>           
            <br />
            <asp:Label ID="lblCarID" runat="server" Text="Car ID" 
                style="position: relative; left: 25px"></asp:Label>
            <asp:TextBox ID="tbCarID" runat="server" ReadOnly="true"
                style="height: 20px; width: 150px; left: 112px; position: relative; margin-bottom: 0px;"></asp:TextBox>
            
            <asp:Label ID="lblVIN" runat="server" Text="VIN" 
                Style="position:relative; left: 145px;"></asp:Label>
            <asp:TextBox ID="tbVIN" runat="server"  ReadOnly="true"
                style="height: 20px; width: 150px; left: 242px; position: relative; margin-bottom: 0px;"></asp:TextBox>
           
            
            <br /><br />
            <asp:Label ID="lblModel" runat="server" Text="Model" 
                style="position: relative; left: 25px"></asp:Label>
            <asp:TextBox ID="tbModel" runat="server"  ReadOnly="true"
                style="height: 20px; width: 150px; left: 113px; position: relative; margin-bottom: 0px;"></asp:TextBox>
            
            <asp:Label ID="lblTrim" runat="server" Text="Trim" 
                Style="position:relative; left: 146px;"></asp:Label>
            <asp:TextBox ID="tbTrim" runat="server"  ReadOnly="true"
                style="height: 20px; width: 150px; left: 239px; position: relative; margin-bottom: 0px;"></asp:TextBox>
           
           <br /><br />
           <asp:Label ID="lblTransmission" runat="server" Text="Transmission" 
                Style="position:relative; left: 25px;"></asp:Label>
            <asp:TextBox ID="tbTransmission" runat="server"  ReadOnly="true"
                style="height: 20px; width: 150px; left: 71px; position: relative; margin-bottom: 0px;"></asp:TextBox>
           
            <asp:Label ID="lblColor" runat="server" Text="Color" 
                style="position: relative; left: 104px"></asp:Label>
            <asp:TextBox ID="tbColor" runat="server"  ReadOnly="true"
                style="height: 20px; width: 150px; left: 193px; position: relative; margin-bottom: 0px;"></asp:TextBox>
            
           <br /><br />
            <asp:Label ID="lblMiles" runat="server" Text="Miles" 
                style="position: relative; left: 25px"></asp:Label>
            <asp:TextBox ID="tbMiles" runat="server"  ReadOnly="true"
                style="height: 20px; width: 150px; left: 117px; position: relative; margin-bottom: 0px;"></asp:TextBox>
            
            <br /><br />
            <asp:Button ID="btnMaintenance" runat="server" Text="Maintenance" 
                style="left: 25px; position: relative;" onclick="btnMaintenance_Click"/>
            
                   
            <br /><br /> 
            <h3>Car History</h3>              
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
                Width="100%" OnDataBound="GridView1_DataBound"
                OnPageIndexChanging="GridView1_PageIndexChanging"
                OnSelectedIndexChanged="GridView1_SelectedIndexChanged" GridLines="None" AllowPaging="True" 
                PageSize="15">
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>

            <br /><br /><br /><br /><br /><br /><br /><br />
            <br /><br /><br /><br /><br /><br /><br /><br />
            <br /><br /><br /><br /><br /><br /><br /><br />

        </div>
    </div>
    <!-- end of inside -->
    <div id="footer">
        <h5>
            Public Domain / No Copyrightbr /&gt; Designed by Thanks to Thanks to <a href="http://www.legalhelpers.com/chapter-13-bankruptcy/chapter13.html">
                Chapter 13 Bankruptcy</a></h5>
    </div>
    </form>
</body>
</html>
