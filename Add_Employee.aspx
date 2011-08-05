<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_Employee.aspx.cs" Inherits="CarTrackingSystem.Add_Employee" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type"
        content="text/html; charset=windows-1252" />
    <meta name="description" content="" />
    <meta name="generator" content="HTML-Kit" />
    <title>Add Employee</title>
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
<h5 class="info-title">Add Employee</h5>

            <br />
    <h3>Employee Info</h3>
    
    <br />
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
        style="left: 63px; position: relative; height: 20px; width: 41px; top: 0px;" 
        MaxLength="3"></asp:TextBox>
    <asp:TextBox ID="tbPhoneNumber" runat="server" 
        style="left: 70px; position: relative; height: 20px; width: 91px;" 
        MaxLength="7"></asp:TextBox>
    
    <asp:Label ID="lblDepartment" runat="server" Text="Department" 
        style="position: relative; left:104px;"></asp:Label>
    <asp:DropDownList ID="ddlDepartment" runat="server"  
        style="left: 155px; position: relative; height: 24px; width: 155px; top: 0px;">
        <asp:ListItem></asp:ListItem>
        <asp:ListItem>Sales</asp:ListItem>
        <asp:ListItem>Admin</asp:ListItem>
    </asp:DropDownList>
    <br /><br />
    <h3>Credentials</h3>
    <br />   
    <asp:Label ID="lblUserName" runat="server" Text="UserName" 
        style="position: relative; left:25px;"></asp:Label>
    <asp:TextBox ID="tbUserName" runat="server" 
        style="left: 88px; position: relative; height: 20px; width: 148px;"></asp:TextBox>
           
    <asp:Label ID="lblPassword" runat="server" Text="Password" 
        style="left: 123px; position: relative; height: 20px; width: 91px;"></asp:Label>
    <asp:TextBox ID="tbPassword" runat="server" 
        style="left: 184px; position: relative; height: 20px; width: 148px;" 
        TextMode="Password" ></asp:TextBox>

     <br /><br />
    <asp:Label ID="lblPassword2" runat="server" Text="Retype Password" 
        style="left: 25px; position: relative; height: 20px; width: 91px;"></asp:Label>
    <asp:TextBox ID="tbPassword2" runat="server" 
        style="left: 47px; position: relative; height: 20px; width: 148px;" 
        TextMode="Password" ></asp:TextBox>
    
    <br /><br />
    <asp:Button ID="btnSubmit" runat="server" 
       style="left: 25px; position: relative; height: 26px; width: 60px" 
        Text="Submit" onclick="btnSubmit_Click" />
    <asp:Button ID="btnCancel" runat="server" 
       style="left: 90px; position: relative; height: 26px; width: 60px" 
        Text="Cancel" onclick="btnCancel_Click" />
      
    
    <br /><br />
    <asp:Button ID="btnNewEmployee" runat="server" Text="New Employee" Visible="false"
        style="left: 25px; position: relative; height: 26px;"/>
    <asp:Label ID="lblMessage" runat="server" Text=""
        Style="position:relative; left: 42px;" ForeColor="Red"></asp:Label>

    <br /><br /><br /><br /><br /><br /><br /><br />
</div>
</div><!-- end of inside -->




<div id="footer"> 
  <h5>Public Domain / No Copyrightopyright<br />
      Designed by <a href="http://www.free-css-templates.com/">Free CSS Templates</a>, 
      Thanks to <a href="http://www.legalhelpers.com/chapter-13-bankruptcy/chapter13.html">
      Chapter 13 Bankruptcy</a></h5>
</div>
    </form>
</body>
</html>