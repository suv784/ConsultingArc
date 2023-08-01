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
import com.consulting_Arc.entity.Employee;

@WebServlet("/employeeEditProfile")
public class EmployeeEditProfileServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			// get all data which is coming from doctor.jsp doctor details
			String fullName = req.getParameter("fullName");
			String dateOfBirth = req.getParameter("dateOfBirth");
			String qualification = req.getParameter("qualification");
			String specialist = req.getParameter("specialist");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			//String password = req.getParameter("password");

			
			int id = Integer.parseInt(req.getParameter("employeeId"));

			Employee employee = new Employee(id, fullName, dateOfBirth, qualification, specialist, email, phone, "");

			EmployeeDAO empDAO = new EmployeeDAO(DBConnection.getConn());

			boolean f = empDAO.editEmployeeProfile(employee);

			HttpSession session = req.getSession();

			if (f == true) {
				Employee updateEmployeeObj = empDAO.getEmployeeById(id);
				session.setAttribute("successMsgForD", "Employee update Successfully");
				session.setAttribute("employeeObj", updateEmployeeObj); // over ride or update old session value to new updated doctor value.
				resp.sendRedirect("consultant/edit_profile.jsp");

			} else {
				session.setAttribute("errorMsgForD", "Something went wrong on server!");
				resp.sendRedirect("consultant/edit_profile.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
