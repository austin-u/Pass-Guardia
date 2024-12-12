using System.Collections.Generic;
using System.Threading.Tasks;
using SQLite;
using System.IO;

namespace Pass_Guardia
{
    public static class DatabaseService
    {
        private static SQLiteAsyncConnection database;

        public static async Task InitializeAsync()
        {
            if (database == null)
            {
                var databasePath = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "pass_guardia.db3");
                database = new SQLiteAsyncConnection(databasePath);
                await database.CreateTableAsync<UserEntry>();
                await database.CreateTableAsync<PasswordEntry>();
            }
        }

        public static async Task AddUserEntry(UserEntry userEntry)
        {
            var existingUser = await GetUserEntry(userEntry.Username);
            if (existingUser == null)
            {
                await database.InsertAsync(userEntry);
            }
            else
            {
                throw new Exception("User with this username already exists.");
            }
        }

        public static Task<UserEntry> GetUserEntry(string username)
        {
            return database.Table<UserEntry>().Where(u => u.Username == username).FirstOrDefaultAsync();
        }

        public static Task<List<PasswordEntry>> GetPasswordEntries()
        {
            return database.Table<PasswordEntry>().ToListAsync();
        }

        public static Task AddPasswordEntry(PasswordEntry passwordEntry)
        {
            return database.InsertAsync(passwordEntry);
        }

        public static Task UpdatePasswordEntry(PasswordEntry passwordEntry)
        {
            return database.UpdateAsync(passwordEntry);
        }

        public static Task DeletePasswordEntry(int id)
        {
            return database.DeleteAsync<PasswordEntry>(id);
        }
    }

    public class UserEntry
    {
        [PrimaryKey, AutoIncrement]
        public int Id { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
    }
}
