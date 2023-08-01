package com.consulting_Arc.employee.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.consulting_Arc.dao.AppointmentDAO;
import com.consulting_Arc.db.DBConnection;
import com.consulting_Arc.email.EmailUtility;
import com.consulting_Arc.entity.Employee;

@WebServlet("/updateStatus")
public class UpdateStatus extends HttpServlet {

	private String host;
	private String port;
	private String user;
	private String pass;

	public void init() {
		// reads SMTP server setting from web.xml file
		ServletContext context = getServletContext();
		host = context.getInitParameter("host");
		port = context.getInitParameter("port");
		user = context.getInitParameter("user");
		pass = context.getInitParameter("pass");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Employee currentLoginEmployee = (Employee) session.getAttribute("employeeObj");

		int id = Integer.parseInt(req.getParameter("userId"));
		System.out.println(id);
		Employee employee = (Employee) session.getAttribute("employeeObj");
		int employeeId = employee.getId();
		System.out.println(employeeId);
		String comment = req.getParameter("comment");
		String name = req.getParameter("fullName");
		String email = req.getParameter("email");
		String emailBodyMsg = null;

		boolean f = false;

		try {
			AppointmentDAO appDAO = new AppointmentDAO(DBConnection.getConn());
			f = appDAO.updateEmpAppointmentCommentStatus(id, employeeId, comment);
			emailBodyMsg = "Congratulations " + name
					+ ", your consulting request has been approved for further information contact your assigned consultant:"
					+ currentLoginEmployee.getFullName();

		} catch (Exception e) {
			e.printStackTrace();
		}
		String message = "Client Management";
		if (f == true) {
			try {
				EmailUtility.sendEmail(host, port, "mohantysuvendu5@gmail.com", "fwjgnpzbfiiqlnxh", email, message,
						emailBodyMsg);

				session.setAttribute("successMsg", "Comment updated");

			} catch (Exception ex) {
				ex.printStackTrace();
				session.setAttribute("errorMsg", "Something went wrong on server!");
			} finally {
				// request.setAttribute("Message", resultMessage);
				resp.sendRedirect("consultant/client.jsp");
			}
		} else {
			session.setAttribute("errorMsg", "Something went wrong on server!");
			resp.sendRedirect("consultant/client.jsp");
		}
	}
}
