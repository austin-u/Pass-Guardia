using Microsoft.Maui.Controls;
using System.Threading.Tasks;

namespace Pass_Guardia
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();
            Task.Run(async () => await InitializeDatabase());
            MainPage = new NavigationPage(new LoginPage());
        }

        private async Task InitializeDatabase()
        {
            await DatabaseService.InitializeAsync();
        }
    }
}
