using System;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using Microsoft.Maui.Controls;

namespace Pass_Guardia
{
    public partial class PasswordsPage : ContentPage, INotifyPropertyChanged
    {
        private bool _isPasswordGenerated;
        private string _passwordStrengthText;
        private Color _passwordStrengthColor;

        public event PropertyChangedEventHandler PropertyChanged;

        public string PasswordStrengthText
        {
            get => _passwordStrengthText;
            set
            {
                _passwordStrengthText = value;
                OnPropertyChanged();
            }
        }

        public Color PasswordStrengthColor
        {
            get => _passwordStrengthColor;
            set
            {
                _passwordStrengthColor = value;
                OnPropertyChanged();
            }
        }

        public bool IsPasswordGenerated
        {
            get => _isPasswordGenerated;
            set
            {
                _isPasswordGenerated = value;
                OnPropertyChanged();
            }
        }

        public PasswordsPage()
        {
            InitializeComponent();
            PasswordLengthSlider.ValueChanged += OnPasswordLengthSliderChanged;
            UpdateGenerateButtonState();
        }

        private void OnPasswordLengthSliderChanged(object sender, ValueChangedEventArgs e)
        {
            PasswordLengthLabel.Text = e.NewValue.ToString("F0");
        }

        private void OnCopyPasswordClicked(object sender, EventArgs e)
        {
            Clipboard.SetTextAsync(GeneratedPassword.Text);
            DisplayAlert("Copied", "Password copied to clipboard", "OK");
        }

        private void OnGeneratePasswordClicked(object sender, EventArgs e)
        {
            int length = (int)PasswordLengthSlider.Value;
            bool includeDigits = IncludeDigits.IsChecked;
            bool includeLetters = IncludeLetters.IsChecked;
            bool includeSymbols = IncludeSymbols.IsChecked;
            bool excludeSimilarCharacters = ExcludeSimilarCharacters.IsChecked;

            GeneratedPassword.Text = PasswordGenerator.GeneratePassword(length, includeDigits, includeLetters, includeSymbols, excludeSimilarCharacters);
            EvaluatePasswordStrength(GeneratedPassword.Text);
            IsPasswordGenerated = true;
        }

        private void OnOptionsChanged(object sender, CheckedChangedEventArgs e)
        {
            UpdateGenerateButtonState();
        }

        private void UpdateGenerateButtonState()
        {
            bool isOptionSelected = IncludeDigits.IsChecked || IncludeLetters.IsChecked || IncludeSymbols.IsChecked;
            GenerateButton.IsEnabled = isOptionSelected;
        }

        private void EvaluatePasswordStrength(string password)
        {
            int score = 0;
            if (password.Length >= 12) score++;
            if (password.Any(char.IsDigit)) score++;
            if (password.Any(char.IsLower) && password.Any(char.IsUpper)) score++;
            if (password.Any(ch => "!@#$%^&*()-_=+[]{}|;:,.<>?".Contains(ch))) score++;
            if (!password.Any(ch => "il1LoO0".Contains(ch))) score++;

            switch (score)
            {
                case 5:
                    PasswordStrengthText = "Ultimate password strength reached!";
                    PasswordStrengthColor = Colors.Green;
                    break;
                case 4:
                    PasswordStrengthText = "Strong password";
                    PasswordStrengthColor = Colors.Green;
                    break;
                case 3:
                    PasswordStrengthText = "Moderate password";
                    PasswordStrengthColor = Colors.Orange;
                    break;
                default:
                    PasswordStrengthText = "Weak password";
                    PasswordStrengthColor = Colors.Red;
                    break;
            }
        }

        protected void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
