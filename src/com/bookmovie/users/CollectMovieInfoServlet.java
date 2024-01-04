package com.bookmovie.users;

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

@WebServlet("/collectMovieInfo")
public class CollectMovieInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id =Integer.parseInt(request.getParameter("id"));
		
		Connection con = null;
		RequestDispatcher dispatcher = null;

		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres", "root8080");

			Statement st = con.createStatement();
		
			ResultSet rs = st.executeQuery("SELECT movie.title FROM movie INNER JOIN show ON show.mid = movie.id where show.id ="+id);
			rs.next();
			String title = rs.getString(1);
			
			request.setAttribute("title", title);
			
			dispatcher = request.getRequestDispatcher("bookMovie.jsp");

			dispatcher.forward(request, response);

			con.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

}