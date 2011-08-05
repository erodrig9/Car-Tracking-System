<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Maintenance.aspx.cs" Inherits="CarTrackingSystem.Maintenance"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type"
content="text/html; charset=windows-1252" />
<meta name="description" content="" />
<meta name="generator" content="HTML-Kit" />
<title>Maintenance</title>
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
<li><a href="Process_Order.aspx">Process Orders</a></li>
<li><a href="Maintenance.aspx">Maintenance</a></li>
<li><a href="Add_Car.aspx">New Car</a></li>
<li><a href="Add_Employee.aspx">New Employee</a></li>

</ul>
</div>

<div id="content">
<h5 class="info-title">Maintenance/Repair</h5>
    <br />
    <h3>Customer Info</h3>
    
    <br />
    <asp:Label ID="lblExistingCustomer" runat="server" Text="Existing Customer: Enter ID" 
        style=" font-weight:bold; position: relative; left: 25px;"></asp:Label>
    <br />
    <asp:TextBox ID="tbExistingCustomer" runat="server"       
        style="left: 153px; position: relative; height: 20px; width: 148px;"></asp:TextBox>
    <asp:Button ID="btnFind" runat="server" 
        style="left: 186px; position: relative; height: 23px; width: 70px" 
        Text="Find" onclick="btnFind_Click" />
    
    <br /><br />
    <asp:Label ID="lblLastName" runat="server" Text="Last Name" 
        style="position: relative; left: 25px;"></asp:Label>
    <asp:TextBox ID="tbLastName" runat="server" ReadOnly="true"  
        style="left: 86px; position: relative; height: 20px; width: 148px;"></asp:TextBox>
    
    
    <asp:Label ID="lblFirstName" runat="server" Text="First Name" 
        style="position: relative; left: 121px;"></asp:Label>
    <asp:TextBox ID="tbFirstName" runat="server" ReadOnly="true"        
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
        
    <br /><br /><br />
    <h3>Car Info</h3>
    
    <br />
    <asp:Label ID="lblCarID" runat="server" Text="Car ID" Style="position:relative; left: 25px;" ></asp:Label> 
    <asp:TextBox ID="tbCarID" runat="server"  
        style="position: relative; left: 113px; height: 20px; width: 150px" >
    </asp:TextBox>
    
    <asp:Button ID="btnFindCar" runat="server" 
        style="left: 145px; position: relative; height: 23px; width: 70px" 
        Text="Find" onclick="btnFindCar_Click" />
        
    <br /><br />
    <asp:Label ID="lblVin" runat="server" Text="VIN" 
        Style="position: relative; left: 25px"></asp:Label>
    <asp:TextBox ID="tbVin" runat="server" ReadOnly="true"
        style="position: relative; left: 128px; height: 20px; width: 150px">
    </asp:TextBox>
        
    <asp:Label ID="lblModel" runat="server" Text="Model" 
        Style="position:relative; left: 161px;"></asp:Label>
    <asp:TextBox ID="tbModel" runat="server" ReadOnly="true"
        style="position: relative; left: 244px; height: 20px; width: 150px">
    </asp:TextBox>
    
    <br /><br />
    <asp:Label ID="lblTrim" runat="server" Text="Trim" 
        Style="position:relative; left: 25px;"></asp:Label>
    <asp:TextBox ID="tbTrim" runat="server"  ReadOnly="true"
        style="position: relative; left: 124px; height: 20px; width: 150px">
    </asp:TextBox>
    
    <asp:Label ID="lblMiles" runat="server" Text="Miles" 
        Style="position: relative; left: 157px"></asp:Label>
    <asp:TextBox ID="tbMiles" runat="server"
        Style="position: relative; left: 244px; height: 20px; width: 150px"></asp:TextBox>
    <br /><br /><br />
    <h3>Services</h3>
    
    <br />
    <asp:CheckBox ID="cbOilChange" runat="server" style="position: relative; left: 151px" 
        Text="Oil Change" />
    <asp:CheckBox ID="cbBrakeInspection" runat="server" style="position: relative; left: 179px" 
        Text="Brake Inspection" />
    <asp:CheckBox ID="cbCoolingSystem" runat="server" style="position: relative; left: 221px" 
        Text="Cooling System" />
        
    <br />
    <asp:CheckBox ID="cbSuspension" runat="server" style="position: relative; left: 151px" 
        Text="Suspension" />
    <asp:CheckBox ID="cbTransmission" runat="server" style="position: relative; left: 175px" 
        Text="Transmission" />
    <asp:CheckBox ID="cbTireRotation" runat="server" style="position: relative; left: 237px" 
        Text="Tire Rotation" />
        
    <br />
    <asp:CheckBox ID="cbAirConditioner" runat="server" style="position: relative; left: 151px" 
        Text="Air Conditioner" />
    <asp:CheckBox ID="cbScheduledMaintenance" runat="server" style="position: relative; left: 158px" 
        Text="Scheduled Maintenance" />
    <asp:CheckBox ID="cbOther" runat="server" style="position: relative; left: 158px" 
        Text="Other" />
    
    <br /><br />
    <asp:Label ID="lblAdditionalInfo" runat="server" Text="Additional Information" 
        Style="position: relative; left: 25px"></asp:Label>
    <br />
    <asp:TextBox ID="tbAdditionalInfo" runat="server" 
        Style="position: relative; left: 152px; top: 0px; width: 286px; height: 79px;" 
        TextMode="MultiLine"></asp:TextBox>
        
    <br /><br />
    <asp:Label ID="lblTime" runat="server" Text="Time" 
        Style="position: relative; left: 25px"></asp:Label>
    <asp:DropDownList ID="ddlHour" runat="server" 
        Style="position: relative; left: 121px">
        <asp:ListItem>12</asp:ListItem>
        <asp:ListItem>1</asp:ListItem>
        <asp:ListItem>2</asp:ListItem>
        <asp:ListItem>3</asp:ListItem>
        <asp:ListItem>4</asp:ListItem>
        <asp:ListItem>5</asp:ListItem>
        <asp:ListItem>6</asp:ListItem>
        <asp:ListItem>7</asp:ListItem>
        <asp:ListItem>8</asp:ListItem>
        <asp:ListItem>9</asp:ListItem>
        <asp:ListItem>10</asp:ListItem>
        <asp:ListItem>11</asp:ListItem>
    </asp:DropDownList>
    <asp:Label ID="lblColon" runat="server" Text=":"  
        Style="position: relative; left: 120px" Font-Bold="True" Font-Size="Large"></asp:Label>
    <asp:DropDownList ID="ddlMinute" runat="server"  Style="position: relative; left: 120px">
        <asp:ListItem>00</asp:ListItem>
        <asp:ListItem>05</asp:ListItem>
        <asp:ListItem>10</asp:ListItem>
        <asp:ListItem>15</asp:ListItem>
        <asp:ListItem>20</asp:ListItem>
        <asp:ListItem>25</asp:ListItem>
        <asp:ListItem>30</asp:ListItem>
        <asp:ListItem>35</asp:ListItem>
        <asp:ListItem>40</asp:ListItem>
        <asp:ListItem>45</asp:ListItem>
        <asp:ListItem>50</asp:ListItem>
        <asp:ListItem>55</asp:ListItem>
    </asp:DropDownList>
    <asp:DropDownList ID="ddl12Hour" runat="server"  Style="position: relative; left: 122px">
        <asp:ListItem>AM</asp:ListItem>
        <asp:ListItem>PM</asp:ListItem>
    </asp:DropDownList>
    
    <br /><br /><br />
    <asp:Button ID="btnSubmit" runat="server" 
       style="left: 25px; position: relative; height: 26px; width: 60px" 
        Text="Submit" onclick="btnSubmit_Click" />
    <asp:Button ID="btnCancel" runat="server" 
       style="left: 90px; position: relative; height: 26px; width: 60px" 
        Text="Cancel" onclick="btnCancel_Click" />
    
    <br /><br />  
    <asp:Label ID="Label1" runat="server" Text=""
        style="left: 25px; position: relative;"
        ></asp:Label>
      
    
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
