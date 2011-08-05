<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Browse_Cars.aspx.cs" Inherits="CarTrackingSystem.Browse_Cars"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head  >
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
    <meta name="description" content="" />
    <meta name="generator" content="HTML-Kit" />
    <title>Browse Inventory</title>
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
        <h5 class="info-title">Browse Inventory</h5>
            <br />
            <h3>Refine Search</h3>
                
            <br />
            <asp:Label ID="lblCarID" runat="server" Text="Car ID" 
                style="position: relative; left: 25px"></asp:Label>
            <asp:TextBox ID="tbCarID" runat="server"  
                style="height: 20px; width: 150px; left: 93px; position: relative; margin-bottom: 0px;"></asp:TextBox>
            
            <asp:Label ID="lblModel" runat="server" Text="Model" 
                Style="position:relative; left: 125px;"></asp:Label>
            <asp:DropDownList ID="ddlModel" runat="server"
                style="left: 195px; position: relative; height: 24px; width: 155px;" 
                AutoPostBack="True" onselectedindexchanged="ddlModel_SelectedIndexChanged">
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
                style="left: 104px; position: relative; height: 24px; width: 155px" 
                AppendDataBoundItems="True"    DataSourceID="SqlDataSource1" DataTextField="Trim" 
                DataValueField="Trim" AutoPostBack="True" 
                onselectedindexchanged="ddlTrim_SelectedIndexChanged" 
                >
            </asp:DropDownList>  
                        
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:VWCTSConnectionString %>" 
                SelectCommand="SELECT [Trim] FROM [Trim] WHERE ([Model] = @Model)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlModel" DefaultValue="Blank" Name="Model" 
                        PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
                        
            <asp:Label ID="lblColor" runat="server" Text="Color" 
                Style="position:relative; left: 137px;"></asp:Label>
            <asp:DropDownList ID="ddlColor" runat="server"    
                style="left: 212px; position: relative; height: 24px; width: 155px">
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
                style="left: 52px; position: relative; height: 24px; width: 155px">
                <asp:ListItem></asp:ListItem>
                <asp:ListItem>Automatic</asp:ListItem>
                <asp:ListItem>Manual</asp:ListItem>
            </asp:DropDownList>
            
            <asp:Label ID="lblListPrice" runat="server" Text="List Price" 
                Style="position: relative; left: 86px"></asp:Label>
            <asp:TextBox ID="tbListPriceLow" runat="server" 
                style="position: relative; left: 135px; height: 20px; width: 69.5px; top: 0px;" 
                        ontextchanged="tbListPriceLow_TextChanged"></asp:TextBox>
            
            <asp:TextBox ID="tbListPriceHigh" runat="server"
                style="position: relative; left: 135px; height: 20px; width: 69.5px; top: 0px;" 
                        ontextchanged="tbListPrice0_TextChanged"></asp:TextBox>
            
            <br /><br />
            <asp:Button ID="btSearch" runat="server" Text="Search"
                style="position: relative; left: 25px;" 
                onclick="Button1_Click" />
                   
            <br /><br />        
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
                Width="100%" AllowPaging="True" PageSize="10" OnDataBound="GridView1_DataBound"
                OnPageIndexChanging="GridView1_PageIndexChanging" DataKeyNames="ID"
                OnRowCommand="GridView1_RowCommand" OnSorting="GridView1_Sorting"
                OnRowEditing="GridView1_RowEditing" OnRowDeleting="GridView1_RowDeleting"
                OnSelectedIndexChanged="GridView1_SelectedIndexChanged" 
                AutoGenerateSelectButton="True" 
                GridLines="None" AutoGenerateDeleteButton="True">
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>
                    <asp:ButtonField Text="Details" CommandName="ShowDetails" />
                </Columns>
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
