using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace ConsoleApp2
{
    class Program
    {
        static void Main(string[] args)
        {
            string connectionString = "Server=ST-02\\SQLEXPRESS;Database=master;Trusted_connection = true";

            /*Otvara i zatvara konekciju nakon izvrsavanja te s time izbjegavamo da nam ostane mreza otvorena*/
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = "SELECT * FROM Orders";

                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        string idOrder = dr["id_order"].ToString();
                        string product = dr["product"].ToString();
                        string totalPrice = dr["total_price"].ToString();

                        Console.WriteLine(idOrder + " " + product + " " + totalPrice);
                    }
                    dr.Close();
                }
            }
            Console.ReadKey();
        }


    }
}

