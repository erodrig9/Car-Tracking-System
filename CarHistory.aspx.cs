using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarTrackingSystem
{
  public partial class CarHistory : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      var dataSource = (IQueryable)Session["DataSource"];
      string department = (string)Session["Department"];

      if (Session["Employee_ID"] == null)
        Response.Redirect("Login.aspx");

      if (Session["CarHistory"] == null)
        Response.Redirect("Browse_History.aspx");

      int carID = (int)Session["CarHistory"];
      
      VWCTSDataContext db = new VWCTSDataContext();
      int customerID = (from n in db.Histories
                        where n.Car_ID == carID
                        select n.Customer_ID).First();

      var source = from n in db.Histories
                   where n.Car_ID == carID
                   select n;

      Session["DataSource"] = source;
      var gridSource = from n in source
               orderby n.Date ascending
               select new
               {
                 Date = n.Date,
                 Type = n.Type,
                 Description = n.Description
               };

      GridView1.DataSource = gridSource;
      GridView1.DataBind();

      var car = (from n in db.Cars
                where n.Car_ID == carID
                select n).Single();

      tbCarID.Text = carID.ToString();
      tbVIN.Text = car.VIN;
      tbModel.Text = car.Model;
      tbTrim.Text = car.Trim;
      tbTransmission.Text = car.Transmission;
      tbColor.Text = car.Color;
      tbMiles.Text = car.Miles.ToString();

      var customer = (from n in db.Customers
                      where n.Customer_ID == customerID
                      select n).Single();

      tbLastName.Text = customer.Last_Name;
      tbFirstName.Text = customer.First_Name;
      tbAreaCode.Text = customer.Area_Code.ToString();
      tbPhoneNumber.Text = customer.Phone_Number.ToString();
      tbCity.Text = customer.City;
      tbState.Text = customer.State;
      tbZipCode.Text = customer.Zip_Code.ToString();
      tbAddress.Text = customer.Street_Number;
      tbCustomerID.Text = customer.Customer_ID.ToString();
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
      IQueryable<History> source = (IQueryable<History>)Session["DataSource"];
      var gridSource = from n in source
                       orderby n.Date ascending
                       select new
                       {
                         ID = n.Customer_ID,
                         Car = n.Car_ID,
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
      if (GridView1.PageCount > 1)
        GridView1.BottomPagerRow.Visible = true;
    }

    protected void btnMaintenance_Click(object sender, EventArgs e)
    {
      Session["Car_ID"] = int.Parse(tbCarID.Text);
      Session["Customer_ID"] = int.Parse(tbCustomerID.Text);
      Response.Redirect("Maintenance.aspx");
    }
  }
}
