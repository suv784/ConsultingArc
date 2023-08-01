package com.consulting_Arc.employee.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/employeeLogout")
public class EmployeeLogoutServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		session.removeAttribute("employeeObj");
		session.setAttribute("successMsg", "Consultant Logout Successfully.");
		resp.sendRedirect("consultant_login.jsp");
		session.invalidate();
	}
	
	

}
