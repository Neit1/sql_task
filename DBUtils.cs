using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace SqlConn
{
    class DBUtils
    {
        public static SqlConnection GetDBConnection()
        {
            string datasource = @"DESKTOP-SNTHIK2";

            string database = "valcurs";

            return DBSQLServerUtils.GetDBConnection(datasource, database);
        }
    }

}