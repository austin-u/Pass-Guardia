using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Windows.Input;

namespace Pass_Guardia
{
    public partial class MainPage : ContentPage, INotifyPropertyChanged
    {
        public ObservableCollection<PasswordEntry> Passwords { get; set; }

        private bool isEditing;
        public bool IsEditing
        {
            get => isEditing;
            set
            {
                isEditing = value;
                OnPropertyChanged();
            }
        }

        private bool isSelectingHashingMethod;
        public bool IsSelectingHashingMethod
        {
            get => isSelectingHashingMethod;
            set
            {
                isSelectingHashingMethod = value;
                OnPropertyChanged();
            }
        }

        private bool isPasswordHashed;
        public bool IsPasswordHashed
        {
            get => isPasswordHashed;
            set
            {
                isPasswordHashed = value;
                OnPropertyChanged();
            }
        }

        private PasswordEntry selectedPassword;
        public PasswordEntry SelectedPassword
        {
            get => selectedPassword;
            set
            {
                selectedPassword = value;
                OnPropertyChanged();
                OnPropertyChanged(nameof(PasswordStrength));
            }
        }

        private string selectedHashingMethod;

        public double PasswordStrength => CalculatePasswordStrength(SelectedPassword?.Password);

        public ICommand OnDeleteCommand { get; }
        public ICommand OnItemTappedCommand { get; }

        public MainPage()
        {
            InitializeComponent();
            Passwords = new ObservableCollection<PasswordEntry>();
            OnItemTappedCommand = new Command<PasswordEntry>(OnItemTapped);
            BindingContext = this;
            Task.Run(async () => await InitializeDatabase());
        }

        private async Task InitializeDatabase()
        {
            await DatabaseService.InitializeAsync();
            LoadPasswords();
        }

        private async void LoadPasswords()
        {
            var passwordEntries = await DatabaseService.GetPasswordEntries();
            Passwords.Clear();
            foreach (var entry in passwordEntries)
            {
                Passwords.Add(entry);
            }
        }

        private void OnAddPasswordClicked(object sender, EventArgs e)
        {
            SelectedPassword = new PasswordEntry();
            IsEditing = true;
            IsPasswordHashed = false; 
        }

        private void OnItemTapped(PasswordEntry entry)
        {
            SelectedPassword = entry;
            IsEditing = true;
            IsPasswordHashed = false; 
        }

        private async void OnSaveClicked(object sender, EventArgs e)
        {
            if (SelectedPassword.Id == 0)
            {
                SelectedPassword.CreatedAt = DateTime.Now;
                await DatabaseService.AddPasswordEntry(SelectedPassword);
            }
            else
            {
                await DatabaseService.UpdatePasswordEntry(SelectedPassword);
            }
            LoadPasswords();
            IsEditing = false;
        }

        private void OnCloseClicked(object sender, EventArgs e)
        {
            IsEditing = false;
        }

        private async void OnDeleteClicked(object sender, EventArgs e)
        {
            await DatabaseService.DeletePasswordEntry(SelectedPassword.Id);
            LoadPasswords();
            IsEditing = false;
        }

        private async void OnDelete(PasswordEntry entry)
        {
            await DatabaseService.DeletePasswordEntry(entry.Id);
            LoadPasswords();
        }

        private double CalculatePasswordStrength(string password)
        {
            if (string.IsNullOrEmpty(password)) return 0;
            int score = 0;
            if (password.Length >= 8) score++;
            if (password.Any(char.IsUpper)) score++;
            if (password.Any(char.IsLower)) score++;
            if (password.Any(char.IsDigit)) score++;
            if (password.Any(ch => !char.IsLetterOrDigit(ch))) score++;
            return (double)score / 5;
        }

        private void OnGeneratePasswordClicked(object sender, EventArgs e)
        {
            const int length = 12;
            const bool includeDigits = true;
            const bool includeLetters = true;
            const bool includeSymbols = true;
            const bool excludeSimilarCharacters = false;

            var generatedPassword = PasswordGenerator.GeneratePassword(length, includeDigits, includeLetters, includeSymbols, excludeSimilarCharacters);
            SelectedPassword.Password = generatedPassword;
            OnPropertyChanged(nameof(SelectedPassword));
            OnPropertyChanged(nameof(PasswordStrength));
        }

        private void OnShowHashingMethodClicked(object sender, EventArgs e)
        {
            HashMethodSelection.IsVisible = !HashMethodSelection.IsVisible;
        }

        private async void OnHashMethodSelected(object sender, EventArgs e)
        {
            var picker = sender as Picker;
            if (picker?.SelectedItem == null)
            {
                return; 
            }

            selectedHashingMethod = picker.SelectedItem.ToString();

            string hashedPassword = selectedHashingMethod switch
            {
                "SHA-256" => EncryptionHelper.HashWithSHA256(SelectedPassword.Password),
                "SHA-512" => EncryptionHelper.HashWithSHA512(SelectedPassword.Password),
                "PBKDF2" => EncryptionHelper.HashWithPBKDF2(SelectedPassword.Password),
                _ => throw new InvalidOperationException("Unknown hashing method")
            };

            SelectedPassword.Hash = hashedPassword; 
            SelectedPassword.HashType = selectedHashingMethod; 
            await DatabaseService.UpdatePasswordEntry(SelectedPassword); 
            LoadPasswords();

            OnPropertyChanged(nameof(SelectedPassword));
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged([CallerMemberName] string propertyName = "")
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
