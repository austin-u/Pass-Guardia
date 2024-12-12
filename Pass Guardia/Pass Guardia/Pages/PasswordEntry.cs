using SQLite;

public class PasswordEntry
{
    [PrimaryKey, AutoIncrement]
    public int Id { get; set; }
    public string Title { get; set; } = string.Empty;
    public string Username { get; set; } = string.Empty;
    public string Password { get; set; } = string.Empty;
    public string Website { get; set; } = string.Empty;
    public DateTime CreatedAt { get; set; }
    public string Hash { get; set; } = string.Empty; 
    public string HashType { get; set; } = string.Empty;
}
