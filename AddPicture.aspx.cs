using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddPicture : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public bool canAddPicture()
    {
        if (Session["userId"] != null && Request.QueryString["carId"] != null)
        {
            String sql = "SELECT count(*) as count FROM adverts, users WHERE adverts.user_id = users.Id AND users.Id = " + Session["userId"] + " AND adverts.Id = " + Request.QueryString["carId"];
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            int returned = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();

            if (returned != 0)
            {
                // 1 row returned, this user does own this advert
                return true;
            }
        }
        return false;
    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if(fulpImage.HasFile)
        {
            String sPath = MapPath("img/" + fulpImage.FileName);
            fulpImage.PostedFile.SaveAs(sPath);
            lblStatus.Text = "Image uploaded successful";
            String sql = "INSERT INTO pictures (image, title, car_id) values ('" + fulpImage.FileName + "','" + tbxTitle.Text + "','" + Request.QueryString["carId"] + "')";
            sqlPictures.SelectCommand = sql;
            lstvPictures.DataBind();
            Response.Redirect("AddPicture.aspx?carId=" + Request.QueryString["carId"]);
        }
    }
}