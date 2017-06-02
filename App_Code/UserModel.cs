using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for User
/// </summary>
public class UserModel
{
    public UserModel()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static string HashPassword(string password)
    {
        UnicodeEncoding uEncode = new UnicodeEncoding();
        byte[] bytPassword = uEncode.GetBytes(password);
        SHA512Managed sha = new SHA512Managed();
        byte[] hash = sha.ComputeHash(bytPassword);
        return Convert.ToBase64String(hash);
    }

    public static bool doesUserOwnAdvert(int userId, int carId)
    {
        if (userId != null && carId != null)
        {
            String sql = "SELECT count(*) as count FROM adverts, users WHERE adverts.user_id = users.Id AND users.Id = " + userId + " AND adverts.Id = " + carId;
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
}