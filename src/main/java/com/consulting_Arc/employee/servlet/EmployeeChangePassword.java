package com.consulting_Arc.employee.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.consulting_Arc.dao.EmployeeDAO;
import com.consulting_Arc.db.DBConnection;

@WebServlet("/employeeChangePassword")
public class EmployeeChangePassword extends HttpServlet { 

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int employeeId = Integer.parseInt(req.getParameter("employeeId"));
		String newPassword = req.getParameter("newPassword");
		String oldPassword = req.getParameter("oldPassword");

		EmployeeDAO employeeDAO = new EmployeeDAO(DBConnection.getConn());

		HttpSession session = req.getSession();
		
		if (employeeDAO.checkOldPassword(employeeId, oldPassword)) {

			if (employeeDAO.changePassword(employeeId, newPassword)) {
				
				session.setAttribute("successMsg", "Password change successfully.");
				resp.sendRedirect("consultant/edit_profile.jsp");

			} else {
				
				session.setAttribute("errorMsg", "Something went wrong on server!");
				resp.sendRedirect("consultant/edit_profile.jsp");

			}

		} else {
			session.setAttribute("errorMsg", "Old Password not match");
			resp.sendRedirect("consultant/edit_profile.jsp");

		}
	}

}
