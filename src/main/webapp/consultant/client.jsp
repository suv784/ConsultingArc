<%@page import="com.consulting_Arc.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.consulting_Arc.entity.Employee"%>
<%@page import="com.consulting_Arc.dao.AppointmentDAO"%>
<%@page import="com.consulting_Arc.db.DBConnection"%>
<%@page import="com.consulting_Arc.dao.EmployeeDAO"%>
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
<title>Client Page</title>


<%@include file="../component/allcss.jsp"%>


<
<style type="text/css">
.my-card {
	box-shadow: 0px 0px 10px 1px activeborder;
	/*box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.3);*/
}
</style>



</head>
<body>
	<%@include file="navbar.jsp"%>

	<!-- if "employeeObj" is empty means no one is login. -->

	<c:if test="${empty employeeObj }">

		<c:redirect url="../consultant_login.jsp"></c:redirect>

	</c:if>

	<!-- check is Consultant is login or not -->


	<div class="container p-3">
		<div class="row">
			<div class="col-md-12">
				<div class="card my-card">
					<div class="card-body">
						<p class="text-center text-danger fs-3">Client Details</p>

						<!-- message print -->
						<!-- for success msg -->
						<c:if test="${not empty successMsg }">
							<p class="text-center text-success fs-5">${successMsg}</p>
							<c:remove var="successMsg" scope="session" />
						</c:if>

						<!-- for error msg -->
						<c:if test="${not empty errorMsg }">
							<p class="text-center text-danger fs-5">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<!-- End of message print -->

						<!-- table for Client list -->

						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col" style="padding-right: 100px">Full Name</th>
									<th scope="col">User Id</th>
									<th scope="col">Gender</th>
									<th scope="col">Company</th>
									<th scope="col">Appointment Date</th>
									<th scope="col">Client Email</th>
									<th scope="col">Phone</th>
									<th scope="col">NeedConsultant</th>
									<th scope="col">Status</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>

								<%
								Employee employee = (Employee) session.getAttribute("employeeObj");
														
														
														AppointmentDAO appDAO = new AppointmentDAO(DBConnection.getConn());
														List<Appointment> list = appDAO.getAllAppointmentByLoginEmployee(employee.getId());
														for (Appointment applist : list) {
								%>

								<tr>
									<th><%=applist.getFullName()%></th>
									<th><%=applist.getId()%></th>
									<td><%=applist.getGender()%></td>
									<td><%=applist.getAge()%></td>
									<td><%=applist.getAppointmentDate()%></td>
									<td><%=applist.getEmail()%></td>
									<td><%=applist.getPhone()%></td>
									<td><%=applist.getNeedToConsult()%></td>
									<td><%=applist.getStatus()%></td>

									<td>
										<%
										if ("Pending".equals(applist.getStatus())) {
										%> <a href="comment.jsp?id=<%=applist.getId()%>"
										class="btn btn-success btn-sm">Status</a> 
										<%
 										} else {
 										%> 
 										 <a href="#!" class="btn btn-success btn-sm disabled"><i
											class="fa fa-comment"></i>Status</a>
											 
										<%
 										}
 										%>


									</td>
									
								</tr>



								<%
								}
								%>


							</tbody>
						</table>

						



					</div>
				</div>
			</div>

		</div>

	</div>

</body>
</html>