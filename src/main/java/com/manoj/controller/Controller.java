package com.manoj.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

import com.manoj.dao.UserDao;
import com.manoj.model.User;

@WebServlet({ "/login", "/logout", "/delete", "/editPage", "/updateDetails", "/changePasswordPage", "/updatePassword", "/signUp"})
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao = new UserDao();

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getServletPath();
		if (action.equals("/login")) {
			login(req, res);
		}else if(action.equals("/updateDetails")) {
			updateUserDetails(req, res);
		}else if(action.equals("/updatePassword")) {
			updateUserPassword(req, res);
		}else if(action.equals("/signUp")) {
			addNewUser(req, res);
		}
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getServletPath();
		if (action.equals("/logout")) {
			logout(req, res);
		} else if (action.equals("/delete")) {
			deleteUser(req, res);
		}else if(action.equals("/editPage")) {
			editPage(req, res);
		}else if(action.equals("/changePasswordPage")) {
			changePasswordPage(req, res);
		}
	}

	private void login(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String userName = req.getParameter("userName");
		String password = req.getParameter("password");
		try {
			User user = userDao.selectUserByNameAndPassword(userName, password);
			if (user != null) {
				req.getSession().setAttribute("logedInUser", user);
				res.sendRedirect("user.jsp");
			} else {
				res.getWriter().println("user name=" + userName + " with password=" + password + " does't exist!");
			}

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

	private void logout(HttpServletRequest req, HttpServletResponse res) throws IOException {
		req.getSession().invalidate();
		res.sendRedirect(req.getContextPath());
		return;
	}

	private void deleteUser(HttpServletRequest req, HttpServletResponse res) throws IOException {
		Integer id = Integer.valueOf(req.getParameter("id"));
		try {
			boolean result = userDao.deletetUser(id);
			if (result) {
				User user = (User) req.getSession().getAttribute("logedInUser");
				if (user.getId() == id) {
					logout(req, res);
					return;
				}
				res.sendRedirect("user.jsp");
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	
	private void editPage(HttpServletRequest req, HttpServletResponse res) throws IOException {
		Integer id = Integer.valueOf(req.getParameter("id"));
		try {
			User editUser = userDao.selectUserById(id);
			req.getSession().setAttribute("editUser", editUser);
			res.sendRedirect("editPage.jsp");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	
	private void updateUserDetails(HttpServletRequest req, HttpServletResponse res) throws IOException {
		Integer userId = Integer.valueOf(req.getParameter("userId"));
		String userName = req.getParameter("userName");
		String password = req.getParameter("password");
		String address = req.getParameter("address");
		Long phoneNumber = Long.valueOf(req.getParameter("phoneNumber"));
		String email = req.getParameter("email");
		
		User temp = new User();
		temp.setId(userId);
		temp.setName(userName);
		temp.setPassword(password);
		temp.setAddress(address);
		temp.setPhoneNumber(phoneNumber);
		temp.setEmail(email);
		
		try {
			boolean result = userDao.updatetUser(temp);
			if(result) {
				res.sendRedirect("user.jsp");
				return;
			}else {
				res.getWriter().println("something went wrong!");
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	
	private void changePasswordPage(HttpServletRequest req, HttpServletResponse res) throws IOException {
		Integer id = Integer.valueOf(req.getParameter("id"));
		try {
			User changeUserPassword = userDao.selectUserById(id);
			req.getSession().setAttribute("changeUserPassword", changeUserPassword);
			res.sendRedirect("changePasswordPage.jsp");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	
	private void updateUserPassword(HttpServletRequest req, HttpServletResponse res) throws IOException {
		Integer userId = Integer.valueOf(req.getParameter("userId"));
		String userName = req.getParameter("userName");
		String password = req.getParameter("password");
		String address = req.getParameter("address");
		Long phoneNumber = Long.valueOf(req.getParameter("phoneNumber"));
		String email = req.getParameter("email");
		
		String oldPassword = req.getParameter("oldPassword");
		String newPassword = req.getParameter("newPassword");
		
		if(password.equals(oldPassword)) {
			User temp = new User();
			temp.setId(userId);
			temp.setName(userName);
			temp.setPassword(newPassword);
			temp.setAddress(address);
			temp.setPhoneNumber(phoneNumber);
			temp.setEmail(email);
			try {
				boolean result = userDao.updatetUser(temp);
				if(result) {
					res.sendRedirect("user.jsp");
					return;
				}else {
					res.getWriter().println("something went wrong!");
				}
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		}else {
			res.getWriter().println("old password doen't match!");
		}
	}
	
	private void addNewUser(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String userName = req.getParameter("userName");
		String password = req.getParameter("password");
		String address = req.getParameter("address");
		Long phoneNumber = Long.valueOf(req.getParameter("phoneNumber"));
		String email = req.getParameter("email");
		
		System.out.println(userName+", "+password+", "+address+", "+phoneNumber+", "+email);
		
		try {
			if(!userDao.checkUserExistence(userName)) {
				User temp = new User();
				temp.setName(userName);
				temp.setPassword(password);
				temp.setAddress(address);
				temp.setPhoneNumber(phoneNumber);
				temp.setEmail(email);
				
				boolean result = userDao.insertUser(temp);
				if(result) {
						res.sendRedirect(req.getContextPath());
				}else {
					res.getWriter().println("something went wrong!");
				}
			}else {
				res.getWriter().println("Plz chose different name, user with name="+userName+" already exists!");
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

}
