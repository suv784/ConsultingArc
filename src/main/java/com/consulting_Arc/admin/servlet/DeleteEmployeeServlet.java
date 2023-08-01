package com.consulting_Arc.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.consulting_Arc.dao.EmployeeDAO;
import com.consulting_Arc.db.DBConnection;

@WebServlet("/deleteEmployee")
public class DeleteEmployeeServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//get id(which is coming as string value) and convert into int	
		int id = Integer.parseInt(req.getParameter("id"));
		
		EmployeeDAO docDAO = new EmployeeDAO(DBConnection.getConn());
		HttpSession session = req.getSession();
		
		boolean f = docDAO.deleteEmployeeById(id);
		
		if(f==true) {
			session.setAttribute("successMsg", "Consultant Deleted Successfully.");
			resp.sendRedirect("admin/view_consultant.jsp");
		}
		else {
			session.setAttribute("errorMsg", "Something went wrong on server!");
			resp.sendRedirect("admin/view_consultant.jsp");
		}
	}
	
	

}
