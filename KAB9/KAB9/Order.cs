using System;
using System.Collections.Generic;

namespace KAB9
{
    public class Order
    {

        public Order(int orderid, List<Product> productsToDeliver, string status, DateTime plannedShipping, int sumPrice)
        {
            this.Orderid = orderid;
            this.ProductsToDeliver = productsToDeliver;
            this.Status = status;
            this.PlannedShipping = plannedShipping;
            this.SumPrice = sumPrice;
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
    }
}