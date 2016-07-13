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

        public int ProductId
        {
            get
            {
                return ProductId;
            }

            set
            {
                ProductId = value;
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

        public int ItemsInStock
        {
            get
            {
                return ItemsInStock;
            }

            set
            {
                ItemsInStock = value;
            }
        }

        public int AmountInOrder { get; set; }
        #endregion

        public Product(int productId, string productName, string description, double price, int itemsInStock)
        {
            this.ProductId = productId;
            this.ProductName = productName;
            this.Description = description;
            this.Price = price;
            this.ItemsInStock = itemsInStock;
        }
    }
}