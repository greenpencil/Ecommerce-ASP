using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        UsersTableAdapters.usersTableAdapter usersTable = new UsersTableAdapters.usersTableAdapter();
        bool exists = false;
        // Check if email exists already
        // list all the data
        Users.usersDataTable usersData = usersTable.GetData();
        foreach (DataRow row in usersData.Rows)
        {
            String email = System.Convert.ToString(row["email"]).Trim();
            if (tbxEmail.Text.Equals(email))
            {
                exists = true;
            }
        }
        if (exists == false)
        {
            int id = usersTable.Insert(tbxEmail.Text, UserModel.HashPassword(tbxPassword.Text), tbxLocation.Text, tbxSurname.Text, tbxMobileNum.Text, tbxFirstName.Text);
            Session["Email"] = tbxEmail.Text;
            Session["UserId"] = id;
            Response.Redirect("Default.aspx");
        }
        else
        {
            //error
        }
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {

    }
}