<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Process_Order.aspx.cs"   Inherits="CarTrackingSystem.Process_Order"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type"
content="text/html; charset=windows-1252" />
<meta name="description" content="" />
<meta name="generator" content="HTML-Kit" />
<title>Process Order</title>
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
<h5 class="info-title">Process Order</h5>

    <br />
    <h3 id="H1">Customer Info</h3>
    
    <br />
    <asp:Label ID="lblExistingCustomer" runat="server" Text="Existing Customer: Enter ID" 
        style=" font-weight:bold; position: relative; left: 25px;"></asp:Label>
    <br />
    <asp:TextBox ID="tbExistingCustomer" runat="server"       
        style="left: 152px; position: relative; height: 20px; width: 148px;"></asp:TextBox>
    <asp:Button ID="btnFind" runat="server" 
        style="left: 186px; position: relative; height: 23px; width: 70px" 
        Text="Find" onclick="btnFind_Click" />
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br /><br />
    <asp:Label ID="lblLastName" runat="server" Text="Last Name" 
        style="position: relative; left: 25px;"></asp:Label>
    <asp:TextBox ID="tbLastName" runat="server"       
        style="left: 86px; position: relative; height: 20px; width: 148px;"></asp:TextBox>
    
    
    <asp:Label ID="lblFirstName" runat="server" Text="First Name" 
        style="position: relative; left: 121px;"></asp:Label>
    <asp:TextBox ID="tbFirstName" runat="server"        
        style="left: 175px; position: relative; height: 20px; width: 148px;"></asp:TextBox>
    
    <br /><br />
    <asp:Label ID="lblAddress" runat="server" Text="Address" 
        style="position: relative; left: 25px"></asp:Label>   
    <asp:TextBox ID="tbAddress" runat="server" 
        style="left: 101px; position: relative; height: 20px; width: 148px"></asp:TextBox>
    

    <asp:Label ID="lblCity" runat="server" Text="City" 
        style="position: relative; left: 136px;"></asp:Label>
    <asp:TextBox ID="tbCity" runat="server" 
        style="left: 231px; position: relative; height: 20px; width: 148px;"></asp:TextBox>
    
    <br /><br />
    <asp:Label ID="lblState" runat="server" Text="State" 
        style="position: relative; left: 25px; height: 16px;"></asp:Label>
    <asp:TextBox ID="tbState" runat="server"  
        style="left: 118px; position: relative; height: 20px; width: 148px"></asp:TextBox>
 

    <asp:Label ID="lblZipCode" runat="server" Text="Zip Code" 
        style="position: relative; left:154px;"></asp:Label>
    <asp:TextBox ID="tbZipCode" runat="server" 
        style="left: 220px; position: relative; height: 20px; width: 148px;"></asp:TextBox>
           
    <br /><br />
    <asp:Label ID="lblPhoneNumber" runat="server" Text="Phone Number" 
        style="position: relative; left: 25px;"></asp:Label>
    <asp:TextBox ID="tbAreaCode" runat="server"   
        style="left: 64px; position: relative; height: 20px; width: 40px; top: 0px;" 
        MaxLength="3"></asp:TextBox>
    <asp:TextBox ID="tbPhoneNumber" runat="server" 
        style="left: 70px; position: relative; height: 20px; width: 91px;" 
        MaxLength="7"></asp:TextBox>

    <br /><br /><br /><br />
    <h3 id="H1">Transaction Info</h3>

    <br /><br />
    <asp:Label ID="lblCarID" runat="server" Text="Car ID" 
        style="position: relative; left: 25px;"></asp:Label> 
    <asp:TextBox ID="tbCarID" runat="server" 
        style="left: 114px; position: relative; height: 20px; width: 150px; "></asp:TextBox>     
        
    <asp:Button ID="btnFindCar" runat="server" 
        style="left: 145px; position: relative; height: 23px; width: 70px" 
        Text="Find" onclick="btnFindCar_Click" />
    
    <br /><br />
    <asp:Label ID="lblSalesPrice" runat="server" Text="Sales Price" 
        style="position: relative; left: 25px;"></asp:Label> 
    <asp:TextBox ID="tbSalesPrice" runat="server"   
        style="left: 83px; position: relative; height: 20px; width: 150px;"></asp:TextBox>      
        
    <asp:Label ID="lblDownPayment" runat="server" Text="Down Payment" 
        style="position: relative; left: 115px;"></asp:Label> 
    <asp:TextBox ID="tbDownPayment" runat="server" 
        style="left: 146px; position: relative; height: 20px; width: 150px;"></asp:TextBox>   
        
    <br /><br />
    <asp:Label ID="lblTradeValue" runat="server" Text="Trade Value" 
        style="position: relative; left: 25px;"></asp:Label> 
    <asp:TextBox ID="tbTradeValue" runat="server" 
        style="left: 81px; position: relative; height: 20px; width: 150px; top: 0px;"></asp:TextBox>   
    
    <asp:Label ID="lblAmountFinanced" runat="server" Text="Amount Financed" 
        style="position: relative; left: 114px;"></asp:Label> 
    <asp:TextBox ID="tbAmountFinanced" runat="server" 
        style="left: 130px; position: relative; height: 20px; width: 150px;"></asp:TextBox>   
        
    <br /><br /><br />
    <asp:Button ID="btnSubmit" runat="server" 
        style="left: 25px; position: relative; height: 26px; width: 70px" 
        Text="Submit" onclick="btnSubmit_Click" />
    <asp:Button ID="btnCancel" runat="server" 
        style="left: 80px; position: relative; height: 26px; width: 62px" 
        Text="Cancel" onclick="btnCancel_Click" />
     
    <br /><br />  
    <asp:Label ID="Label2" runat="server" Text=""
        style="left: 25px; position: relative;"></asp:Label>   
    <br /><br />


    <br /><br /><br /><br /><br /><br /><br /><br />
</div>
</div><!-- end of inside -->








<div id="footer"> 
  <h5>Public Domain / No Copyrightref=&quot;http://www.free-css-templates.com/&quot;&gt;Free CSS 
      Templates, Thanks to <a href="http://www.legalhelpers.com/chapter-13-bankruptcy/chapter13.html">
      Chapter 13 Bankruptcy</a></h5>
</div>
    </form>
</body>
</html>
