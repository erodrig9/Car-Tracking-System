<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Car.aspx.cs" Inherits="CarTrackingSystem.Car1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type"
    content="text/html; charset=windows-1252" />
    <meta name="description" content="" />
    <meta name="generator" content="HTML-Kit" />
    <title>Car</title>
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

<h1 id="top">&nbsp;<asp:Image ID="Image2" runat="server" Height="50px" 
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
<h5 class="info-title">Car</h5>
    <br />
    <h3>Car Info</h3>
    <br />
    
    <asp:Image ID="imgCar" runat="server" ImageUrl="" Visible="true"
        style="left: 25px; position: relative"/>
    
    <br /><br /><br />
    <asp:Label ID="lblCarID" runat="server" Text="Car ID" 
        style="position: relative; left: 25px"></asp:Label>
    <asp:TextBox ID="tbCarID" runat="server" ReadOnly="true"  
        style="height: 20px; width: 150px; left: 115px; position: relative; margin-bottom: 0px;"></asp:TextBox>
    
    
    <asp:Label ID="lblVin" runat="server" Text="VIN" 
        Style="position:relative; left: 145px;"></asp:Label>
    <asp:TextBox ID="tbVin" runat="server" ReadOnly="true" 
        style="height: 20px; width: 150px; left: 249px; position: relative;" ></asp:TextBox>

    
    <br /><br />
    <asp:Label ID="lblModel" runat="server" Text="Model" 
        Style="position:relative; left: 25px;"></asp:Label>
    <asp:TextBox ID="tbModel" runat="server" ReadOnly="true" 
        style="height: 20px; width: 150px; left: 116px; position: relative;" ></asp:TextBox>

    <asp:Label ID="lblTrim" runat="server" Text="Trim" 
        Style="position:relative; left: 146px;"></asp:Label>
    <asp:TextBox ID="tbTrim" runat="server" ReadOnly="true" 
        style="height: 20px; width: 150px; left: 246px; position: relative;" ></asp:TextBox>
            
    <br /><br />
    <asp:Label ID="lblMiles" runat="server" Text="Miles" 
        Style="position:relative; left: 25px;"></asp:Label>
    <asp:TextBox ID="tbMiles" runat="server" ReadOnly="true" 
        style="height: 20px; width: 150px; left: 120px; position: relative;" ></asp:TextBox>
        
    <asp:Label ID="lblColor" runat="server" Text="Color" 
        Style="position:relative; left: 150px;"></asp:Label>
    <asp:TextBox ID="tbColor" runat="server" ReadOnly="true" 
        style="height: 20px; width: 150px; left: 245px; position: relative;" ></asp:TextBox>


    <br /><br />
    <asp:Label ID="lblTransmission" runat="server" Text="Transmission" 
        Style="position:relative; left: 25px;"></asp:Label>
    <asp:TextBox ID="tbTransmission" runat="server" ReadOnly="true"
        style="height: 20px; width: 150px; left: 74px; position: relative;" ></asp:TextBox>

    <asp:Label ID="lblListPrice" runat="server" Text="List Price" 
        Style="position: relative; left: 104px"></asp:Label>
    <asp:TextBox ID="tbListPrice" runat="server" ReadOnly="true"
        style="height: 20px; width: 150px; left: 174px; position: relative;" ></asp:TextBox>

    <br /><br />
    <asp:Label ID="lblLocation" runat="server" Text="Location" 
        Style="position:relative; left: 25px;"></asp:Label>
    <asp:TextBox ID="tbLocation" runat="server" ReadOnly="true"
        style="height: 20px; width: 150px; left: 101px; position: relative;" ></asp:TextBox>
    
    <asp:Label ID="lblStatus" runat="server" Text="Status" 
        Style="position:relative; left: 132px;"></asp:Label>
    <asp:TextBox ID="tbStatus" runat="server" ReadOnly="true"
        style="height: 20px; width: 150px; left: 219px; position: relative;" ></asp:TextBox>
    
    <br /><br />
    <asp:Label ID="lblPackages" runat="server" Text="Packages" 
        Style="position:relative; left: 25px;"></asp:Label>
    <asp:CheckBoxList ID="cblPackages" runat="server" 
        style="position: relative; left: -122px; width: 477px;">
    </asp:CheckBoxList>
    
    <br /><br />
    <asp:Label ID="LblInvoice" runat="server" Text="Invoice" Visible="false"
        Style="position:relative; left: 25px;"></asp:Label>
    <asp:TextBox ID="tbInvoice" runat="server" ReadOnly="true" Visible="false"
        style="height: 20px; width: 150px; left: 111px; position: relative;" ></asp:TextBox>
    
    <br /><br />
    <asp:Button ID="btnProcessOrder" runat="server" Text="Process Order"  
        style="height: 26px; position: relative; left: 25px" onclick="btnProcessOrder_Click"/>
        
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" 
        style="height: 26px; position: relative; left: 44px" onclick="btnCancel_Click"/>
    
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
