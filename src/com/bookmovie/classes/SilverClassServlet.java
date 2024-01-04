package com.bookmovie.classes;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/silverClassServlet")
public class SilverClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int booked =  (int) request.getAttribute("booked");
		int id = (int) request.getAttribute("id");
		String email = request.getParameter("email");
		
		Connection con = null;
		RequestDispatcher dispatcher = null;

		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "root8080");
			Statement statement = con.createStatement();

			ResultSet rs = statement.executeQuery("select name,email,country from users where email="+"\'"+email+"\'");
			rs.next();
			String name = rs.getString(1);
			email = rs.getString(2);
			String country = rs.getString(3);
				
			request.setAttribute("name", name);
			request.setAttribute("country", country);
			request.setAttribute("booked", booked);
			request.setAttribute("id", id);
			dispatcher = request.getRequestDispatcher("silverClass.jsp");

			dispatcher.forward(request, response);

			statement.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
