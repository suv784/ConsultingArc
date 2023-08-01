<%@page import="com.consulting_Arc.entity.Employee"%>
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
<title>Index Page | Consultant</title>
<%@include file="../component/allcss.jsp"%>

<!-- customs css for this page -->
<style type="text/css">
.my-card {
	box-shadow: 0px 0px 15px 1px activeborder;
	
}
body{
background-color:silver;
}

</style>



</head>
<body>
	<%@include file="navbar.jsp"%>


	<!-- check is Consultant is login or not if login then only he can access Consultant dashboard -->
	<!-- otherwise redirect him to Consultant login page for log in -->
	<!-- if "employeeObj" is empty means no one is login. -->

	<c:if test="${empty employeeObj }">

		<c:redirect url="../consultant_login.jsp"></c:redirect>

	</c:if>

	<!-- check is Consultant is login or not -->


	<div class="container p-5">
		<p class="text-center text-danger fs-3">Consultant DashBoard</p>

		<%
		
		
		EmployeeDAO empDAO = new EmployeeDAO(DBConnection.getConn());
		int totalNumberOfConsultant = empDAO.countTotalEmployee();
		
		
		Employee currentLoginEmployee = (Employee)session.getAttribute("employeeObj");		
		
		%>

		<div class="row">
			<div class="col-md-4 offset-md-2">
				<div class="card my-card">
					<div class="card-body text-center text-success">
						<i class="fa-solid fa-user-tie fa-3x" style="color: #1f4751;"></i><br>
						<p class="fs-4 text-center">
							Consultant <br><%= totalNumberOfConsultant %>
						</p>
					</div>
				</div>

			</div>

			<div class="col-md-4">
				<div class="card my-card">
					<div class="card-body text-center text-success">
						<i class="fa-solid fa-calendar-check fa-3x" style="color: #1f4751;"></i><br>
						<p class="fs-4 text-center">
							Total Appointment <br> <%= empDAO.countTotalAppointmentByEmployeeId(currentLoginEmployee.getId()) %>
						</p>
					</div>
				</div>

			</div>
		</div>


	</div>




</body>
</html>