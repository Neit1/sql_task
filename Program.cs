using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SqlConn;
using System.Data.SqlClient;
using System.Data.Common;

namespace SQLServer
{
    class QueryGetData
    {
        static void Main(string[] args)
        {
            SqlConnection conn = DBUtils.GetDBConnection();
            conn.Open();
            try
            {
                getData(conn, "R01035", "21.08.2019");
            }
            catch (Exception e)
            {
                Console.WriteLine("Error: " + e);
                Console.WriteLine(e.StackTrace);
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
            Console.Read();
        }

        private static string getData(SqlConnection conn, string idVal, string Date)
        {
            string Value = null;
            string sql = "SELECT Value FROM valcurs.dbo.valute v WHERE v.idVal = @idVal AND v.Date = @Date";

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = sql;

            cmd.Parameters.AddWithValue("@idVal", idVal);
            cmd.Parameters.AddWithValue("@Date", Date);

            using (DbDataReader reader = cmd.ExecuteReader())
            {
                if (reader.HasRows)
                {

                    while (reader.Read())
                    {
                        int ValueIndex = reader.GetOrdinal("Value");
                        Value = Convert.ToString(reader.GetValue(ValueIndex));

                        Console.WriteLine("Value: " + Value);
                    }
                }
            }

            return Value;
        }
    }

}
