using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void grvAdverts_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void objAdverts_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {

    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        grvAdverts.DataBind();
    }
}