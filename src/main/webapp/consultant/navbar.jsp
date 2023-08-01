
<!-- for jstl tag -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- end of jstl tag -->

<%@page isELIgnored="false"%>


<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"><i
			class="fa-sharp fa-solid fa-computer"></i>ConsultingArc</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index.jsp"><i class="fa fa-home"></i> 
						HOME</a></li>

				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="client.jsp"><i class="fa-solid fa-users-rectangle"></i> CLIENT</a></li>
			</ul>

			<div class="dropdown">
				<button class="btn btn-outline-light dropdown-toggle" type="button"
					id="dropdownMenuButton1" data-bs-toggle="dropdown"
					aria-expanded="false">
					<i class="fa-solid fa-user-tie fa-1x" style="color:red;"></i>${ employeeObj.fullName}
				</button>
				<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
					<li><a class="dropdown-item" href="edit_profile.jsp">Edit
							Profile</a></li>
					<li><a class="dropdown-item" href="../employeeLogout">Logout</a></li>

				</ul>
			</div>


		</div>
	</div>
</nav>