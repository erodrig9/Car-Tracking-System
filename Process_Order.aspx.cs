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
    public partial class Process_Order : System.Web.UI.Page
    {
      protected void Page_Load(object sender, EventArgs e)
      {
        if (Session["Employee_ID"] == null)
          Response.Redirect("Login.aspx");

        if (!IsPostBack)
        {
          if (Session["Car_ID"] != null)
          {
            int carID = (int)Session["Car_ID"];
            tbCarID.Text = carID.ToString();
          }

          if (Session["Sales_Price"] != null)
          {
            decimal price = (decimal)Session["Sales_Price"];
            tbSalesPrice.Text = price.ToString();
          }

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

          if (Session["PreviousPage"] == "Process_Order.aspx" && Session["Customer_ID"] != null)
          {
            int customerID = (int)Session["Customer_ID"];

            using (VWCTSDataContext db = new VWCTSDataContext())
            {
              var customer = (from n in db.Customers
                              where n.Customer_ID == customerID
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
            }
          }

          lblFirstName.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
          lblLastName.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
          lblAddress.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
          lblCity.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
          lblState.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
          lblZipCode.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
          lblPhoneNumber.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");

          lblCarID.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
          lblAmountFinanced.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
          lblDownPayment.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
          lblTradeValue.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
          lblSalesPrice.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");

          lblExistingCustomer.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
        }
      }

        protected void btnFind_Click(object sender, EventArgs e)
        {
          int id = 0;

          if (tbExistingCustomer.Text == "")
          {
            Session["PreviousPage"] = "Process_Order.aspx";
            Response.Redirect("Browse_Customers.aspx");
          }

          if (!int.TryParse(tbExistingCustomer.Text, out id))
          {
            lblExistingCustomer.ForeColor = System.Drawing.Color.Red;
            return;
          }

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
              tbAreaCode.Text = n.Area_Code.ToString();
              tbPhoneNumber.Text = n.Phone_Number.ToString();
              Session["Customer_ID"] = n.Customer_ID;
            }
          }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
          bool error = false;
          int carID = 0, customerID = 0, areaCode = 0, phoneNumber = 0, zipCode = 0;
          decimal downPayment = 0, amountFinanced = 0, tradeValue = 0, salesPrice = 0;

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
          else{
            if(!int.TryParse(tbZipCode.Text, out zipCode)){
              error = true;
              lblZipCode.ForeColor = System.Drawing.Color.Red;
            }
          }

          if (tbPhoneNumber.Text == "" || tbAreaCode.Text == "" || tbPhoneNumber.Text.Length < 7 || tbAreaCode.Text.Length < 3)
          {
            error = true;
            lblPhoneNumber.ForeColor = System.Drawing.Color.Red;
          }
          else{
            if (!int.TryParse(tbPhoneNumber.Text, out phoneNumber))
            {
              error = true;
              lblPhoneNumber.ForeColor = System.Drawing.Color.Red;
            }

            if(!int.TryParse(tbAreaCode.Text, out areaCode)){
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
            if(!int.TryParse(tbCarID.Text, out carID)){
              error = true;
              lblCarID.ForeColor = System.Drawing.Color.Red;
            }
          }

          if (tbAmountFinanced.Text == "")
            amountFinanced = 0;
          else
          {
            if(!decimal.TryParse(tbAmountFinanced.Text, out amountFinanced)){
              error = true;
              lblAmountFinanced.ForeColor = System.Drawing.Color.Red;
            }
          }

          if (tbDownPayment.Text == "")
            downPayment = 0;
          else{
            if(!decimal.TryParse(tbDownPayment.Text, out downPayment)){
              error = true;
              lblDownPayment.ForeColor = System.Drawing.Color.Red;
            }
          }

          if (tbTradeValue.Text == "")
            tradeValue = 0;
          else{
            if(!decimal.TryParse(tbTradeValue.Text, out tradeValue)){
              error = true;
              lblTradeValue.ForeColor = System.Drawing.Color.Red;
            }
          }

          if(tbSalesPrice.Text == ""){
            error = true;
            lblSalesPrice.ForeColor = System.Drawing.Color.Red;
          }
          else{
            if(!decimal.TryParse(tbSalesPrice.Text, out salesPrice)){
              error = true;
              lblSalesPrice.ForeColor = System.Drawing.Color.Red;
            }
          }

          if (salesPrice != (tradeValue + downPayment + amountFinanced))
          {
            error = true;
            lblTradeValue.ForeColor = System.Drawing.Color.Red;
            lblDownPayment.ForeColor = System.Drawing.Color.Red;
            lblAmountFinanced.ForeColor = System.Drawing.Color.Red;
          }

          if (error)
            return;

          //LINQ TO SQL CODE TO SUBMIT TRANSACTION AND CUSTOMER IF NEW
          using (VWCTSDataContext db = new VWCTSDataContext())
          {
            if (Session["Customer_ID"] == null)
            {
              Customer newCustomer = new Customer();
              newCustomer.First_Name = tbFirstName.Text;
              newCustomer.Last_Name = tbLastName.Text;
              newCustomer.Street_Number = tbAddress.Text;
              newCustomer.City = tbCity.Text;
              newCustomer.State = tbState.Text;
              newCustomer.Zip_Code = zipCode;
              newCustomer.Area_Code = areaCode;
              newCustomer.Phone_Number = phoneNumber;

              db.Customers.InsertOnSubmit(newCustomer);
              db.SubmitChanges();

              customerID = (from n in db.Customers
                            select n.Customer_ID).Max();
            }
            else
            {
              customerID = (int)Session["Customer_ID"];
              db.Update_Customer(customerID, tbFirstName.Text, tbLastName.Text, areaCode,
                                  phoneNumber, tbAddress.Text, tbCity.Text, tbState.Text, zipCode);
            }

            int employeeID = 0;
            if (Session["Employee_ID"] == null)
              employeeID = 1;
            else
              employeeID = (int)Session["Employee_ID"];

            Transaction newTransaction = new Transaction();
            newTransaction.Car_ID = carID;
            newTransaction.Customer_ID = customerID;
            newTransaction.Amount_Financed = amountFinanced;
            newTransaction.Date = System.DateTime.Today;
            newTransaction.Down_Payment = downPayment;
            newTransaction.Employee_ID = employeeID;
            newTransaction.Sales_Price = salesPrice;
            newTransaction.Trade_Value = tradeValue;
            db.Transactions.InsertOnSubmit(newTransaction);

            History newHistory = new History();
            newHistory.Car_ID = carID;
            newHistory.Customer_ID = customerID;
            newHistory.Type = "Initial Delivery";
            newHistory.Date = DateTime.Today;
            db.Histories.InsertOnSubmit(newHistory);

            var update = (from n in db.Cars
                         where n.Car_ID == carID
                         select n).Single();
            update.Price = decimal.Parse(tbSalesPrice.Text);
            update.Status = "Sold";
            db.SubmitChanges();
          }

          Session["Car_ID"] = null;
          Session["Sales_Price"] = null;
          Session["Customer_ID"] = null;
          Session["PreviousPage"] = null;

          Session["Last"] = null;
          Session["First"] = null;
          Session["Address"] = null;
          Session["City"] = null;
          Session["State"] = null;
          Session["City"] = null;
          Session["Area"] = null;
          Session["Phone"] = null;

          btnSubmit.Enabled = false;
          btnCancel.Enabled = false;
          btnFind.Enabled = false;
          btnFindCar.Enabled = false;
          Label2.Text = "Order Processed";
          Label2.ForeColor = System.Drawing.Color.Red;
          
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
          Session["PreviousPage"] = null;
          Session["Car_ID"] = null;
          Session["Sales_Price"] = null;
          Session["Customer_ID"] = null;

          Session["Last"] = null;
          Session["First"] = null;
          Session["Address"] = null;
          Session["City"] = null;
          Session["State"] = null;
          Session["City"] = null;
          Session["Area"] = null;
          Session["Phone"] = null;

          Response.Redirect("Browse_Cars.aspx");
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
          
          Session["PreviousPage"] = "Process_Order.aspx";
          Response.Redirect("Browse_Cars.aspx");
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
          Response.Redirect("Process_Order.aspx");
        }
    }
}
