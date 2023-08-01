<%@page import="com.consulting_Arc.entity.Appointment"%>
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
<title>Sending Email</title>
<%@include file="../component/allcss.jsp"%>


<!-- customs css for this page -->
<style type="text/css">
.my-card {
	box-shadow: 0px 0px 10px 1px activeborder;
	
}

/* backgournd image css */
.my-bg-img {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("../img/hospital1.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
<!-- end of customs css for this page -->

</head>
<body>

	<%@include file="navbar.jsp"%>

	<c:if test="${empty employeeObj }">

		<c:redirect url="../consultant_login.jsp"></c:redirect>

	</c:if>

	<!-- check consultant is login or not -->


	<!-- start 1st Div -->

	<div class="container-fluid my-bg-img p-5">
		<!-- css background image -->
		<p class="text-center fs-2 text-white"></p>

	</div>

	<!-- end of 1st Div -->


	<!-- 2nd Div -->

	<div class="container p-3">
		<p class="fs-2"></p>

		<div class="row">



			<!-- col-2 -->
			<div class="col-md-6 offset-md-3">
				<div class="card my-card">
					<div class="card-body">
						<p class="text-center fs-3">Email Confirmation</p>

						

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


						<%
						/* get or receive appointment id which is coming through url (from client.jsp page) */
						int id = Integer.parseInt(request.getParameter("id"));
						AppointmentDAO appDAO = new AppointmentDAO(DBConnection.getConn());
						Appointment appointment = appDAO.getAppointmentById(id);
						
						%>
						
						
						
						<!-- boostrap form -->
						<form class="row g-3" action="../updateStatus" method="post">

							<!-- take user Id in hidden field -->
							<input type="hidden" name="userId" readonly value="<%= appointment.getId() %>">

							<div class="col-md-6">
								<label class="form-label">Full Name</label> <input
									name="fullName" type="text" placeholder="Enter full name"
									class="form-control" readonly value="<%= appointment.getFullName()%>">

							</div>

							<div class="col-md-6">
								<label class="form-label">CompanyName</label> <input name="age"
									type="text" placeholder="Enter your Age" class="form-control"
									readonly value="<%= appointment.getAge()%>">
							</div>

							<div class="col-md-6">
								<label class="form-label">Phone</label> <input name="phone"
									type="number" maxlength="11" placeholder="Enter Mobile no."
									class="form-control" readonly value="<%= appointment.getPhone()%>">
							</div>
							
							<div class="col-md-6">
								<label class="form-label">Email</label> <input name="email"
									type="text" maxlength="30" placeholder="Enter Email no."
									class="form-control" readonly value="<%= appointment.getEmail()%>">
							</div>

							<div class="col-md-6">
								<label class="form-label">NeedToConsult</label> <input
									name="diseases" type="text" placeholder="Enter diseases"
									class="form-control" readonly value="<%= appointment.getNeedToConsult()%>">
							</div>



							<div class="col-md-12">
								<label class="form-label">Leave Your Status</label>
								<textarea name="comment" placeholder="Leave a comment"
									class="form-control" rows="" cols=""></textarea>
							</div>

							<!-- which appointment's comment is it / comment Id -->
							<input type="hidden" name="id" value="<%= appointment.getId()%>" class="form-control">

							<!-- which Consultant give a comment / consultant Id -->
							<input type="hidden" name="doctorId" value="<%= appointment.getEmployeeId()%>" class="form-control">



							<div class="col-md-12">
								<button type="submit" class="btn btn-success col-md-12" style="background-color: teal;">Submit</button>
							</div>


						</form>

						<!-- end of boostrap form -->

					</div>
				</div>

			</div>

		</div>


	</div>

	<!-- 2nd Div -->

</body>
</html>