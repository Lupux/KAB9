namespace KAB9
{
    public class Customer
    {


        public Customer(int customerID, string firstName, string lastName, string email, string phoneNr, string companyName, string orgNr)
        {
            this.CustomerID = customerID;
            this.FirstName = firstName;
            this.LastName = lastName;
            this.Email = email;
            this.PhoneNr = phoneNr;
            this.CompanyName = companyName;
            this.OrgNr = orgNr;
        }

        public string CompanyName
        {
            get
            {
                return CompanyName;
            }

            set
            {
                CompanyName = value;
            }
        }

        public int CustomerID
        {
            get
            {
                return CustomerID;
            }

            set
            {
                CustomerID = value;
            }
        }

        public string Email
        {
            get
            {
                return Email;
            }

            set
            {
                Email = value;
            }
        }

        public string FirstName
        {
            get
            {
                return FirstName;
            }

            set
            {
                FirstName = value;
            }
        }

        public string LastName
        {
            get
            {
                return LastName;
            }

            set
            {
                LastName = value;
            }
        }

        public string OrgNr
        {
            get
            {
                return OrgNr;
            }

            set
            {
                OrgNr = value;
            }
        }

        public string PhoneNr
        {
            get
            {
                return PhoneNr;
            }

            set
            {
                PhoneNr = value;
            }
        }
    }
}