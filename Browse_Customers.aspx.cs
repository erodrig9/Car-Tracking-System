using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarTrackingSystem
{
  public partial class Browese_Customers : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      var dataSource = (IQueryable)Session["DataSource"];
      string department = (string)Session["Department"];

      if (Session["Employee_ID"] == null)
        Response.Redirect("Login.aspx");

      if (!Page.IsPostBack)
      {
        VWCTSDataContext db = new VWCTSDataContext();
        var source = from n in db.Customers
                     select n;

        var gridSource = from n in source
                         orderby n.Last_Name ascending
                         select new
                         {
                           ID = n.Customer_ID,
                           Name = string.Concat(n.Last_Name, ", ", n.First_Name),
                           Phone = string.Concat(n.Area_Code, " ", n.Phone_Number),
                           Address = string.Concat(n.Street_Number, " ", n.City, " ",
                                                   n.State, " ", n.Zip_Code)
                         };

        GridView1.DataSource = gridSource;
        Session["DataSource"] = source;
        GridView1.DataBind();
      }

      lblFirstName.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
      lblLastName.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
      lblAddress.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
      lblCity.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
      lblState.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
      lblZipCode.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
      lblPhoneNumber.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
      lblID.ForeColor = System.Drawing.ColorTranslator.FromHtml("#606760");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
      VWCTSDataContext db = new VWCTSDataContext();
      var queryResults = from n in db.Customers
                         select n;

      if (tbID.Text != "")
      {
        int id = 0;
        if (!int.TryParse(tbID.Text, out id))
        {
          lblID.ForeColor = System.Drawing.Color.Red;
          return;
        }

        queryResults = from n in queryResults
                       where id == n.Customer_ID
                       select n;
      }

      if (tbFirstName.Text != "")
      {
        queryResults = from n in queryResults
                       where tbFirstName.Text == n.First_Name
                       select n;
      }

      if (tbLastName.Text != "")
      {
        queryResults = from n in queryResults
                       where tbLastName.Text == n.Last_Name
                       select n;
      }

      if (tbAddress.Text != "")
      {
        queryResults = from n in queryResults
                       where tbAddress.Text == n.Street_Number
                       select n;
      }

      if (tbCity.Text != "")
      {
        queryResults = from n in queryResults
                       where tbCity.Text == n.City
                       select n;
      }

      if (tbState.Text != "")
      {
        queryResults = from n in queryResults
                       where tbState.Text == n.State
                       select n;
      }

      if(tbZipCode.Text != "")
      {
        int zip = 0;
        if(!int.TryParse(tbZipCode.Text, out zip)){
          lblZipCode.ForeColor = System.Drawing.Color.Red;
          return;
        }

        queryResults = from n in queryResults
                       where zip == n.Zip_Code
                       select n;
      }

      if(tbAreaCode.Text != "" && tbPhoneNumber.Text != ""){
        int area = 0;
        int num = 0;

        if(!int.TryParse(tbAreaCode.Text, out area)){
          lblPhoneNumber.ForeColor = System.Drawing.Color.Red;
          return;
        }

        if(!int.TryParse(tbPhoneNumber.Text, out num)){
          lblPhoneNumber.ForeColor = System.Drawing.Color.Red;
          return;
        }

        queryResults = from n in queryResults
                       where area == n.Area_Code && num == n.Phone_Number
                       select n;
      }
      else if(tbAreaCode.Text != "" || tbPhoneNumber.Text != "")
      {
        lblPhoneNumber.ForeColor = System.Drawing.Color.Red;
        return;
      }

      var gridSource = from n in queryResults
                       orderby n.Last_Name ascending
                       select new
                       {
                         ID = n.Customer_ID,
                         Name = string.Concat(n.Last_Name, ", ", n.First_Name),
                         Phone = string.Concat(n.Area_Code, " ", n.Phone_Number),
                         Address = string.Concat(n.Street_Number, " ", n.City, " ",
                                                 n.State, " ", n.Zip_Code)
                       };

      GridView1.DataSource = gridSource;
      Session["DataSource"] = queryResults;
      GridView1.DataBind();
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
      int customerID = (int)GridView1.SelectedDataKey.Value;
      Session["Customer_ID"] = customerID;

      string previousPage = (string)Session["PreviousPage"];
      if (previousPage != null)
        Response.Redirect(previousPage);
      else
        Response.Redirect("Browse_History.aspx");
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
      IQueryable<Customer> source = (IQueryable<Customer>)Session["DataSource"];
      var gridSource = from n in source
                       orderby n.Last_Name ascending
                       select new
                       {
                         ID = n.Customer_ID,
                         Name = string.Concat(n.Last_Name, ", ", n.First_Name),
                         Phone = string.Concat(n.Area_Code, " ", n.Phone_Number),
                         Address = string.Concat(n.Street_Number, " ", n.City, " ",
                                                 n.State, " ", n.Zip_Code)
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
