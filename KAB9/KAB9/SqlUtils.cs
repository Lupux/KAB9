using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Data;
using System.Collections.Generic;

namespace KAB9
{
    public static class SqlUtils
    {
        static string conStr = "";

        static SqlConnection dBConnection = new SqlConnection(conStr);

        #region ProductCRUD
        public static List<Product> LoadProducts()
        {
            List<Product> tmpList = new List<Product>();

            //SqlCommand dBCommand = new SqlCommand("select " +
            //                                      "* from Product and " +
            //                                      "Stock " +
            //                                      "order by ProductId", dBConnection);
            SqlCommand dBCommand = new SqlCommand("spAddProduct", dBConnection);
            dBCommand.CommandType = CommandType.StoredProcedure;
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

                    tmpList.Add(new Product(productid, productName, description, price, stock));
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

        public static void AddProduct(string productName, string description, double price, int addToStock)
        {
            try
            {
                SqlCommand dBCommand = new SqlCommand();
                dBCommand.CommandType = CommandType.StoredProcedure;
                dBCommand.CommandText = "spAddProduct";
                dBCommand.Connection = dBConnection;
                dBConnection.Open();

                SqlParameter paramProductName = new SqlParameter("@productName", SqlDbType.VarChar);
                paramProductName.Value = productName;
                dBCommand.Parameters.Add(paramProductName);

                SqlParameter paramDescription = new SqlParameter("@description", SqlDbType.VarChar);
                paramDescription.Value = description;
                dBCommand.Parameters.Add(paramDescription);

                SqlParameter paramPrice = new SqlParameter("@price", SqlDbType.Money);
                paramPrice.Value = price;
                dBCommand.Parameters.Add(paramPrice);

                SqlParameter paramAddToStock = new SqlParameter("@addToStock", SqlDbType.Int);
                paramAddToStock.Value = addToStock;
                dBCommand.Parameters.Add(paramAddToStock);

                SqlParameter paramProductid = new SqlParameter("@productid", SqlDbType.Int);
                paramProductid.Direction = ParameterDirection.Output;
                dBCommand.Parameters.Add(paramProductid);

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

        public static void UpdateProduct(string productName, string description, double price, int addToStock, int productID)
        {
            if (productID != null)
            {
                try
                {
                    SqlCommand dBCommand = new SqlCommand("spUpdateProduct", dBConnection);
                    dBCommand.CommandType = CommandType.StoredProcedure;
                    dBConnection.Open();

                    SqlParameter paramProductID = new SqlParameter("@productID", SqlDbType.Int);
                    paramProductID.Value = productName;
                    dBCommand.Parameters.Add(paramProductID);

                    if (productName != "")
                    {
                        SqlParameter paramProductName = new SqlParameter("@productName", SqlDbType.VarChar);
                        paramProductName.Value = productName;
                        dBCommand.Parameters.Add(paramProductName);
                    }

                    if (description != "")
                    {
                        SqlParameter paramDescription = new SqlParameter("@description", SqlDbType.VarChar);
                        paramDescription.Value = description;
                        dBCommand.Parameters.Add(paramDescription);
                    }

                    if (price != null)
                    {

                        try
                        {
                            SqlParameter paramPrice = new SqlParameter("@price", SqlDbType.Money);
                            paramPrice.Value = price;
                            dBCommand.Parameters.Add(paramPrice);
                        }
                        catch (Exception)
                        {
                            /*alert*/
                            /*priceTextBox = ("Du angav ett ogiltigt pris. Försök igen");*/
                        }
                    }

                    if (addToStock != null)
                    {
                        try
                        {
                            SqlParameter paramAddToStock = new SqlParameter("@addToStock", SqlDbType.Int);
                            paramAddToStock.Value = addToStock;
                            dBCommand.Parameters.Add(paramAddToStock);

                        }
                        catch (Exception)
                        {
                            /*alert*/
                            /*addToStockTextBox = ("Du angav ett ogiltigt antal för lagerhållning. Försök igen");*/
                        }
                    }

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
            else
            { /*alert*/
              /*VISA EN ALERT!: "Dett har skett en miss vid valet av produkt att uppdatera"*/
            }
        }
        public static void DeleteProduct(int productid)
        {
            try
            {
                SqlCommand dBCommand = new SqlCommand();

                dBCommand.CommandText = $"delete Product where ProductID = '{productid}'";
                dBCommand.Connection = dBConnection;
                dBConnection.Open();
                int result = dBCommand.ExecuteNonQuery();
                if (result == 0)
                {
                    // MÖÖÖÖG
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
        }
        #endregion

        #region CustomerCRUD
        public static List<Customer> LoadCustomers()
        {
            List<Customer> tmpList = new List<Customer>();

            //SqlCommand dBCommand = new SqlCommand("select " +
            //                                      "* from Customer "+
            //                                      "order by CustomerId", dBConnection);


            SqlCommand dBCommand = new SqlCommand("spAddCustomer", dBConnection);
            dBCommand.CommandType = CommandType.StoredProcedure;
            try
            {
                dBConnection.Open();
                SqlDataReader dBReader = dBCommand.ExecuteReader();
                while (dBReader.Read())
                {
                    int customerID = Convert.ToInt32(dBReader["CustomerID"]);
                    string firstName = dBReader["FirstName"].ToString();
                    string lastName = dBReader["LastName"].ToString();
                    string email = dBReader["EmailAddress"].ToString();
                    string phoneNr = dBReader["PhoneNr"].ToString();
                    string userName = dBReader["UserName"].ToString();
                    string companyName = dBReader["CompanyName"].ToString();
                    string orgNr = dBReader["OrgNr"].ToString();

                    tmpList.Add(new Customer(customerID, firstName, lastName, email, phoneNr, userName, companyName, orgNr));
                }
            }
            catch (Exception)
            {
                //<script>alert('{Message}');</script>;
            }
            finally
            {
                dBConnection.Close();
            }
            return tmpList;
        }

        public static void AddCustomer(string userName, string password, string firstName, string lastName, string companyName, string orgNr, string emailAddress, string phoneNr)
        {
            try
            {
                SqlCommand dBCommand = new SqlCommand();
                dBCommand.CommandType = CommandType.StoredProcedure;
                dBCommand.CommandText = "spAddCustomer";
                dBCommand.Connection = dBConnection;
                dBConnection.Open();

                SqlParameter paramUserName = new SqlParameter("@UserName", SqlDbType.VarChar);
                paramUserName.Value = userName;
                dBCommand.Parameters.Add(paramUserName);

                SqlParameter paramPassword = new SqlParameter("@Password", SqlDbType.VarChar);
                paramPassword.Value = password;
                dBCommand.Parameters.Add(paramPassword);

                SqlParameter paramCompanyName = new SqlParameter("@CompanyName", SqlDbType.VarChar);
                paramCompanyName.Value = companyName;
                dBCommand.Parameters.Add(paramCompanyName);

                SqlParameter paramOrgNr = new SqlParameter("@OrgNr", SqlDbType.VarChar);
                paramOrgNr.Value = orgNr;
                dBCommand.Parameters.Add(paramOrgNr);

                SqlParameter paramFirstName = new SqlParameter("@FirstName", SqlDbType.VarChar);
                paramFirstName.Value = firstName;
                dBCommand.Parameters.Add(paramFirstName);

                SqlParameter paramLastName = new SqlParameter("@LastName", SqlDbType.VarChar);
                paramLastName.Value = lastName;
                dBCommand.Parameters.Add(paramLastName);

                SqlParameter paramEmailAddress = new SqlParameter("@EmailAddress", SqlDbType.VarChar);
                paramEmailAddress.Value = emailAddress;
                dBCommand.Parameters.Add(paramEmailAddress);

                SqlParameter paramPhoneNr = new SqlParameter("@phoneNr", SqlDbType.VarChar);
                paramPhoneNr.Value = phoneNr;
                dBCommand.Parameters.Add(paramPhoneNr);

                SqlParameter paramCustomerid = new SqlParameter("@customerid", SqlDbType.Int);
                paramCustomerid.Direction = ParameterDirection.Output;
                dBCommand.Parameters.Add(paramCustomerid);

                int result = dBCommand.ExecuteNonQuery();

                if (result == 0)
                {
                    /*alert*/
                    /*firstName = ("ERROR when adding Customer to Database!");*/
                }
            }
            catch (Exception)
            {
                /*lastName = "FEL vid tilläg av kund till Databas!";*/
            }
            finally
            {
                dBConnection.Close();
            }
        }

        public static void UpdateCustomer(int customerid, string userName, string password, string firstName, string lastName, string companyName, string orgNr, string emailAddress, string phoneNr)
        {
            if (customerid != null)
            {
                try
                {
                    SqlCommand dBCommand = new SqlCommand("spUpdateCustomer", dBConnection);
                    dBCommand.CommandType = CommandType.StoredProcedure;
                    dBConnection.Open();

                    SqlParameter paramCustomerid = new SqlParameter("@customerid", SqlDbType.Int);
                    paramCustomerid.Value = customerid;
                    dBCommand.Parameters.Add(paramCustomerid);

                    if (userName != "")
                    {
                        SqlParameter paramUserName = new SqlParameter("@UserName", SqlDbType.VarChar);
                        paramUserName.Value = userName;
                        dBCommand.Parameters.Add(paramUserName);
                    }

                    if (password != "")
                    {
                        SqlParameter paramPassword = new SqlParameter("@Password", SqlDbType.VarChar);
                        paramPassword.Value = password;
                        dBCommand.Parameters.Add(paramPassword);
                    }

                    if (companyName != "")
                    {
                        SqlParameter paramCompanyName = new SqlParameter("@CompanyName", SqlDbType.VarChar);
                        paramCompanyName.Value = companyName;
                        dBCommand.Parameters.Add(paramCompanyName);
                    }

                    if (orgNr != "")
                    {
                        SqlParameter paramOrgNr = new SqlParameter("@OrgNr", SqlDbType.VarChar);
                        paramOrgNr.Value = orgNr;
                        dBCommand.Parameters.Add(paramOrgNr);
                    }

                    if (firstName != "")
                    {
                        SqlParameter paramFirstName = new SqlParameter("@FirstName", SqlDbType.VarChar);
                        paramFirstName.Value = firstName;
                        dBCommand.Parameters.Add(paramFirstName);
                    }

                    if (lastName != "")
                    {
                        SqlParameter paramLastName = new SqlParameter("@LastName", SqlDbType.VarChar);
                        paramLastName.Value = lastName;
                        dBCommand.Parameters.Add(paramLastName);
                    }

                    if (emailAddress != "")
                    {
                        SqlParameter paramEmailAddress = new SqlParameter("@EmailAddress", SqlDbType.VarChar);
                        paramEmailAddress.Value = emailAddress;
                        dBCommand.Parameters.Add(paramEmailAddress);
                    }


                    if (phoneNr != "")
                    {
                        SqlParameter paramPhoneNr = new SqlParameter("@phoneNr", SqlDbType.VarChar);
                        paramPhoneNr.Value = phoneNr;
                        dBCommand.Parameters.Add(paramPhoneNr);
                    }

                    int result = dBCommand.ExecuteNonQuery();

                    if (result == 0)
                    {
                        /*alert*/
                        /*firstName = ("ERROR when adding Customer to Database!");*/
                    }
                }
                catch (Exception)
                {
                    /*lastName = "FEL vid uppdatering av kund till Databas!";*/
                }
                finally
                {
                    dBConnection.Close();
                }
            }
            else
            { /*alert*/
              /*VISA EN ALERT!: "Det har skett en miss vid valet av Kund att uppdatera"*/
            }
        }

        public static void DeleteCustomer(int customerid)
        {
            try
            {
                SqlCommand dBCommand = new SqlCommand();

                dBCommand.CommandText = $"delete Customer where CustomerID = '{customerid}'";
                dBCommand.Connection = dBConnection;
                dBConnection.Open();
                int result = dBCommand.ExecuteNonQuery();
                if (result == 0)
                {
                    // MÖÖÖÖG
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
        }
        #endregion

        #region OrdersCRUD
        public static List<Order> LoadOrders(string orderStatus)
        {
            List<Order> tmpList = new List<Order>();

            SqlCommand dBCommand = new SqlCommand("spAddOrder", dBConnection);
            dBCommand.CommandType = CommandType.StoredProcedure;
            try
            {   
                //
                // Anger vilken status ordrarna man vill titta på har. Så att man kan välja att inte titta på alla ordrar samtidigt.
                //
                SqlParameter paramOrderStatus = new SqlParameter("@OrderStatus", SqlDbType.VarChar);
                paramOrderStatus.Value = orderStatus;
                dBCommand.Parameters.Add(paramOrderStatus);

                dBConnection.Open();
                SqlDataReader dBReader = dBCommand.ExecuteReader();
                while (dBReader.Read())
                {
                    int orderid = Convert.ToInt32(dBReader["OrderID"]);
                    string status = dBReader["Status"].ToString();
                    DateTime plannedShipping = DateTime.Parse(dBReader["plannedShipping"].ToString());
                    int sumPrice = Convert.ToInt32(dBReader["SumPrice"]);


                    List<Product> productsToDeliver = new List<Product>();
                    //
                    // Här är jag lite osäker på hur det kommer se ut i tabellerna med ordrar.
                    //
                    //foreach (var item in ListOfProductsInOrder)
                    //     productsToDeliver.Add(item);


                    tmpList.Add(new Order(orderid, productsToDeliver, status, plannedShipping, sumPrice));
                }
            }
            catch (Exception)
            {
                //<script>alert('{"Message"}');</script>;
            }
            finally
            {
                dBConnection.Close();
            }
            return tmpList;
        }

        //public static void CreateOrder(string firstName, string lastName, string emailAddress, string phoneNr)
        //{
        //    try
        //    {
        //        SqlCommand dBCommand = new SqlCommand();
        //        dBCommand.CommandType = CommandType.StoredProcedure;
        //        dBCommand.CommandText = "spAddCustomer";
        //        dBCommand.Connection = dBConnection;
        //        dBConnection.Open();

        //        SqlParameter paramFirstName = new SqlParameter("@FirstName", SqlDbType.VarChar);
        //        paramFirstName.Value = firstName;
        //        dBCommand.Parameters.Add(paramFirstName);

        //        SqlParameter paramLastName = new SqlParameter("@LastName", SqlDbType.VarChar);
        //        paramLastName.Value = lastName;
        //        dBCommand.Parameters.Add(paramLastName);

        //        SqlParameter paramEmailAddress = new SqlParameter("@EmailAddress", SqlDbType.VarChar);
        //        paramEmailAddress.Value = emailAddress;
        //        dBCommand.Parameters.Add(paramEmailAddress);

        //        SqlParameter paramPhoneNr = new SqlParameter("@phoneNr", SqlDbType.VarChar);
        //        paramPhoneNr.Value = phoneNr;
        //        dBCommand.Parameters.Add(paramPhoneNr);

        //        SqlParameter paramCustomerid = new SqlParameter("@customerid", SqlDbType.Int);
        //        paramCustomerid.Direction = ParameterDirection.Output;
        //        dBCommand.Parameters.Add(paramCustomerid);

        //        int result = dBCommand.ExecuteNonQuery();

        //        if (result == 0)
        //        {
        //            /*alert*/
        //            /*firstName = ("ERROR when adding Customer to Database!");*/
        //        }
        //    }
        //    catch (Exception)
        //    {
        //        /*lastName = "FEL vid tilläg av kund till Databas!";*/
        //    }
        //    finally
        //    {
        //        dBConnection.Close();
        //    }
        //}

        public static void UpdateOrder(int orderid, List<Product> productsToDeliver, string status, DateTime plannedShipping, int sumPrice)
        {
            if (orderid != null)
            {
                try
                {
                    SqlCommand dBCommand = new SqlCommand("spUpdateCustomer", dBConnection);
                    dBCommand.CommandType = CommandType.StoredProcedure;
                    dBConnection.Open();

                    SqlParameter paramOrderid = new SqlParameter("@customerid", SqlDbType.Int);
                    paramOrderid.Value = orderid;
                    dBCommand.Parameters.Add(paramOrderid);

                    if (status != "")
                    {
                        SqlParameter paramStatus = new SqlParameter("@Status", SqlDbType.VarChar);
                        paramStatus.Value = status;
                        dBCommand.Parameters.Add(paramStatus);
                    }

                        SqlParameter paramPlannedShipping = new SqlParameter("@PlannedShipping", SqlDbType.DateTime);
                        paramPlannedShipping.Value = plannedShipping;
                        dBCommand.Parameters.Add(paramPlannedShipping);
                    

                    //
                    // På något sätt mäta hur Orderlistan ska förändras och utföra det mot SQL.
                    //

                    int result = dBCommand.ExecuteNonQuery();

                    if (result == 0)
                    {
                        /*alert*/
                        /*firstName = ("ERROR when adding Customer to Database!");*/
                    }
                }
                catch (Exception)
                {
                    /*lastName = "FEL vid uppdatering av kund till Databas!";*/
                }
                finally
                {
                    dBConnection.Close();
                }
            }
            else
            { /*alert*/
              /*VISA EN ALERT!: "Det har skett en miss vid valet av Kund att uppdatera"*/
            }
        }
        public static void DeleteOrder(int orderid)
        {
            try
            {
                SqlCommand dBCommand = new SqlCommand($"delete Order where OrderID = '{orderid}'", dBConnection);
                dBConnection.Open();

                int result = dBCommand.ExecuteNonQuery();
                if (result == 0)
                {
                    // MÖÖÖÖG
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
        }

        #endregion

    }



}
