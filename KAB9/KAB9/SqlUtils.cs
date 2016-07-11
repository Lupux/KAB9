using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;

namespace KAB9
{
    public class SqlUtils
    {
        static string conStr = "";

        static SqlConnection dBConnection = new SqlConnection(conStr);
    }
    public static List<Product> LoadProducts()
    {
        List<Product> tmpList = new List<Contact>();
        SqlCommand dBCommand = new SqlCommand("select " +
                                              "* from Product and " +
                                              "Stock " +
                                              "order by ID", dBConnection);
        try
        {
            dBConnection.Open();
            SqlDataReader dBReader = dBCommand.ExecuteReader();
            while (Reader.Read())
            {
                int productid = Convert.ToInt32(dBReader["ProductID"]);
                string productName = dBReader["ProductName"].ToString();
                string description = dBReader["Description"].ToString();
                double price= Convert.ToDouble(dBReader["Price"]);
                int stock = Convert.ToInt32(dBReader["NumberofItems"]);

                tmpList.Add(new Product(Productid, productName, description, price, stock));
            }
        }
        catch (Exception)
        {
            //Response.Write($"<script>alert('{ex.Message}');</script>");
        }
        finally
        {
            myConnection.Close();
        }
        return tmpList;
    }
}