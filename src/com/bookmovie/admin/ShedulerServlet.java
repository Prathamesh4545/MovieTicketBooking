package com.bookmovie.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/shedulerServlet")
public class ShedulerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int mid = Integer.parseInt(request.getParameter("mid"));
		int screen = Integer.parseInt(request.getParameter("sno"));
		int slot = Integer.parseInt(request.getParameter("slot"));
		
		Connection con = null;
		RequestDispatcher dispatcher = null;

		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres", "root8080");
			PreparedStatement pr = con.prepareStatement("insert into show(mid,screen,slot)values(?,?,?)");
			pr.setInt(1, mid);
			pr.setInt(2, screen);
			pr.setInt(3, slot);

			int count = pr.executeUpdate();
			dispatcher = request.getRequestDispatcher("schedule.jsp");

			if (count > 0) {
				request.setAttribute("status", "success");
			} else {
				request.setAttribute("status", "failed");
			}
			dispatcher.forward(request, response);

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
