using Microsoft.Maui.Controls;
using System;
using System.Threading.Tasks;

namespace Pass_Guardia
{
    public partial class LoginPage : ContentPage
    {
        public LoginPage()
        {
            InitializeComponent();
        }

        private async void OnLoginButtonClicked(object sender, EventArgs e)
        {
            string username = UsernameEntry.Text;
            string password = PasswordEntry.Text;

            if (await ValidateLoginAsync(username, password))
            {
                Application.Current.MainPage = new AppShell();
            }
            else
            {
                ErrorMessageLabel.Text = "Invalid username or password";
                ErrorMessageLabel.IsVisible = true;
            }
        }

        private async Task<bool> ValidateLoginAsync(string username, string password)
        {
            var user = await DatabaseService.GetUserEntry(username);
            return user != null && user.Password == password;
        }

        private void OnRegisterButtonClicked(object sender, EventArgs e)
        {
            Application.Current.MainPage = new RegisterPage();
        }
    }
}
