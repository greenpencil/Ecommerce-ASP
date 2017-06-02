using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class UserProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataView dv = (DataView)sqlUser.Select(DataSourceSelectArguments.Empty);
        try
        {
            DataRowView drv = dv[0];

            lblName.Text = drv["first_name"].ToString() + " " + drv["surname"].ToString();
            lblLocation.Text = drv["location"].ToString();
            lblEmail.Text = drv["email"].ToString();
        } catch(IndexOutOfRangeException exception) {
            lblName.Text = "User not found";
        }
    }
    protected void lstvUser_ItemUpdating(object sender, ListViewUpdateEventArgs e)
    {

       // lblLocation.Text = ((TextBox)lstvUser.FindControl("passwordTextBox")).Text;
       // (PlaceHolder)e.Item.FindControl("passwordTextBox").Text = "111";

        

    }


    protected void lstvUser_ItemUpdated(object sender, ListViewUpdatedEventArgs e)
    {

        // These 4 lines
        String pass = UserModel.HashPassword(((TextBox)((System.Web.UI.WebControls.ListView)sender).Items.ElementAt(0).FindControl("passwordTextBox")).Text);
        String sql = "UPDATE users SET password='" + pass + "' WHERE id =" + Session["userId"];


        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.ExecuteNonQuery();
        con.Close();
    }   
}