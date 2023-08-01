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
<title>Admin Login</title>

<!-- boostrap css -->
<%@include file="component/allcss.jsp"%>
<!-- end of boostrap css -->

<!-- customs css for this page -->
<style type="text/css">
.my-card {
	box-shadow: 0px 0px 15px 1px activeborder;
	/*box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.3);*/
}
body {
	background-color:silver;
}
</style>
<!-- end of customs css for this page -->


</head>
<body>
	<!-- navbar -->
	<%@include file="component/navbar.jsp"%>
	<!-- end navbar -->
	<!-- <h1>Admin Login</h1> -->


	<!-- Admin Login -->
	<div class="container p-5" >
		<div class="row" >
			<div class="col-md-4 offset-md-4" >
				<div class="card my-card">
					<div class="card-header text-center text-white my-bg-color" style="background-color:teal;" >
						<!-- <p class="fs-4 text-center mt-1"><i class="fa-solid fa-users"></i> <br>User Login</p> -->
						<p class="fs-4 text-center text-white mt-2" style="background-color:silver; border-radius:20px;margin-left: 60px; margin-right: 60px;">
							<i class="fa fa-universal-access"></i> Admin Login
						</p>
					</div>
					<div class="card-body">
						<!-- <p class="fs-4 text-center">Admin Login</p> -->

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


						<!-- boostrap form -->
						<form action="adminLogin" method="post">
							<div class="mb-3">
								<label class="form-label">Email address</label> <input
									name="email" type="email" placeholder="Enter Email"
									class="form-control">
								<div id="emailHelp" class="form-text" style="color: red;">Do not worry your email is save with us</div>
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input
									name="password" type="password"  placeholder="Enter password" 
									class="form-control">
							</div>

							<button type="submit"
								class="btn my-bg-color text-white col-md-12" style="background-color:teal;border-radius:80px; ">Submit</button>
						</form>
						<!-- end of boostrap form -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End of Admin Login -->


<!-- footer -->
	<%@include file="component/footer.jsp"%>
	<!-- end footer -->

</body>
</html>