package com.manoj.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.manoj.model.User;
import com.manoj.services.DatabaseConnection;

public class UserDao {
	private final String INSERT_SQL = "INSERT INTO users(name, password, address, phoneNumber, email) VALUES(?, ?, ?, ?, ?);";
	private final String UPDATE_SQL = "UPDATE users SET id=?, name=?, password=?, address=?, phoneNumber=?, email=? WHERE id=?;";
	private final String DELETE_SQL = "DELETE FROM users WHERE id=?;";
	private final String SELECT_BY_NAME_AND_PASS_SQL = "SELECT * FROM users WHERE name=? AND password=?;";
	private final String SELECT_BY_ID_SQL = "SELECT * FROM users WHERE id=?;";
	private final String SELECT_BY_NAME_SQL = "SELECT * FROM users WHERE name=?;";
	private final String SELECT_ALL_SQL = "SELECT * FROM users;";
	private final String SELECT_ALL_USERS_EXCEPT_ADMIN = "SELECT * FROM users WHERE name <> 'admin';";
	
	public boolean insertUser(User user) throws ClassNotFoundException, SQLException {
		Connection con = DatabaseConnection.getConnection();
		boolean result = false;
		
		PreparedStatement ps = con.prepareStatement(INSERT_SQL);
		ps.setString(1, user.getName());
		ps.setString(2, user.getPassword());
		ps.setString(3, user.getAddress());
		ps.setLong(4, user.getPhoneNumber());
		ps.setString(5, user.getEmail());
		result = ps.executeUpdate() > 0;
		
		ps.close();
		con.close();
		
		return result;
	}
	
	public boolean updatetUser(User user) throws ClassNotFoundException, SQLException {
		Connection con = DatabaseConnection.getConnection();
		boolean result = false;
		
		PreparedStatement ps = con.prepareStatement(UPDATE_SQL);
		ps.setInt(1, user.getId());
		ps.setString(2, user.getName());
		ps.setString(3, user.getPassword());
		ps.setString(4, user.getAddress());
		ps.setLong(5, user.getPhoneNumber());
		ps.setString(6, user.getEmail());
		ps.setInt(7, user.getId());
		result = ps.executeUpdate() > 0;
		
		ps.close();
		con.close();
		
		return result;
	}
	
	public boolean deletetUser(int id) throws ClassNotFoundException, SQLException {
		Connection con = DatabaseConnection.getConnection();
		boolean result = false;
		
		PreparedStatement ps = con.prepareStatement(DELETE_SQL);
		ps.setInt(1, id);
		result = ps.executeUpdate() > 0;
		
		ps.close();
		con.close();
		
		return result;
	}
	
	public User selectUserByNameAndPassword(String name, String password) throws ClassNotFoundException, SQLException {
		Connection con = DatabaseConnection.getConnection();
		User user = null;
		
		PreparedStatement ps = con.prepareStatement(SELECT_BY_NAME_AND_PASS_SQL);
		ps.setString(1, name);
		ps.setString(2, password);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			user = new User();
			user.setId(rs.getInt(1));
			user.setName(rs.getString(2));
			user.setPassword(rs.getString(3));
			user.setAddress(rs.getString(4));
			user.setPhoneNumber(rs.getLong(5));
			user.setEmail(rs.getString(6));
		}
		
		ps.close();
		con.close();
		
		return user;
	}
	
	public User selectUserById(int id) throws ClassNotFoundException, SQLException {
		Connection con = DatabaseConnection.getConnection();
		User user = null;
		
		PreparedStatement ps = con.prepareStatement(SELECT_BY_ID_SQL);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			user = new User();
			user.setId(rs.getInt(1));
			user.setName(rs.getString(2));
			user.setPassword(rs.getString(3));
			user.setAddress(rs.getString(4));
			user.setPhoneNumber(rs.getLong(5));
			user.setEmail(rs.getString(6));
		}
		
		ps.close();
		con.close();
		
		return user;
	}
	
	public List<User> selectAllUsersExceptAdmin() throws ClassNotFoundException, SQLException {
		Connection con = DatabaseConnection.getConnection();
		List<User> users = new ArrayList<>();
		
		PreparedStatement ps = con.prepareStatement(SELECT_ALL_USERS_EXCEPT_ADMIN);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			User temp = new User();
			temp.setId(rs.getInt(1));
			temp.setName(rs.getString(2));
			temp.setPassword(rs.getString(3));
			temp.setAddress(rs.getString(4));
			temp.setPhoneNumber(rs.getLong(5));
			temp.setEmail(rs.getString(6));
			users.add(temp);
		}
		
		ps.close();
		con.close();
		
		return users;
	}
	
	public List<User> selectAllUsers(String name, String password) throws ClassNotFoundException, SQLException {
		Connection con = DatabaseConnection.getConnection();
		List<User> users = new ArrayList<>();
		
		PreparedStatement ps = con.prepareStatement(SELECT_ALL_SQL);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			User temp = new User();
			temp.setId(rs.getInt(1));
			temp.setName(rs.getString(2));
			temp.setPassword(rs.getString(3));
			temp.setAddress(rs.getString(4));
			temp.setPhoneNumber(rs.getLong(5));
			temp.setEmail(rs.getString(6));
			users.add(temp);
		}
		
		ps.close();
		con.close();
		
		return users;
	}
	
	public boolean checkUserExistence(String userName) throws ClassNotFoundException, SQLException {
		Connection con = DatabaseConnection.getConnection();
		boolean result = false;
		
		PreparedStatement ps = con.prepareStatement(SELECT_BY_NAME_SQL);
		ps.setString(1, userName);
		ResultSet rs = ps.executeQuery();
		result = rs.next();
		
		ps.close();
		con.close();
		
		return result;
	}
}
