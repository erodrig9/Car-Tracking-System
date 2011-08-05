using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;

namespace CarTrackingSystem
{
  public partial class Login : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      Session["Employee_ID"] = null;
      Session["Department"] = null;
      Session["Car_ID"] = null;      
      Session["List_Price"] = null;
      Session["Customer_ID"] = null;
      Session["PreviousPage"] = null;
    }

    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
      string password = Hash(Login1.Password);

      using (VWCTSDataContext db = new VWCTSDataContext())
      { 
        var department = from n in db.Employees
                         where (n.User_Name == Login1.UserName && n.Password == password)
                         select n;

        foreach (var n in department)
        {
          Session["Employee_ID"] = n.Employee_ID;
          Session["Department"] = n.Department;
          Response.Redirect("Browse_Cars.aspx");
        }
      }    
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
