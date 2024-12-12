using System;
using System.Security.Cryptography;
using System.Text;

namespace Pass_Guardia
{
    public static class EncryptionHelper
    {
        public static string HashWithSHA256(string input)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(input));
                return Convert.ToBase64String(bytes);
            }
        }

        public static string HashWithSHA512(string input)
        {
            using (SHA512 sha512 = SHA512.Create())
            {
                byte[] bytes = sha512.ComputeHash(Encoding.UTF8.GetBytes(input));
                return Convert.ToBase64String(bytes);
            }
        }

        public static string HashWithPBKDF2(string input)
        {
            using (var rng = new RNGCryptoServiceProvider())
            {
                byte[] salt = new byte[16];
                rng.GetBytes(salt);

                var pbkdf2 = new Rfc2898DeriveBytes(input, salt, 10000);
                byte[] hash = pbkdf2.GetBytes(32);

                byte[] hashBytes = new byte[48];
                Array.Copy(salt, 0, hashBytes, 0, 16);
                Array.Copy(hash, 0, hashBytes, 16, 32);

                return Convert.ToBase64String(hashBytes);
            }
        }
    }
}
