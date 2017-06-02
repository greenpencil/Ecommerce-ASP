using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdvertDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userId"] != null && Request.QueryString["carId"] != null)
        {
            String sql = "INSERT INTO history(user_id, car_id) VALUES (" + Session["userId"] + ", " + Request.QueryString["carId"] + ")";
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            con.Close();

            OffersTableAdapters.offersTableAdapter offerTable = new OffersTableAdapters.offersTableAdapter();
            Offers.offersDataTable offersData = offerTable.GetData();

            foreach(DataRow row in offersData)
            {
                if(Convert.ToInt32(row["user_id"]) == Convert.ToInt32(Session["userId"]) 
                   && Convert.ToInt32(row["car_id"]) == Convert.ToInt32(Request.QueryString["carId"]))
                {
                    lblOffer.Text = "You have already made an offer on this car, but you can make another";
                }
            }
        }
    }

    public bool canEdit()
    {
        if (Convert.ToInt32(Session["UserId"]) == Convert.ToInt32(((HiddenField)this.lstVInfo.Items.ElementAt(0).FindControl("hdnUserId")).Value))
        {
            return true;
        }
        return false;
    }
    protected void btnAddWishlist_Click(object sender, EventArgs e)
    {
        if (Session["userId"] != null && Request.QueryString["carId"] != null)
        {
            String sql = "INSERT INTO wishlist(user_id, car_id, notes) VALUES (" + Session["userId"] + ", " + Request.QueryString["carId"] + ",'" + tbxNotes.Text + "')";
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }

    public bool checkIfWishlist()
    {
        WishlistsTableAdapters.wishlistTableAdapter wishlistTable = new WishlistsTableAdapters.wishlistTableAdapter();
        Wishlists.wishlistDataTable wishListData = wishlistTable.GetData();

        foreach(DataRow row in wishListData)
        {
            if (System.Convert.ToString(row["user_id"]).Equals(Session["userId"]) && System.Convert.ToString(row["car_id"]).Equals(Request.QueryString["carId"]))
            {
                return false;
            }
        }
        return true;
    }
    protected void btnRemoveFromWishlist_Click(object sender, EventArgs e)
    {
        if (Session["userId"] != null && Request.QueryString["carId"] != null)
        {
            String sql = "DELETE FROM wishlist WHERE user_id=" + Session["userId"] + " AND car_id=" + Request.QueryString["carId"] + "";
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
    protected void btnMakeOffer_Click(object sender, EventArgs e)
    {
        OffersTableAdapters.offersTableAdapter offersTable = new OffersTableAdapters.offersTableAdapter();
        offersTable.Insert(Convert.ToInt32(Session["userId"]), Convert.ToInt32(Request.QueryString["carId"]), 1, Convert.ToInt32(tbxOffer.Text));
        Response.Redirect("AdvertDetails.aspx?carId=" + Request.QueryString["carId"]);
    }

}