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
<title>Admin page</title>
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

	<!-- adminObj session maintain if "adminObj" empty than go and login first...-->
	<!-- no one can access admin dashboard without login as admin-->
	<c:if test="${empty adminObj }">
		<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>




 <p style="color:red; text-align: center; font-size:30px;">ADMIN DASHBOARD</p> 

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

		<!-- create connection with db and others -->
		<% 
		EmployeeDAO empDAO = new EmployeeDAO(DBConnection.getConn());
		int totalNumberOfEmployee = empDAO.countTotalEmployee();
		int totalNumberOfUser = empDAO.countTotalUser();
		int totalNumberOfAppointment = empDAO.countTotalAppointment();
		int totalNumberOfSpecialist = empDAO.countTotalSpecialist();
		%>

		<!-- row-1 -->
		<div class="row">
			<div class="col-md-4">
				<div class="card my-card">
					<div class="card-body text-center text-dark">
						<i class="fa-sharp fa-regular fa-address-card fa-3x" style="color: #1f4751;"></i><br>
						<p class="fs-4 text-center">
							Employee <br><%= totalNumberOfEmployee %>

						</p>
					</div>
				</div>

			</div>
			<div class="col-md-4">
				<div class="card my-card">
					<div class="card-body text-center text-dark">
						<i class="fas fa-user-circle fa-3x" style="color: #1f4751;"></i><br>
						<p class="fs-4 text-center">
							User<br><%= totalNumberOfUser %>
						</p>
					</div>
				</div>

			</div>
			<div class="col-md-4" >
				<div class="card my-card">
					<div class="card-body text-center text-dark">
						<i class="fa-solid fa-calendar-check fa-3x" style="color: #1f4751;"></i><br>
						<p class="fs-4 text-center">
							Total Appointment <br><%= totalNumberOfAppointment %>
						</p>
					</div>
				</div>

			</div>
			<div class="col-md-4 mt-2">
				<div class="card my-card" data-bs-toggle="modal"
					data-bs-target="#exampleModal">
					<div class="card-body text-center text-dark">
					<i class="fa-solid fa-user-tie fa-3x" style="color: #1f4751;"></i><br>
						<p class="fs-4 text-center">
							Consultant <br><%= totalNumberOfSpecialist %>
						</p>
					</div>
				</div>

			</div>  
			<!--  <div class="col-md-4 mt-2">
				<div class="card my-card" data-bs-toggle="modal"
					data-bs-target="#exampleModal">
					<div class="card-body text-center text-danger">
						<i class="fa-solid fa-user-doctor fa-3x"></i><br>
						<p class="fs-4 text-center">
							Admin_Setting <br>
						</p>
					</div>
				</div>

			</div> -->

			
		</div>


	</div>



	<!-- specialis modal -->



	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title text-danger" id="exampleModalLabel">Add Consultant</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<form action="../addSpecialist" method="post">

						<div class="form-group">
							<label class="form-label">Enter the Branch of Consulting</label> <input type="text"
								name="specialistName" placeholder="Enter the domain" class="form-control" />
						</div>
						<div class="text-center mt-2">
							<button type="submit" class="btn btn-outline-dark ">Add</button>
						</div>

					</form>



				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>

	<!-- end of specialis modal -->





</body>
</html>