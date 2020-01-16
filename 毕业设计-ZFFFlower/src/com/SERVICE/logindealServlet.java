package com.SERVICE;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDao;

@WebServlet("/logindealServlet")
public class logindealServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public logindealServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String user_name = request.getParameter("username");
		String user_pass = request.getParameter("userpass");
		String user_type = request.getParameter("usertype");

		try {
			UserDao userDao = new UserDao();
			String userid = userDao.searchInfo(user_name, user_pass, user_type);
			session.setAttribute("id", userid);

			boolean rsdata = userDao.userExits(user_name);
			if (user_name.equals("")) {
				response.sendRedirect("index.jsp");
			} else if (user_pass.equals("")) {
				response.sendRedirect("index.jsp");
			} else if (rsdata) {
				boolean rsdata1 = userDao.login(user_name, user_pass, user_type);
					if (rsdata1) {
						if (user_type.equals("A")) {
							response.sendRedirect("main.jsp");
						} else if (user_type.equals("B")) {
							response.sendRedirect("TMain.jsp");
						} else if (user_type.equals("C")) {
							response.sendRedirect("Main.jsp");
						}
					} else {
						response.sendRedirect("index.jsp");
					}
				} else {
					response.sendRedirect("index.jsp");
				}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
