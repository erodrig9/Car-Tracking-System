using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace CarTrackingSystem
{
    public partial class Maintenance : System.Web.UI.Page
    {
      protected void Page_Load(object sender, EventArgs e)
      {
        if (Session["Employee_ID"] == null)
          Response.Redirect("Login.aspx");

        lblFirstName.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
        lblLastName.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
        lblAddress.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
        lblCity.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
        lblState.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
        lblZipCode.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
        lblPhoneNumber.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
        lblAdditionalInfo.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");

        if (!IsPostBack)
        {
           if (Session["Last"] != null)
            tbLastName.Text = (string)Session["Last"];

          if (Session["First"] != null)
            tbFirstName.Text = (string)Session["First"];

          if (Session["Address"] != null)
            tbAddress.Text = (string)Session["Address"];

          if (Session["City"] != null)
            tbCity.Text = (string)Session["City"];

          if (Session["State"] != null)
            tbState.Text = (string)Session["State"];

          if (Session["City"] != null)
            tbZipCode.Text = (string)Session["City"];

          if (Session["Area"] != null)
            tbAreaCode.Text = (string)Session["Area"];

          if (Session["Phone"] != null)
            tbPhoneNumber.Text = (string)Session["Phone"];

          if (Session["Car_ID"] != null)
          {
            int carID = (int)Session["Car_ID"];

            using (VWCTSDataContext db = new VWCTSDataContext())
            {
              var car = (from n in db.Cars
                         where carID == n.Car_ID
                         select n).Single();

              tbCarID.Text = car.Car_ID.ToString(); ;
              tbVin.Text = car.VIN;
              tbModel.Text = car.Model;
              tbTrim.Text = car.Trim;
              tbMiles.Text = car.Miles.ToString();
            }
          }

          if (Session["Customer_ID"] != null)
          {
            int customerID = (int)Session["Customer_ID"];

            using (VWCTSDataContext db = new VWCTSDataContext())
            {
              var customer = (from n in db.Customers
                              where customerID == n.Customer_ID
                              select n).Single();

              tbExistingCustomer.Text = customer.Customer_ID.ToString();
              tbFirstName.Text = customer.First_Name;
              tbLastName.Text = customer.Last_Name;
              tbAddress.Text = customer.Street_Number;
              tbCity.Text = customer.City;
              tbState.Text = customer.State;
              tbZipCode.Text = customer.Zip_Code.ToString();
              tbAreaCode.Text = customer.Area_Code.ToString();
              tbPhoneNumber.Text = customer.Phone_Number.ToString();

              var carID = from n in db.Histories
                          where n.Customer_ID == customer.Customer_ID
                                && n.Type == "Initial Delivery"
                          select n.Car_ID;

              if (carID.Count() == 1)
              {
                foreach (var id in carID)
                {
                  var car = (from n in db.Cars
                             where id == n.Car_ID
                             select n).Single();

                  tbCarID.Text = car.Car_ID.ToString(); ;
                  tbVin.Text = car.VIN;
                  tbModel.Text = car.Model;
                  tbTrim.Text = car.Trim;
                  tbMiles.Text = car.Miles.ToString();
                }
              }
            }
          }
        }
      }

        protected void btnFind_Click(object sender, EventArgs e)
        {
          int id = 0;

          if (tbExistingCustomer.Text == "")
          {
            Session["PreviousPage"] = "Maintenance.aspx";
            Response.Redirect("Browse_Customers.aspx");
          }

          if (!int.TryParse(tbExistingCustomer.Text, out id))
            return;

          using (VWCTSDataContext db = new VWCTSDataContext())
          {
            var customer = from n in db.Customers
                           where n.Customer_ID == id
                           select n;

            foreach (var n in customer)
            {
              tbFirstName.Text = n.First_Name;
              tbLastName.Text = n.Last_Name;
              tbAddress.Text = n.Street_Number;
              tbCity.Text = n.City;
              tbState.Text = n.State;
              tbZipCode.Text = n.Zip_Code.ToString();
              tbPhoneNumber.Text = n.Phone_Number.ToString();
              Session["Customer_ID"] = n.Customer_ID;
            }
          }
        }
        
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
          bool error = false;
          int carID = 0;
          int customerID = 0; 
          int areaCode = 0;
          int phoneNumber = 0;
          int zipCode = 0;
          int miles = 11111;
          string serviceType = " ";

          if (tbFirstName.Text == "")
          {
            error = true;
            lblFirstName.ForeColor = System.Drawing.Color.Red;
          }

          if (tbLastName.Text == "")
          {
            error = true;
            lblLastName.ForeColor = System.Drawing.Color.Red;
          }

          if (tbAddress.Text == "")
          {
            error = true;
            lblAddress.ForeColor = System.Drawing.Color.Red;
          }

          if (tbCity.Text == "")
          {
            error = true;
            lblCity.ForeColor = System.Drawing.Color.Red;
          }

          if (tbState.Text == "")
          {
            error = true;
            lblState.ForeColor = System.Drawing.Color.Red;
          }

          if (tbZipCode.Text == "")
          {
            error = true;
            lblZipCode.ForeColor = System.Drawing.Color.Red;
          }
          else
          {
            if (!int.TryParse(tbZipCode.Text, out zipCode))
            {
              error = true;
              lblZipCode.ForeColor = System.Drawing.Color.Red;
            }
          }

          if (tbPhoneNumber.Text == "" || tbAreaCode.Text == "" || tbPhoneNumber.Text.Length < 7 || tbAreaCode.Text.Length < 3)
          {
            error = true;
            lblPhoneNumber.ForeColor = System.Drawing.Color.Red;
          }
          else
          {
            if (!int.TryParse(tbPhoneNumber.Text, out phoneNumber))
            {
              error = true;
              lblPhoneNumber.ForeColor = System.Drawing.Color.Red;
            }

            if (!int.TryParse(tbAreaCode.Text, out areaCode))
            {
              error = true;
              lblPhoneNumber.ForeColor = System.Drawing.Color.Red;
            }
          }

          if (tbCarID.Text == "")
          {
            error = true;
            lblCarID.ForeColor = System.Drawing.Color.Red;
          }
          else
          {
            if (!int.TryParse(tbCarID.Text, out carID))
            {
              error = true;
              lblCarID.ForeColor = System.Drawing.Color.Red;
            }
          }

          if(tbVin.Text == ""){
            error = true;
            lblVin.ForeColor = System.Drawing.Color.Red;
          }

          if(tbModel.Text == ""){
            error = true;
            lblModel.ForeColor = System.Drawing.Color.Red;
          }

          if(tbTrim.Text == ""){
            error = true;
            lblTrim.ForeColor = System.Drawing.Color.Red;
          }

          if(tbMiles.Text == ""){
            error = true;
            lblMiles.ForeColor = System.Drawing.Color.Red;
          }
          else{
            if(!int.TryParse(tbMiles.Text, out miles)){
              error = true;
              lblMiles.ForeColor = System.Drawing.Color.Red;
            }
          }

          if (cbOilChange.Checked)
            serviceType = "Oil Change";
          else if (cbBrakeInspection.Checked)
            serviceType = "Brake Inspection";
          else if (cbCoolingSystem.Checked)
            serviceType = "Cooling System";
          else if (cbSuspension.Checked)
            serviceType = "Suspension";
          else if (cbTransmission.Checked)
            serviceType = "Transmission";
          else if (cbTireRotation.Checked)
            serviceType = "Tire Rotation";
          else if (cbAirConditioner.Checked)
            serviceType = "Air Conditioner";
          else if (cbScheduledMaintenance.Checked)
            serviceType = "Scheduled Maintenance";
          else if (cbOther.Checked)
            serviceType = "Other";
          else
            error = true;

          if (serviceType == "Other")
          {
            if (tbAdditionalInfo.Text == "")
            {
              error = true;
              lblAdditionalInfo.ForeColor = System.Drawing.Color.Red;
            }
          }

          if (error)
            return;
          
          using (VWCTSDataContext db = new VWCTSDataContext())
          {
            if (Session["Customer_ID"] == null)
            {
              Customer newCustomer = new Customer();
              newCustomer.Area_Code = areaCode;
              newCustomer.City = tbCity.Text;
              newCustomer.First_Name = tbFirstName.Text;
              newCustomer.Last_Name = tbLastName.Text;
              newCustomer.Phone_Number = phoneNumber;
              newCustomer.State = tbState.Text;
              newCustomer.Street_Number = tbAddress.Text;
              newCustomer.Zip_Code = zipCode;
              db.Customers.InsertOnSubmit(newCustomer);
            }
            else{
              customerID = (int)Session["Customer_ID"];

              db.Update_Customer(customerID, tbFirstName.Text, tbLastName.Text, areaCode,
                                  phoneNumber, tbAddress.Text, tbCity.Text, tbState.Text, zipCode);
            }

            string time = ddlHour.SelectedValue + ":" + ddlMinute.SelectedValue 
                          + ddl12Hour.SelectedValue;
            History newHistory = new History();
            newHistory.Car_ID = carID;
            newHistory.Customer_ID = customerID;
            newHistory.Date = DateTime.Today;
            newHistory.Type = serviceType;
            newHistory.Description = time + " - " + tbAdditionalInfo.Text;
            db.Histories.InsertOnSubmit(newHistory);
            

            db.Update_Miles(carID, miles);
            db.SubmitChanges();
            
          }

          Session["Car_ID"] = null;
          Session["PreviousPage"] = null;
          Session["Customer_ID"] = null;

          Session["Last"] = null;
          Session["First"] = null;
          Session["Address"] = null;
          Session["City"] = null;
          Session["State"] = null;
          Session["City"] = null;
          Session["Area"] = null;
          Session["Phone"] = null;

          btnFind.Enabled = false;
          btnFindCar.Enabled = false;
          btnSubmit.Enabled = false;
          btnCancel.Enabled = false;

          Label1.Text = "Service Processed";
          Label1.ForeColor = System.Drawing.Color.Red;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
          Session["Car_ID"] = null;
          Session["PreviousPage"] = null;
          Session["Customer_ID"] = null;

          Session["Last"] = null;
          Session["First"] = null;
          Session["Address"] = null;
          Session["City"] = null;
          Session["State"] = null;
          Session["City"] = null;
          Session["Area"] = null;
          Session["Phone"] = null;

          Response.Redirect("Maintenance.aspx");
        }

        protected void btnFindCar_Click(object sender, EventArgs e)
        {
          if (tbLastName.Text != "")
            Session["Last"] = tbLastName.Text;

          if (tbFirstName.Text != "")
            Session["First"] = tbFirstName.Text;

          if (tbAddress.Text != "")
            Session["Address"] = tbAddress.Text;

          if (tbCity.Text != "")
            Session["City"] = tbCity.Text;

          if (tbState.Text != "")
            Session["State"] = tbState.Text;

          if (tbCity.Text != "")
            Session["City"] = tbZipCode.Text;

          if (tbAreaCode.Text != "")
            Session["Area"] = tbAreaCode.Text;

          if (tbPhoneNumber.Text != null)
            Session["Phone"] = tbPhoneNumber.Text;

          Session["PreviousPage"] = "Maintenance.aspx";
          Response.Redirect("Browse_History.aspx");
        }
    }
}
