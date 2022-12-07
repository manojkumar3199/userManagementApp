package com.manoj.services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	private static Connection con = null;
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/login";
		String user = "root";
		String password = "root";
		
		Class.forName(driver);
		con = DriverManager.getConnection(url, user, password);
		
		return con;
	}
}
