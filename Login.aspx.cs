using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public bool authWithDatabase(String username, String password)
    {
        UsersTableAdapters.usersTableAdapter usersTable = new UsersTableAdapters.usersTableAdapter();
        Users.usersDataTable usersData = usersTable.GetData();
        foreach (DataRow row in usersData.Rows)
        {
            String uname = System.Convert.ToString(row["email"]);
            String pass = System.Convert.ToString(row["password"]);
            if (username.Equals(uname) && password.Equals(pass))
            {
                Session["UserId"] = System.Convert.ToString(row["Id"]);
                return true;
            }
        }
        return false;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (authWithDatabase(tbxEmail.Text, UserModel.HashPassword(tbxPassword.Text)))
        {
            Session["Email"] = tbxEmail.Text;
            Response.Redirect("Default.aspx");
        }
        else
        {
            lblErrors.Enabled = true;
            lblErrors.Visible = true;
            lblErrors.Text = "Error: Incorrect Username or Password";
        }
    }
}