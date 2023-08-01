package com.consulting_Arc.employee.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.consulting_Arc.dao.EmployeeDAO;
import com.consulting_Arc.dao.UserDAO;
import com.consulting_Arc.db.DBConnection;
import com.consulting_Arc.entity.Employee;


@WebServlet("/employeelogin")
public class EmployeeLoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//get email and password which is coming from doctor_login.jsp page
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		//create session
		HttpSession session = req.getSession();

		//create DB connection
		EmployeeDAO empDAO = new EmployeeDAO(DBConnection.getConn());
		
		//call loginDoctor() method for doctor login which method declared in DoctorDAO 
		Employee employee = empDAO.loginEmployee(email, password);

		if (employee != null) {
			//means doctor is valid or exist
			//then store particular logged in doctor object in session
			session.setAttribute("employeeObj", employee);
			//and redirect the particular doctor index page which is reside doctor folder
			resp.sendRedirect("consultant/index.jsp");//doctor index means dashboard of consultant
		} else {
			session.setAttribute("errorMsg", "Invalid email or password");
			resp.sendRedirect("consultant_login.jsp");
		}
	}

}
