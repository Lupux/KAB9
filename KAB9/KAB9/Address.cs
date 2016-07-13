namespace KAB9
{
    public class Address
    {
        private int addressID;
        private string city;
        private string country;
        private string street;
        private string zipCode;

        public Address(int addressID, string street, string zipCode, string city, string country)
        {
            this.addressID = addressID;
            this.street = street;
            this.zipCode = zipCode;
            this.city = city;
            this.country = country;
        }
    }
}