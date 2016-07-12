using System;
using System.Collections.Generic;

namespace KAB9
{
    public class Order
    {
        public Order(int orderid, int customerid, List<Product> productsToDeliver, string status, DateTime plannedShipping, int sumPrice)
        {
            Orderid = orderid;
            this.Customerid = customerid;
            ProductsToDeliver = productsToDeliver;
            Status = status;
            PlannedShipping = plannedShipping;
            SumPrice = sumPrice;
        }

        #region Properties
        public int Customerid
        {
            get
            {
                return Customerid;
            }

            set
            {
                Customerid = value;
            }
        }

        public int Orderid
        {
            get
            {
                return Orderid;
            }

            set
            {
                Orderid = value;
            }
        }

        public DateTime PlannedShipping
        {
            get
            {
                return PlannedShipping;
            }

            set
            {
                PlannedShipping = value;
            }
        }

        public List<Product> ProductsToDeliver
        {
            get
            {
                return ProductsToDeliver;
            }

            set
            {
                ProductsToDeliver = value;
            }
        }

        public string Status
        {
            get
            {
                return Status;
            }

            set
            {
                Status = value;
            }
        }

        public int SumPrice
        {
            get
            {
                return SumPrice;
            }

            set
            {
                SumPrice = value;
            }
        }
        #endregion

    }
}