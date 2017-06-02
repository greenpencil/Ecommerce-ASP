using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewAdvert : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            dpdl_carMake.DataBind();
            dpdl_carYear.DataBind();
            dpdl_carModel.DataBind();
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        AdvertsTableAdapters.advertsTableAdapter advertsTable = new AdvertsTableAdapters.advertsTableAdapter();

        advertsTable.Insert(System.Convert.ToInt32(Session["UserId"]), hdnCarMake.Value, hdnCarModel.Value, dpdl_carColor.SelectedValue, dpdl_carType.SelectedValue,
            hdnCarYear.Value, tbxPrice.Text, 1, "", tbxLocation.Text);
        Response.Redirect("Default.aspx");
    }
}