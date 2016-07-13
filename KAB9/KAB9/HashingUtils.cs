using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;

namespace KAB9
{
    /// <summary>
    /// This Class is used for hashing and dehashing strings. It is set as static so it do not have to be instanced for every use. 
    /// Outline Created by Johan Ekblom.
    /// Salting strings should be used and should be known to programmer. After it has been choosen it may not change since then will all old hashed values be lost and not fully recoverable.
    /// The salt string could be a set value or a value that will not change from the content. For example: If the string to hash is a password of a user and the user have registerd a phone number
    /// then the phone number can be used as a salt string. If then the phone number is changed a "change password" call to the database have to be used so that the new hashed string is sent to 
    /// the database.
    /// </summary>
    static public class HashingUtils
    {
        /// <summary>
        /// This method is used to hash and salt a string for example passwords, ssn or any other string that needs to be encrypted.
        /// </summary>
        /// <param name="stringToHash"> The string that will be hashed</param>
        /// <param name="salt">A value string that will be used to make decryption harder. If none is provided the string is set to empty.("")</param>
        /// <returns>A hashed and salted string</returns>
        static public string Hashing(string stringToHash, string salt="")
        {
            /*
             * Check if values are hasable else return value or throw exeption. To be decided. 
             */

            /*
             *Here will the salting be done.
             * 
             */

            /*
             *Here will the hashing algorithem be used. 
             */

            return stringToHash;
        }

        /// <summary>
        /// This method is used to decrypt an encrypted string using the algorithm and the salt string.
        /// </summary>
        /// <param name="HasedString">String to be deHashed</param>
        /// <param name="salt">The value string that was used to make decryption harder. If none is provided the string is set to empty.("")</param>
        /// <returns> An washed and cleaned string</returns>
        static public string DeHashing(string HasedString, string salt="")
        {
            /*
             *Check if string is hasched. Return string if not or throw exeption. To be decided 
             */

            /*
            *Here will the dehashing algorithem be used. 
            */

            /*
            *Here will the desalting be done.
            * 
            */



            return HasedString;
        }

        /*
         * There can be private methods for internal use here.
         */


    }
}