using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Работа_для_работы
{
    /// <summary>
    /// Логика взаимодействия для Window2.xaml
    /// </summary>
    public partial class Window2 : Window
    {
        private Авторизация авторизация;
        public Window2(Авторизация авторизация)
        {
            InitializeComponent();
            var emp = baza.GetContext().Coтрудники.Where(p => p.id_сотрудника == авторизация.id_сотрудника).First();
            this.авторизация = авторизация;
            family_label.Content = emp.Фамилия;
            name_label.Content = emp. Имя;
            otcestvo_label.Content = emp.Отчество;

            if (!String.IsNullOrEmpty(авторизация.Аватарка))
            {
                try
                {
                    image_profiel.Source = new BitmapImage(new Uri(System.IO.Path.GetFullPath("image/" + авторизация.Аватарка)));
                }
                catch(IOException ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }

        }

        private void Exit_button_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
            this.Close();
        }
    }
}
