<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CarTrackingSystem.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <meta http-equiv="Content-Type"
    content="text/html; charset=windows-1252" />
    <meta name="description" content="" />
    <meta name="generator" content="HTML-Kit" />
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="layout.css" />
    <link rel="stylesheet" type="text/css" href="color.css" />
</head>
<body>
    <form id="form1" runat="server">
<div id="perm-links">
<ul>

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
<h5 class="info-title">Login</h5>
    <br />
    <h3>&nbsp</h3>
    <br /><br />
    
    <div align = "center">
        <asp:Login ID="Login1" runat="server" onauthenticate="Login1_Authenticate" >
        </asp:Login>
    </div>
    
    <br /><br /><br /><br /><br /><br /><br /><br /><br />
    <br /><br /><br /><br /><br /><br /><br /><br /><br />
    <br /><br /><br />
    </div>
    </div><!-- end of inside -->




    <div id="footer"> 
      <h5>Public Domain / No Copyright
          Designed by <a href="http://www.free-css-templates.com/">Free CSS Templates</a>, 
          Thanks to <a href="http://www.legalhelpers.com/chapter-13-bankruptcy/chapter13.html">
          Chapter 13 Bankruptcy</a></h5>
    </div>
    </form>
</body>
</html>
