package com.DAO;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBHelper {
	private Connection connection = null;
	private ResultSet rs = null;
	private Statement statement = null;
	private static final String url = "jdbc:mysql://localhost:3306/system-zffflower?useUnicode=true&characterEncoding=utf8";
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	private void getConnection() throws SQLException {
		connection = DriverManager.getConnection(url, "root", "");
	}

	public void executeUpdate(String sql) throws Exception {
		getConnection();
		Statement statement = connection.createStatement();
		statement.executeUpdate(sql);
	}

	public ResultSet excuteQuery(String sql) throws Exception {
		getConnection();
		Statement statement = connection.createStatement();
		ResultSet rs = statement.executeQuery(sql);
		return rs;
	}

	public void close() throws SQLException {
		if (rs != null) {
			rs.close();
			rs = null;
		}
		if (statement != null) {
			statement.close();
			statement = null;
		}
		if (connection != null) {
			connection.close();
			connection = null;
		}
	}

}
