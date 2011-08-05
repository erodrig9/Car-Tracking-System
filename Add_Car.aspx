<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_Car.aspx.cs" Inherits="CarTrackingSystem.Add_Car"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">



<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type"
        content="text/html; charset=windows-1252" />
    <meta name="description" content="" />
    <meta name="generator" content="HTML-Kit" />
    <title>Add Car</title>
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
<h5 class="info-title">Add Car</h5>
    
    <br /><br />
    <asp:Label ID="lblVin" runat="server" Text="VIN" 
        Style="position: relative; left: 25px"></asp:Label>
    <asp:TextBox ID="tbVin" runat="server"  
        style="position: relative; left: 129px; height: 20px; width: 150px;" 
        MaxLength="17" TabIndex="1"></asp:TextBox>
        
    <asp:Label ID="lblModel" runat="server" Text="Model" 
        Style="position:relative; left: 159px;"></asp:Label>
    <asp:DropDownList ID="ddlModel" runat="server"
        style="left: 249px; position: relative; height: 24px; width: 155px;" 
        AutoPostBack="True" onselectedindexchanged="ddlModel_SelectedIndexChanged" 
        TabIndex="2">
        <asp:ListItem></asp:ListItem>
        <asp:ListItem>Beetle</asp:ListItem>
        <asp:ListItem>CC</asp:ListItem>
        <asp:ListItem>GLI</asp:ListItem>
        <asp:ListItem>Golf</asp:ListItem>
        <asp:ListItem>GTI</asp:ListItem>
        <asp:ListItem>Jetta</asp:ListItem>
        <asp:ListItem>Passat</asp:ListItem>
    </asp:DropDownList>
    
    <br /><br />
    <asp:Label ID="lblTrim" runat="server" Text="Trim" 
        Style="position:relative; left: 25px;"></asp:Label>
    <asp:DropDownList ID="ddlTrim" runat="server"  
        style="left: 125px; position: relative; height: 24px; width: 155px; top: 0px;" 
        AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="Trim" 
        DataValueField="Trim" AutoPostBack="True" 
        onselectedindexchanged="ddlTrim_SelectedIndexChanged" TabIndex="3">
    </asp:DropDownList>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:VWCTSConnectionString %>" 
        SelectCommand="SELECT * FROM [Trim] WHERE ([Model] = @Model)" >
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlModel" DefaultValue="Blank" Name="Model" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    <asp:Label ID="lblColor" runat="server" Text="Color" 
        Style="position:relative; left: 157px;"></asp:Label>
    <asp:DropDownList ID="ddlColor" runat="server"    
        style="left: 252px; position: relative; height: 24px; width: 155px" 
        TabIndex="4">
        <asp:ListItem></asp:ListItem>
        <asp:ListItem>Black</asp:ListItem>
        <asp:ListItem>Blue</asp:ListItem>
        <asp:ListItem>Gray</asp:ListItem>
        <asp:ListItem>Red</asp:ListItem>
        <asp:ListItem>Silver</asp:ListItem>
        <asp:ListItem>White</asp:ListItem>
    </asp:DropDownList>
    
    
    <br /><br />
    <asp:Label ID="lblTransmission" runat="server" Text="Transmission" 
        Style="position:relative; left: 25px;"></asp:Label>
    <asp:DropDownList ID="ddlTransmission" runat="server"     
        style="left: 73px; position: relative; height: 24px; width: 155px" 
        TabIndex="5">
        <asp:ListItem></asp:ListItem>
        <asp:ListItem>Automatic</asp:ListItem>
        <asp:ListItem>Manual</asp:ListItem>
    </asp:DropDownList>
    
    <asp:Label ID="lblLocation" runat="server" Text="Location"
        Style="position: relative; left: 105px"></asp:Label>
    <asp:TextBox ID="tbLocation" runat="server"       
        style="position: relative; left: 181px; height: 20px; width: 150px;" 
        TabIndex="6"></asp:TextBox>
    
    <br /><br />
    <asp:Label ID="lblInvoice" runat="server" Text="Invoice" 
        Style="position: relative; left: 25px"></asp:Label>
    <asp:TextBox ID="tbInvoice" runat="server"       
        style="position: relative; left: 111px; height: 20px; width: 150px;" 
        TabIndex="7"></asp:TextBox>
    
    <asp:Label ID="lblListPrice" runat="server" Text="List Price" 
        Style="position: relative; left: 142px"></asp:Label>
    <asp:TextBox ID="tbListPrice" runat="server"  
        style="position: relative; left: 212px; height: 20px; width: 150px" 
        TabIndex="8"></asp:TextBox>
 
     <br /><br />
    <asp:Label ID="lblPackages" runat="server" Text="Packages"
        Style="position:relative; left: 25px;"></asp:Label>
    <asp:CheckBoxList ID="cblPackages" runat="server" 
        style="position: relative; left: -122px; width: 477px;" 
        TabIndex="9">
    </asp:CheckBoxList>
    
    <br />
    <asp:Label ID="lblUploadPhoto" runat="server" Text="Upload Photo" 
        Style="position: relative; left: 25px"></asp:Label>
    <asp:FileUpload ID="uploadPhoto" runat="server" 
        style="position: relative; left: 72px; top: 0px;" 
        TabIndex="10"/>
    <asp:RegularExpressionValidator 
     id="RegularExpressionValidator1" runat="server" style="position: relative; left: 90px; top: 0px;" 
     ErrorMessage="Only jpeg, png or bmp files are allowed!" 
     ValidationExpression="^.*\.([gG][iI][fF]|[jJ][pP][gG]|[jJ][pP][eE][gG]|[bB][mM][pP])$" 
     ControlToValidate="uploadPhoto"></asp:RegularExpressionValidator>
    
    <br /><br />
    <asp:Button ID="btnAddCar" runat="server" onclick="btnAdd_Car_Click" 
        style="left: 25px; position: relative; height: 26px; width: 60px" 
        Text="Add" TabIndex="11" />
    <asp:Label ID="lblCarSubmitted" runat="server" Text=""
        style="left: 90px; position: relative;"></asp:Label>

    <br />
    <asp:Button ID="btnAddAnother" runat="server" 
        style="left: 25px; position: relative; height: 26px; width: 114px" 
        Text="Add Another Car" onclick="btnAddAnother_Click" Visible="False" 
        TabIndex="12" />
    
    <br />
    <asp:Image ID="imageUpload" runat="server" ImageUrl = " " Visible = "false" 
        Width = "297px" Height = "157px" style="left: 25px; position: relative;"/>  
    
    <br /><br /><br /><br /><br /><br /><br /><br /><br />
    <br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
</div>
</div><!-- end of inside -->




<div id="footer"> 
  <h5>Public Domain / No Copyright<br />
      Designed by <a href="http://www.free-css-templates.com/">Free CSS Templates</a>, 
      Thanks to <a href="http://www.legalhelpers.com/chapter-13-bankruptcy/chapter13.html">
      Chapter 13 Bankruptcy</a></h5>
</div>
    </form>
</body>
</html>
