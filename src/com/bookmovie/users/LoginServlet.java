package com.bookmovie.users;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("uemail");
		String password = request.getParameter("upass");
		HttpSession session = request.getSession();

		Connection con = null;
		RequestDispatcher dispatcher = null;
		try {
			Class.forName("org.postgresql.Driver");

			con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "root8080");
			PreparedStatement ps = con.prepareStatement("select * from users where email = ? and password = ?");
			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				session.setAttribute("email", rs.getString("email"));
				dispatcher = request.getRequestDispatcher("index.jsp");
			} else {
				request.setAttribute("status","failed");
				dispatcher = request.getRequestDispatcher("loginForm.jsp");
			}
			dispatcher.forward(request, response);

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
