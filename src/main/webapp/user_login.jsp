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
<title>User Login</title>
<%@include file="component/allcss.jsp"%>


<style type="text/css">
.my-card {
	box-shadow: 0px 0px 15px 1px activeborder;
	
}

body {
	background-color: silver;
}
</style>
<!-- end of customs css for this page -->

</head>
<body>
	<!-- navbar -->
	<%@include file="component/navbar.jsp"%>
	<!-- end navbar -->



	<!-- <h1>User Login</h1> -->

	<!-- User Login -->
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card my-card">
					<div class="card-header text-center text-white my-bg-color"
						style="background-color:teal;">
						<!-- <p class="fs-4 text-center mt-1"><i class="fa-solid fa-users"></i> <br>User Login</p> -->
						<p class="fs-4 text-center text-white mt-2"
							style="background-color: silver; margin-left: 60px; margin-right: 60px; border-radius: 20px;">
							<i class="fa fa-group"></i> User Login
						</p>
					</div>

					<div class="card-body">
						<!-- <p class="fs-4 text-center">User Login</p> -->

						<!-- for message -->
						<!-- success message -->
						<c:if test="${not empty successMsg }">
							<p class="text-center text-success fs-5">${successMsg}</p>
							<c:remove var="successMsg" scope="session" />
						</c:if>

						<!-- error message -->
						<c:if test="${not empty errorMsg }">
							<p class="text-center text-danger fs-5">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<!-- end of message -->



						<!-- boostrap form -->
						<form action="userLogin" method="post">
							<div class="mb-3">
								<label class="form-label">Email address</label> <input
									name="email" type="email" placeholder="Enter Email"
									class="form-control">
								<div id="emailHelp" class="form-text" style="color: red;">Do
									not worry Your email is safe with us.</div>
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input
									name="password" type="password"
									pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"
									required
									title="Minimum eight characters, at least one upper case" placeholder="Enter password"
									class="form-control">
							</div>

							<button type="submit"
								class="btn col-md-12 text-white my-bg-color"
								style="background-color:teal; border-radius: 100px;">Submit</button>
						</form>
						<br>Don't have an account? <a href="signup.jsp"
							class="text-decoration-none"
							style="border: 2px solid red; border-radius: 20px; background-color: red; padding-top: -2px;">create
							one</a>
						<!-- end of boostrap form -->
					</div>
					<!-- </div> -->
				</div>
			</div>
		</div>
	</div>
	<!-- End of User Login -->


	<!-- footer -->
	<%@include file="component/footer.jsp"%>
	<!-- end footer -->




</body>
</html>