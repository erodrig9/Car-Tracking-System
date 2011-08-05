<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Browse_History.aspx.cs" Inherits="CarTrackingSystem.Browse_History" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head  >
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
    <meta name="description" content="" />
    <meta name="generator" content="HTML-Kit" />
    <title>Browse History</title>
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
        <h5 class="info-title">Browse History</h5>
            <br />
            <h3>Refine Search</h3>
                
            <br />
            <asp:Label ID="lblCarID" runat="server" Text="Car ID" 
                style="position: relative; left: 25px"></asp:Label>
            <asp:TextBox ID="tbCarID" runat="server"  
                style="height: 20px; width: 150px; left: 112px; position: relative; margin-bottom: 0px;"></asp:TextBox>
            
            <asp:Label ID="lblVIN" runat="server" Text="VIN" 
                Style="position:relative; left: 145px;"></asp:Label>
            <asp:TextBox ID="tbVIN" runat="server"  
                style="height: 20px; width: 150px; left: 242px; position: relative; margin-bottom: 0px;"></asp:TextBox>
            
            <br /><br />
            <asp:Label ID="lblCustomerID" runat="server" Text="Customer ID" 
                style="position: relative; left: 25px;"></asp:Label>
            <asp:TextBox ID="tbCustomerID" runat="server"       
                style="left: 77px; position: relative; height: 20px; width: 148px;"></asp:TextBox>
            
            <asp:Label ID="lblLastName" runat="server" Text="Last Name" 
                style="position: relative; left: 111px;"></asp:Label>
            <asp:TextBox ID="tbLastName" runat="server"        
                style="left: 166px; position: relative; height: 20px; width: 150px;"></asp:TextBox>
            
            
            <br /><br />
            <asp:Button ID="btSearch" runat="server" Text="Search"
                style="position: relative; left: 25px;" 
                onclick="Button1_Click" />
                   
            <br /><br />        
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
                Width="100%" DataKeyNames="Car" OnDataBound="GridView1_DataBound"
                OnPageIndexChanging="GridView1_PageIndexChanging"
                OnSelectedIndexChanged="GridView1_SelectedIndexChanged" 
                AutoGenerateSelectButton="True" GridLines="None" AllowPaging="True" 
                PageSize="10">
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
            
            <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
                ContextTypeName="CarTrackingSystem.VWCTSDataContext" 
                Select="new (Car_ID, Model, Trim, Color, Transmission, List_Price, Location)" 
                TableName="Cars" Where="Status == @Status">
                <WhereParameters>
                    <asp:Parameter DefaultValue="On Lot" Name="Status" Type="String" />
                </WhereParameters>
            </asp:LinqDataSource>
            

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
