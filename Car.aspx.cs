using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarTrackingSystem
{
  public partial class Car1 : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      string department = (string)Session["Department"];
      if (department == null)
        Response.Redirect("Login.aspx");

      if (Session["Selected Car"] == null)
      {
        if (Request.UrlReferrer == null)
          Response.Redirect("Browse_Cars.aspx");
        else
          Response.Redirect(Request.UrlReferrer.ToString());
      }
      else
      {
        int id = (int)Session["Selected Car"];

        using (VWCTSDataContext db = new VWCTSDataContext())
        {
          var car = (from n in db.Cars
                     where n.Car_ID == id
                     select n).Single();

          tbCarID.Text = car.Car_ID.ToString();
          tbVin.Text = car.VIN.ToString();
          tbModel.Text = car.Model;
          tbTrim.Text = car.Trim;
          tbMiles.Text = car.Miles.ToString();
          tbColor.Text = car.Color;
          tbTransmission.Text = car.Transmission;
          tbListPrice.Text = car.Price.ToString();
          tbLocation.Text = car.Location;
          tbStatus.Text = car.Status;
          imgCar.ImageUrl = car.Picture;

          if (department == "Admin")
          {
            LblInvoice.Visible = true;
            tbInvoice.Visible = true;
            tbInvoice.Text = car.Invoice.ToString();
          }

          var options = from n in db.Car_Options
                        where n.Car_ID == car.Car_ID
                        select n;

          foreach (var n in options)
          {
            ListItem newItem = new ListItem();
            newItem.Enabled = true;
            newItem.Value = n.Package_ID.ToString();

            var package = (from p in db.Optional_Packages
                           where p.Package_ID == n.Package_ID
                           select p).Single();
            newItem.Text = package.Option_Name;
            cblPackages.Items.Add(newItem);
          }
        }
      }

      if (imgCar.ImageUrl == "" || imgCar.ImageUrl == null)
        imgCar.Visible = false;
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
      Session["Selected Car"] = null;
      Response.Redirect("Browse_Cars.aspx");
    }

    protected void btnProcessOrder_Click(object sender, EventArgs e)
    {
      Session["Car_ID"] = Session["Selected Car"];
      Response.Redirect("Process_Order.aspx");
    }
  }
}
