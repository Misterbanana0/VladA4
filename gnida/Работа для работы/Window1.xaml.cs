using System;
using System.Collections.Generic;
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
    /// Логика взаимодействия для Window1.xaml
    /// </summary>
    public partial class Window1 : Window
    {
        public Window1()
        {
            InitializeComponent();
        }

        private void LoginTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (!String.IsNullOrEmpty(loginTextBox.Text))
            {
                if (!String.IsNullOrEmpty(passwordTextbox.Password))
                {
                    IQueryable<Авторизация> Авторизация_list = baza.GetContext().Авторизация.Where(p => p.Логин == loginTextBox.Text && p.Пароль == passwordTextbox.Password);
                    if (Авторизация_list.Count() == 1)
                        MessageBox.Show(" Вечер в хату " + Авторизация_list.First().Логин);
                    Window2 window = new Window2(Авторизация_list.First());
                    window.Owner = this;
                    window.Show();
                    this.Hide();
                }
                else MessageBox.Show("Неверный пароль или логин!");
            }
        }
    }
}
