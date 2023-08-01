<%@page import="com.consulting_Arc.entity.Employee"%>
<%@page import="com.consulting_Arc.dao.EmployeeDAO"%>
<%@page import="com.consulting_Arc.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.consulting_Arc.db.DBConnection"%>
<%@page import="com.consulting_Arc.dao.AppointmentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- for jstl tag -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- end of jstl tag -->

<%@page isELIgnored="false"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Client Details | Admin</title>

<%@include file="../component/allcss.jsp"%>


<style type="text/css">
.my-card {
	box-shadow: 0px 0px 10px 1px activeborder;
	
}
body{ 
background-color:silver;
}
</style>
<!-- end of customs css for this page -->

</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="col-md-12 p-5">
		<div class="card my-card">
			<div class="card-body">
				<p class="text-center text-danger fs-3">Client Details</p>

				<table class="table table-success table-striped" >
					<thead>
						<tr class="table" >
							<th scope="col" style="padding-right:70px">Full Name</th>
							<th scope="col">Gender</th>
							<th scope="col">Company Name</th>
							<th scope="col">Appointment</th>
							<th scope="col">Email</th>
							<th scope="col">Phone</th>
							<th scope="col" style="padding-right:50px">NeedToConsult</th>
							<th scope="col" style="padding-right:70px">Consultant Name</th>
							<th scope="col">Isuue</th>
							<th scope="col" style="padding-right:100px">Status</th>

						</tr>
					</thead>
					<tbody>
						<%
						AppointmentDAO appDAO = new AppointmentDAO(DBConnection.getConn());
						EmployeeDAO employeeDAO = new EmployeeDAO(DBConnection.getConn());
						List<Appointment> list = appDAO.getAllAppointment();
						for(Appointment appList : list)
						{
							Employee employee =	employeeDAO.getEmployeeById(appList.getEmployeeId());						 							
						%>
						
						<tr>
							<th><%= appList.getFullName() %></th>
							<td><%= appList.getGender() %></td>
							<td><%= appList.getAge() %></td>
							<%-- <td><%= appList.getFullName() %></td> --%>
							<td><%= appList.getAppointmentDate()%></td>
							<td><%= appList.getEmail()%></td>
							<td><%= appList.getPhone()%></td>
							<td><%= appList.getNeedToConsult()%></td>
							<td><%= employee.getFullName()%></td>
							<td><%= appList.getAddress()%></td>
							<td><%= appList.getStatus()%></td>

						</tr>
						
						
						<%
						}
						%>

						 
					</tbody>

				</table>

			</div>


		</div>

	</div>




</body>
</html>