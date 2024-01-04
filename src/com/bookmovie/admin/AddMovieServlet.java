package com.bookmovie.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addMovieServlet")
public class AddMovieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("inputName");
		String genere = request.getParameter("inputGenere");
		int duration = Integer.parseInt(request.getParameter("inputDuration"));
		String director = request.getParameter("inputDirector");
		String query = "insert into movie(title,genere,duration,director)values(?,?,?,?)";
		
		Connection con = null;
		RequestDispatcher dispatcher = null;

		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres", "root8080");
			PreparedStatement preparedStatement = con.prepareStatement(query);
			preparedStatement.setString(1, title);
			preparedStatement.setString(2, genere);
			preparedStatement.setInt(3, duration);
			preparedStatement.setString(4, director);
			
			int count = preparedStatement.executeUpdate();
			dispatcher = request.getRequestDispatcher("add.jsp");

			if (count > 0) {
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
