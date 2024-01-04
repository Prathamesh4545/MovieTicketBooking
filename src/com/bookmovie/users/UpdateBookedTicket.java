package com.bookmovie.users;

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

@WebServlet("/updateBookedTicket")
public class UpdateBookedTicket extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int booked = Integer.parseInt(request.getParameter("inputSeat"));
		int id = Integer.parseInt(request.getParameter("id"));
		String email = request.getParameter("email");
		String btn = request.getParameter("btn");

		request.setAttribute("email", email);
		request.setAttribute("booked", booked);
		request.setAttribute("id", id);

		Connection con = null;
		RequestDispatcher dispatcher = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "root8080");
			PreparedStatement preparedStatement = con.prepareStatement("Update show set booked=booked+? where id = ?");

			preparedStatement.setInt(1, booked);
			preparedStatement.setInt(2, id);

			int count = preparedStatement.executeUpdate();
			if (count > 0) {
				if ("Gold".equalsIgnoreCase(btn)) {
					dispatcher = request.getRequestDispatcher("/goldClassServlet");

				} else if ("Silver".equalsIgnoreCase(btn)) {
					dispatcher = request.getRequestDispatcher("/silverClassServlet");

				} else if ("Platinum".equalsIgnoreCase(btn)) {
					dispatcher = request.getRequestDispatcher("/platinumClassServlet");
				}
				dispatcher.forward(request, response);

			} else {
				response.sendRedirect("bookMovie.jsp?id=" + id);
				request.setAttribute("status", "failed");
			}
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
