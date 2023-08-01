<%@page import="com.consulting_Arc.entity.Employee"%>
<%@page import="com.consulting_Arc.dao.EmployeeDAO"%>
<%@page import="com.consulting_Arc.entity.Consultant"%>
<%@page import="java.util.List"%>
<%@page import="com.consulting_Arc.db.DBConnection"%>
<%@page import="com.consulting_Arc.dao.ConsultantDAO"%>
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
<title>View_Consultant page</title>
<%@include file="../component/allcss.jsp"%>

<!-- customs css for this page -->
<style type="text/css">
.my-card {
	box-shadow: 0px 0px 15px 1px activeborder;
	/*box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.3);*/
} 
body{
background-color:silver;
}
</style>
<!-- end of customs css for this page -->

</head>
<body>
	<%@include file="navbar.jsp"%>


	<div class="container-fluid p-3">
		<div class="row">
			
			<div class="col-md-12">
				<div class="card my-card">
					<div class="card-body">
						<p class="fs-3 text-center text-danger">List of Consultant</p>

						<!-- message print -->
						<!-- for success msg -->
						<c:if test="${not empty successMsg }">
							<p class="text-center text-success fs-3">${successMsg}</p>
							<c:remove var="successMsg" scope="session" />
						</c:if>

						<!-- for error msg -->
						<c:if test="${not empty errorMsg }">
							<p class="text-center text-danger fs-3">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<!-- End of message print -->

						<!-- table for Employee list -->

						<table class="table table-striped">
							<thead>
								<tr class="table-info">
									<!-- <th scope="col">ID</th> -->
									<th scope="col">Full Name</th>
									<th scope="col">DOB</th>
									<th scope="col">Qualification</th>
									<th scope="col">Specialist</th>
									<th scope="col">Email</th>
									<th scope="col">Phone</th>
									<th colspan="2" class="text-center" scope="col">Action</th>
								</tr>
							</thead>
							<tbody>

								<%
								EmployeeDAO empDAO2 = new EmployeeDAO(DBConnection.getConn());
								List<Employee> listOfEmp = empDAO2.getAllEmployee();
								for (Employee employee : listOfEmp) {
								%>
								<tr>
									<%-- <th scope="row"><%= doctorLst.getId()%></th> --%>
									<th><%=employee.getFullName()%></th>
									<td><%=employee.getDateOfBirth()%></td>
									<td><%=employee.getQualification()%></td>
									<td><%=employee.getSpecialist()%></td>
									<td><%=employee.getEmail()%></td>
									<td><%=employee.getPhone()%></td>


									<td><a class="btn btn-sm btn-primary"
										href="edit_consultant.jsp?id=<%=employee.getId()%>">Edit</a></td>
									<td><a class="btn btn-sm btn-danger" href="../deleteEmployee?id=<%= employee.getId() %>">Delete</a></td>



								</tr>
								<%
								}
								%>


							</tbody>
						</table>

						<!-- end table for doctor list -->


					</div>

				</div>
			</div>
		</div>
	</div>









</body>
</html>