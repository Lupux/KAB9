namespace KAB9
{
    public class Product
    {
        #region Properties
        public string Description
        {
            get
            {
                return Description;
            }

            set
            {
                Description = value;
            }
        }

        public double Price
        {
            get
            {
                return Price;
            }

            set
            {
                Price = value;
            }
        }

        public int Productid
        {
            get
            {
                return Productid;
            }

            set
            {
                Productid = value;
            }
        }

        public string ProductName
        {
            get
            {
                return ProductName;
            }

            set
            {
                ProductName = value;
            }
        }

        public int Stock
        {
            get
            {
                return Stock;
            }

            set
            {
                Stock = value;
            }
        }
        #endregion

        public Product(int productid, string productName, string description, double price, int stock)
        {
            this.Productid = productid;
            this.ProductName = productName;
            this.Description = description;
            this.Price = price;
            this.Stock = stock;
        }
    }
}