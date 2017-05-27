package com.JdbcConnection;

import java.sql.*;

import java.sql.Connection;
	
public class JdbcConnection {

	public static Connection con=null;
	public static Connection getCon()
	{                                                               //Actually Class.forName is used for connecting or registering with the "database driver" available in the system and when this is called then DriverManager is used to get connection from the "database"  mean the databases like mySql,oracle etc... created in the system,,we will create the database required for us inside the mysql,oracle or other....
		try{
			Class.forName("com.mysql.jdbc.Driver");    // we use DriverManager.getConnection() to get connection with the database using "URL" inside DriverManager we will have static object and in driver class we have drivermanager.getConnection ...  so on methods ----this is not a complete explanation about this concept to get clarity
		 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student_information", "root","chamanth");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return con;
	
		
	}
}
