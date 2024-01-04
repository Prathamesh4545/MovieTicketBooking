package com.bookmovie.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String title = request.getParameter("inputName");

		Connection con = null;
		RequestDispatcher dispatcher = null;

		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "root8080");
			

			PreparedStatement statement = con.prepareStatement("DELETE FROM movie WHERE title=?");
			statement.setString(1, title);
			int rowAffected = statement.executeUpdate();

			dispatcher = request.getRequestDispatcher("delete.jsp");

			if (rowAffected > 0) {
				request.setAttribute("status", "success");
			} else {
				request.setAttribute("status", "failed");
			}
			dispatcher.forward(request, response);

			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
