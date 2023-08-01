package com.consulting_Arc.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.consulting_Arc.dao.AppointmentDAO;
import com.consulting_Arc.db.DBConnection;
import com.consulting_Arc.entity.Appointment;

@WebServlet("/addAppointment")
public class AppointmentServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	int userId	= Integer.parseInt(req.getParameter("userId"));
	String fullName = req.getParameter("fullName");
	String gender = req.getParameter("gender");
	String age = req.getParameter("company");
	String appointmentDate = req.getParameter("appointmentDate");
	
	String email = req.getParameter("email");
	String phone = req.getParameter("phone");
	String needToConsult = req.getParameter("needToConsult");
	int employeeId = Integer.parseInt(req.getParameter("employeeNameSelect"));
	String address = req.getParameter("issue");
	
	
	Appointment appointment = new Appointment(userId, fullName, gender, age, appointmentDate, email, phone, needToConsult, employeeId, address, "Pending");
	
	AppointmentDAO appointmentDAO = new AppointmentDAO(DBConnection.getConn());
	boolean f = appointmentDAO.addAppointment(appointment);
	
	//get session
	HttpSession session = req.getSession();
	
	if(f==true) {
		
		session.setAttribute("successMsg", "Appointment is recorded Successfully.");
		resp.sendRedirect("user_appointment.jsp");
		
		
	}
	else {
		
		session.setAttribute("errorMsg", "Something went wrong on server!");
		resp.sendRedirect("user_appointment.jsp");
		
	}
	
	
	
	
		
	}

	
}
