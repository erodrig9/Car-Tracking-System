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
using System.Drawing;
using System.IO;

namespace CarTrackingSystem
{
    public partial class Add_Car : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          string department = (string)Session["Department"];

          if (Session["Employee_ID"] == null)
            Response.Redirect("Login.aspx");

          if (department != "Admin"){
            if (Request.UrlReferrer == null)
              Response.Redirect("Browse_Cars.aspx");
            else
              Response.Redirect(Request.UrlReferrer.ToString());
          }


          lblVin.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
          lblModel.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
          lblTrim.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
          lblColor.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
          lblTransmission.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
          lblInvoice.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
          lblListPrice.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
          lblLocation.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");

          if (imageUpload.ImageUrl == " ")
            imageUpload.Visible = false;
          else
            imageUpload.Visible = true;

        }

        protected void btnAdd_Car_Click(object sender, EventArgs e)
        {
          bool error = false;
          bool image = false;
          decimal invoice;
          decimal listPrice;
          string path = " ";
          Car_Option newOption;

          if (tbVin.Text.Length != 17)
          {
            error = true;
            lblVin.ForeColor = System.Drawing.Color.Red;
          }

          if (ddlModel.SelectedValue == "")
          {
            error = true;
            lblModel.ForeColor = System.Drawing.Color.Red;
          }

          if (ddlTrim.SelectedValue == "")
          {
            error = true;
            lblTrim.ForeColor = System.Drawing.Color.Red;
          }

          if(ddlColor.SelectedValue == "")
          {
            error = true;
            lblColor.ForeColor = System.Drawing.Color.Red;
          }

          if(ddlTransmission.SelectedValue == "")
          {
            error = true;
            lblTransmission.ForeColor = System.Drawing.Color.Red;
          }

          if (tbLocation.Text == "")
          {
            error = true;
            lblLocation.ForeColor = System.Drawing.Color.Red;
          }

          if (!decimal.TryParse(tbInvoice.Text, out invoice))
          {
            error = true;
            lblInvoice.ForeColor = System.Drawing.Color.Red;
          }

          if (!decimal.TryParse(tbListPrice.Text, out listPrice))
          {
            error = true;
            lblListPrice.ForeColor = System.Drawing.Color.Red;
          }

          if (error) return;

          if(uploadPhoto.PostedFile.ContentLength > 0 && uploadPhoto.FileName != ""){
            path = "~\\images\\" + uploadPhoto.FileName;
            imageUpload.ImageUrl = path;
            image = true;
          }
          

          using (VWCTSDataContext db = new VWCTSDataContext())
          {
            Car newCar = new Car();
            newCar.Model = ddlModel.SelectedValue;
            newCar.Trim = ddlTrim.SelectedValue;
            newCar.VIN = tbVin.Text;
            newCar.Color = ddlColor.SelectedValue;
            newCar.Transmission = ddlTransmission.SelectedValue;
            newCar.Invoice = decimal.Parse(tbInvoice.Text);
            newCar.Price = decimal.Parse(tbListPrice.Text);
            newCar.Location = tbLocation.Text;
            newCar.Status = "On Lot";
            newCar.Miles = 0;
            if(image)
              newCar.Picture = path;

            db.Cars.InsertOnSubmit(newCar);
            db.SubmitChanges();

            int id = (from n in db.Cars
                      select n.Car_ID).Max();

            foreach (ListItem n in cblPackages.Items)
            {  
              if(n is ListItem){
                newOption = new Car_Option();
                newOption.Car_ID = id;
                newOption.Package_ID = int.Parse(n.Value);
                db.Car_Options.InsertOnSubmit(newOption);
              } 
            }
            db.SubmitChanges();

            lblCarSubmitted.Text = "Car " + id + " Added Successfully";
            btnAddCar.Enabled = false;
            btnAddAnother.Visible = true;
          }
        }

        protected void ddlModel_SelectedIndexChanged(object sender, EventArgs e)
        {
          ddlTrim.Items.Clear();
          ListItem newItem = new ListItem();
          newItem.Value = "";
          ddlTrim.Items.Add(newItem);
          ddlTrim.DataBind();
        }

        protected void ddlTrim_SelectedIndexChanged(object sender, EventArgs e)
        {
          using (VWCTSDataContext db = new VWCTSDataContext())
          {
            var options = from n in db.Optional_Packages
                          where ddlTrim.SelectedValue == n.Trim && ddlModel.SelectedValue == n.Model 
                          select n;

            cblPackages.Items.Clear();
            foreach (var n in options)
            {
              ListItem item = new ListItem();
              item.Value = n.Package_ID.ToString();
              item.Text = n.Option_Name;
              cblPackages.Items.Add(item);
            }
          }
        }

        protected void btnAddAnother_Click(object sender, EventArgs e)
        {
          Response.Redirect("Add_Car.aspx");
        }
    }
}
