using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OfferAction : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["action"] == null)
        { } else
        if (Request.QueryString["action"].Equals("accept"))
        {
            String sql = "UPDATE offers SET status=3 WHERE id =" + Request.QueryString["Id"];


            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            con.Close();
            
            Response.Redirect("Offers.aspx");
        }
        else if (Request.QueryString["action"].Equals("decline"))
        {

            String sql = "UPDATE offers SET status=2 WHERE id =" + Request.QueryString["Id"];


            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("Offers.aspx");
        }
    }
    protected void btnPaypal_Click(object sender, EventArgs e)
    {
        // This hsould redirect to Paypal but I am not implementing that
        // So it will assume it has gone to paypal and come back

        String sql = "UPDATE offers SET status=4 WHERE id =" + Request.QueryString["Id"];


        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.ExecuteNonQuery();
        con.Close();

        Response.Redirect("Offers.aspx");
    }
}