package onlinebanking.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {
	
	public static Connection connect() throws Exception{
		//driver load
		Class.forName("com.mysql.cj.jdbc.Driver");

		//database connection
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_online_banking", "root", "");
		//sql prepare
		
		return conn;
	}

}
