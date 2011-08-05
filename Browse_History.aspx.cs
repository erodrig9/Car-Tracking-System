using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarTrackingSystem
{
  public partial class Browse_History : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      var dataSource = (IQueryable)Session["DataSource"];
      string department = (string)Session["Department"];

      if (Session["Employee_ID"] == null)
        Response.Redirect("Login.aspx");

      if (!Page.IsPostBack)
      {
        Session["CarHistory"] = null;

        VWCTSDataContext db = new VWCTSDataContext();
        var source = from n in db.Histories
                     where n.Type == "Initial Delivery"
                     select n;

        Session["DataSource"] = source;
        if(Session["Customer_ID"] != null){
          int id = (int)Session["Customer_ID"];
          tbCustomerID.Text = id.ToString();
          source = from n in source
                   where n.Customer_ID == id
                   select n;
        }
        
        /* Dim q = From e1 In db.Employees, e2 In e1.Employees _
            Where e1.City = e2.City _
            Select FirstName1 = e1.FirstName, LastName1 = e1.LastName, _
                   FirstName2 = e2.FirstName, LastName2 = e2.LastName, e1.City*/

        var gridSource = from n in source
                         join p in db.Customers on n.Customer_ID equals p.Customer_ID
                         join q in db.Cars on n.Car_ID equals q.Car_ID
                         orderby n.Date ascending
                         select new
                         {
                           Customer = n.Customer_ID,
                           Name = string.Concat(p.Last_Name, ", ", p.First_Name),
                           Car = n.Car_ID,
                           Model = q.Model,
                           Trim = q.Trim,
                           Date = n.Date,
                           Type = n.Type,
                           Description = n.Description
                         };

        GridView1.DataSource = gridSource;
        GridView1.DataBind();
      }

      lblCarID.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
      lblVIN.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
      VWCTSDataContext db = new VWCTSDataContext();
      var queryResults = from n in db.Histories
                         where n.Type == "Initial Delivery"
                         select n;

      if (tbCarID.Text != "")
      {
        int id = 0;
        if (!int.TryParse(tbCarID.Text, out id))
        {
          lblCarID.ForeColor = System.Drawing.Color.Red;
          return;
        }

        queryResults = from n in queryResults
                       where id == n.Car_ID
                       select n;
      }

      if (tbCustomerID.Text != "")
      {
        int id = 0;
        if (!int.TryParse(tbCustomerID.Text, out id))
        {
          lblCustomerID.ForeColor = System.Drawing.Color.Red;
          return;
        }

        queryResults = from n in queryResults
                       where id == n.Customer_ID
                       select n;
      }

      if (tbVIN.Text != "")
      {
        var carID = (from n in db.Cars
                    where n.VIN == tbVIN.Text
                    select n.Car_ID).Single();

        queryResults = from n in queryResults
                       where carID == n.Car_ID
                       select n;      
      }

      if (tbLastName.Text != "")
      {
        var customerID = (from n in db.Customers
                          where tbLastName.Text == n.Last_Name
                          select n.Customer_ID).Single();

        queryResults = from n in queryResults
                       where customerID == n.Customer_ID
                       select n;
      }

      var gridSource = from n in queryResults
                       join p in db.Customers on n.Customer_ID equals p.Customer_ID
                       join q in db.Cars on n.Car_ID equals q.Car_ID
                       orderby n.Date ascending
                       select new
                       {
                         Customer = n.Customer_ID,
                         Name = string.Concat(p.Last_Name, ", ", p.First_Name),
                         Car = n.Car_ID,
                         Model = q.Model,
                         Trim = q.Trim,
                         Date = n.Date,
                         Type = n.Type,
                         Description = n.Description
                       };

      GridView1.DataSource = gridSource;
      Session["DataSource"] = queryResults;
      GridView1.DataBind();
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
      int carID = (int)GridView1.SelectedDataKey.Value;
      Session["CarHistory"] = carID;
      Response.Redirect("CarHistory.aspx");
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
      IQueryable<History> source = (IQueryable<History>)Session["DataSource"];
      VWCTSDataContext db = new VWCTSDataContext();
      var gridSource = from n in source
                       join p in db.Customers on n.Customer_ID equals p.Customer_ID
                       join q in db.Cars on n.Car_ID equals q.Car_ID
                       orderby n.Date ascending
                       select new
                       {
                         Customer = n.Customer_ID,
                         Name = string.Concat(p.Last_Name, ", ", p.First_Name),
                         Car = n.Car_ID,
                         Model = q.Model,
                         Trim = q.Trim,
                         Date = n.Date,
                         Type = n.Type,
                         Description = n.Description
                       };

      GridView1.DataSource = gridSource;
      GridView1.PageIndex = e.NewPageIndex;
      GridView1.DataBind();

    }

    protected void GridView1_DataBound(object sender, EventArgs e)
    {
      if(GridView1.PageCount > 1)
        GridView1.BottomPagerRow.Visible = true;
    }
  }
}
