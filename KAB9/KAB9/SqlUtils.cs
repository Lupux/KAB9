using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Data;

namespace KAB9
{
    public static class SqlUtils
    {
        static string conStr = "";

        static SqlConnection dBConnection = new SqlConnection(conStr);

        public static List<Product> LoadProducts()
        {
            List<Product> tmpList = new List<Product>();
            SqlCommand dBCommand = new SqlCommand("select " +
                                                  "* from Product and " +
                                                  "Stock " +
                                                  "order by ProductId", dBConnection);
            try
            {
                dBConnection.Open();
                SqlDataReader dBReader = dBCommand.ExecuteReader();
                while (dBReader.Read())
                {
                    int productid = Convert.ToInt32(dBReader["ProductID"]);
                    string productName = dBReader["ProductName"].ToString();
                    string description = dBReader["Description"].ToString();
                    double price = Convert.ToDouble(dBReader["Price"]);
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
                dBConnection.Close();
            }
            return tmpList;
        }

        public static void AddProduct(string productName, string description, int price, int addToStock)
        {
            try
            {
                SqlCommand dBCommand = new SqlCommand();
                dBCommand.CommandType = CommandType.StoredProcedure;
                dBCommand.CommandText = "spCreateContact";
                dBCommand.Connection = dBConnection;
                dBConnection.Open();

                SqlParameter paramProductName = new SqlParameter("@productName", SqlDbType.VarChar);
                paramProductName.Value = productName;
                dBCommand.Parameters.Add(paramProductName);

                SqlParameter paramDescription = new SqlParameter("@description", SqlDbType.VarChar);
                paramDescription.Value = description;
                dBCommand.Parameters.Add(paramDescription);

                SqlParameter paramPrice = new SqlParameter("@price", SqlDbType.Int);
                paramPrice.Value = price;
                dBCommand.Parameters.Add(paramPrice);

                SqlParameter paramAddToStock = new SqlParameter("@addToStock", SqlDbType.Int);
                paramAddToStock.Value = addToStock;
                dBCommand.Parameters.Add(paramAddToStock);

                SqlParameter paramProductID = new SqlParameter("@productID", SqlDbType.Int);
                paramProductID.Direction = ParameterDirection.Output;
                dBCommand.Parameters.Add(paramProductID);

                int result = dBCommand.ExecuteNonQuery();

                if (result == 0)
                {
                    /*alert*/
                    /*firstName = ("ERROR when adding contact to Database!");*/
                }
            }
            catch (Exception)
            {
                /*lastName = "FEL vid laddning av kontakter från SQL!";*/
            }
            finally
            {
                dBConnection.Close();
            }
        }
    }
}