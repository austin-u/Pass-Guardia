namespace Pass_Guardia
{
    public static class PasswordGenerator
    {
        public static string GeneratePassword(int length, bool includeDigits, bool includeLetters, bool includeSymbols, bool excludeSimilarCharacters)
        {
            const string digits = "0123456789";
            const string letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
            const string symbols = "!@#$%^&*()-_=+[]{}|;:,.<>?";
            const string similarCharacters = "il1LoO0";

            string characterSet = string.Empty;
            if (includeDigits) characterSet += digits;
            if (includeLetters) characterSet += letters;
            if (includeSymbols) characterSet += symbols;
            if (excludeSimilarCharacters)
            {
                foreach (char c in similarCharacters)
                {
                    characterSet = characterSet.Replace(c.ToString(), string.Empty);
                }
            }
            if (string.IsNullOrEmpty(characterSet))
            {
                return string.Empty;
            }

            var random = new Random();
            return new string(Enumerable.Repeat(characterSet, length)
                .Select(s => s[random.Next(s.Length)]).ToArray());
        }
    }
}
