using Microsoft.Maui.Controls;
using System;
using System.Threading.Tasks;

namespace Pass_Guardia
{
    public partial class RegisterPage : ContentPage
    {
        public RegisterPage()
        {
            InitializeComponent();
        }

        private async void OnRegisterButtonClicked(object sender, EventArgs e)
        {
            string username = UsernameEntry.Text;
            string password = PasswordEntry.Text;
            string confirmPassword = ConfirmPasswordEntry.Text;

            if (password != confirmPassword)
            {
                ErrorMessageLabel.Text = "Passwords do not match";
                ErrorMessageLabel.IsVisible = true;
                return;
            }

            try
            {
                if (await SaveUserDetailsAsync(username, password))
                {
                    Application.Current.MainPage = new LoginPage();
                }
                else
                {
                    ErrorMessageLabel.Text = "Registration failed";
                    ErrorMessageLabel.IsVisible = true;
                }
            }
            catch (Exception ex)
            {
                ErrorMessageLabel.Text = ex.Message;
                ErrorMessageLabel.IsVisible = true;
            }
        }

        private async Task<bool> SaveUserDetailsAsync(string username, string password)
        {
            try
            {
                var userEntry = new UserEntry
                {
                    Username = username,
                    Password = password 
                };

                await DatabaseService.AddUserEntry(userEntry);
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
