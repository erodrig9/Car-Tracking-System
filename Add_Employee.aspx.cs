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
using System.Security.Cryptography;
using System.Text;

namespace CarTrackingSystem
{
    public partial class Add_Employee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          string department = (string)Session["Department"];

          if (Session["Employee_ID"] == null)
            Response.Redirect("Login.aspx");

          if (department != "Admin")
          {
            if (Request.UrlReferrer == null)
              Response.Redirect("Browse_Cars.aspx");
            else
              Response.Redirect(Request.UrlReferrer.ToString());
          }

          lblFirstName.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
          lblLastName.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
          lblAddress.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
          lblCity.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
          lblState.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
          lblZipCode.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
          lblPhoneNumber.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
          lblDepartment.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
          lblPassword.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
          lblPassword2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
            
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            bool error = false;
            int  employeeID = 0, areaCode = 0, phoneNumber = 0, zipCode = 0;

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

            if (tbPassword.Text == "")
            {
                error = true;
                lblPassword.ForeColor = System.Drawing.Color.Red;
            }

            if (tbPassword2.Text == "")
            {
                error = true;
                lblPassword2.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                if (tbPassword.Text != tbPassword2.Text)
                {
                    error = true;
                    lblPassword.ForeColor = System.Drawing.Color.Red;
                    lblPassword2.ForeColor = System.Drawing.Color.Red;
                }
            }

            if (ddlDepartment.SelectedValue == "")
            {
              error = true;
              lblDepartment.ForeColor = System.Drawing.Color.Red;
            }

            if (tbUserName.Text == "")
            {
              error = true;
              lblUserName.ForeColor = System.Drawing.Color.Red;
            }

            if (error)
                return;


            using (VWCTSDataContext db = new VWCTSDataContext())
            {
              Employee newEmployee = new Employee();
              newEmployee.Area_Code = areaCode;
              newEmployee.City = tbCity.Text;
              newEmployee.First_Name = tbFirstName.Text;
              newEmployee.Last_Name = tbLastName.Text;
              newEmployee.Phone_Number = phoneNumber;
              newEmployee.State = tbState.Text;
              newEmployee.Street_Number = tbAddress.Text;
              newEmployee.Zip_Code = zipCode;
              newEmployee.Password = tbPassword.Text;
              newEmployee.User_Name = tbUserName.Text;
              newEmployee.Department = ddlDepartment.SelectedValue;
              db.Employees.InsertOnSubmit(newEmployee);

              db.SubmitChanges();
              lblMessage.Text = "Employee Added";
              
              btnSubmit.Enabled = false;
              btnCancel.Enabled = false;
              btnNewEmployee.Visible = true;
            }

        
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Add_Employee.aspx");
        }

        // barrowed from http://www.dijksterhuis.org/creating-salted-hash-values-in-c/
        protected string Hash(string password)
        {
            HashAlgorithm hash = new SHA256Managed();
            byte[] passwordHash = hash.ComputeHash(Encoding.UTF8.GetBytes(password));
            return Convert.ToBase64String(passwordHash);
        }
    }
}
