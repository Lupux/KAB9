using System.Collections.Generic;

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

        public Customer(int customerID, string firstName, string lastName, string email, string phoneNr, string companyName, string orgNr, List<Address> tmpAddressList) : this(customerID, firstName, lastName, email, phoneNr, companyName, orgNr)
        {
            this.Addresses = tmpAddressList;
        }

        public List<Address> Addresses
        {
            get
            { return Addresses; }
            private set
            { Addresses = value; }
        }

        public string CompanyName
        {
            get
            {
                return CompanyName;
            }

            private set
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

            private set
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

            private set
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

            private set
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

            private set
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

            private set
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

            private set
            {
                PhoneNr = value;
            }
        }
    }
}