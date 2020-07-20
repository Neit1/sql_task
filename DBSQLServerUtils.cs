using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;


namespace SqlConn
{
    class DBSQLServerUtils
    {

        public static SqlConnection
                 GetDBConnection(string datasource, string database)
        {
            //
            // Data Source=DESKTOP-SNTHIK2;Initial Catalog=valcurs;Integrated Security=True
            //
            string connString = @"Data Source=" + datasource + ";Initial Catalog="
                        + database + ";Integrated Security=True;";

            SqlConnection conn = new SqlConnection(connString);

            return conn;
        }


    }
}
