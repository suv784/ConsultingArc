<%@page import="com.consulting_Arc.db.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0 ">

<title>Home Page | IT Consulting Portal</title>
<%@include file="component/allcss.jsp"%>


<style type="text/css">
.my-card {
	box-shadow: 0px 0px 15px 1px silver;
	
}

body {
	background-color:silver;
}
.testinomials{
    width: 80%; 
    margin:auto;
    padding-top: 100px; 
    text-align: center;
}
.testinomial-col{
    flex-basis: 44%; 
    border-radius: 10px; 
    margin-bottom: 5%; 
    text-align: left; 
    background: white;
    padding:25px;
    cursor:pointer;
    display:flex;
} 
.testinomial-col img{
    height: 40px; 
    margin-left: 5px; 
    margin-right: 37px; 
    border-radius: 50%;
} 
.testinomial-col p{
    padding:0px;
} 
.testinomial-col h3{
    margin-top: 15px;
    text-align: left;
} 
.testinomial-col.fa{
    color:#f44336;
} 
</style>

</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="3" aria-label="Slide 4"></button>
			
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/image1.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/image2.jpg" class="d-block w-100" alt="..." height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/image3.jpg" class="d-block w-100" alt="..." height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/image4.jpg" class="d-block w-100" alt="..." height="500px">
			</div>
			
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	
	<div class="container p-3" >
		<p class="text-center mt-2 mb-5 fs-2 myP-color">Some key Features
			of our IT Consulting Portal</p>
		<div class="row">
			<!-- 1st col -->
			<div class="col-md-8 p-5">

				<div class="row">
					<div class="col-md-6">
						<div class="card my-card">
							<div class="card-body">
								<p class="fs-5 myP-color">Bring Our clients into the
									conversation</p>
								<p>Good client management requires clear communication
									between you and the companies you work with. Rather than
									chasing down important stakeholders and struggling to keep
									track of client emails, a client portal allows you to have
									those conversations in one place.</p>
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<div class="card my-card">
							<div class="card-body">
								<p class="fs-5 myP-color">Stay notified about client
									activity</p>
								<p>It’s important that you and your team members are
									notified when clients add notes during the recruitment process.
									A running history of all client comments in Zoho Recruit makes
									sure you don’t miss out on important updates.</p>
							</div>
						</div>
					</div>

					<div class="col-md-6 mt-2">
						<div class="card my-card">
							<div class="card-body">
								<p class="fs-5 myP-color">Create role-specific profiles for
									your client’s team</p>
								<p>Clients may have several people who are involved with
									their recruitment process and need access to the client portal.
									For example, John may need access only to the interviews that
									he handles while Amy, your primary client contact, has to
									oversee the entire recruitment process from beginning to end.</p>
							</div>
						</div>
					</div>

					<div class="col-md-6 mt-2">
						<div class="card my-card">
							<div class="card-body">
								<p class="fs-5 myP-color">Provide data summaries at a glance</p>
								<p>Sometimes executives who may not be directly involved
									with the recruitment pipeline still want updates on how their
									talent acquisition efforts are going. With Recruit’s client
									portal, it’s easy to give them a summary of high-level
									information such as jobs in the pipeline, applications that
									haven’t been looked at yet, and interviews that are yet to be
									scheduled.</p>
							</div>
						</div>
					</div>
				</div>


			</div>
			

			<div class="col-md-4 mt-2 mys-card">
				<img class="mt-3" alt="" src="img/image6.jpg" height="550px"
					width="490px">
			</div>

			
		</div>
	</div>
	
	<hr> 
	<section class="testinomials" style="margin-bottom:0px;"> 
        <h1 style="color:#4169E1;">What our Client says</h1> 
        <p style="font-size:larger;">Here are the testinomials of our clients from across the World</p>
        <div class="row" >
            <div class="testinomial-col" style="margin-left:40px;">
                <img src="img/talalwasim.jpg">
                <div>
                    <p>ConsultingArc is the Onestop platform for all Your consulting requirments,it provides 
                    end to end support and consulting to all the required Domain,Employee are really helpful and
                    i have an amzing experience with ConsultingArc.</p>
                    <h3>chandra</h3>
                    <h5>Wipro</h5>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i> 
                    <i class="fa fa-star"></i> 
                    <i class="fa fa-star"></i> 
                    <i class="fa fa-star-o"></i>
                </div>

            </div> 
            <div class="testinomial-col" style="margin-left:40px;">
                <img src="img/soumya.jpg">
                <div>
                    <p>I connect with ConsultingArc for the Cloud Consultant in my project.The consultant is really 
                    tallented and whatever the task i assigned he did very nicesly,i have positive Response with ConsultingArc.</p>
                    <h3>soumya</h3>
                    <h5>Atos Syntel</h5>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i> 
                    <i class="fa fa-star"></i> 
                    <i class="fa fa-star"></i> 
                    <i class="fa fa-star-half-o"></i>
                </div>

            </div>
            <div class="testinomial-col" style="margin-left:42px;">
                <img src="img/tan.jpg">
                <div>
                    <p>All the Employee and staff are really helpful,I have a requirment for java Consultant for my 
                    ongoing project ,they provide me end to end support and perform the task with the assigned time.</p>
                    <h3>Tanamy</h3>
                    <h5>Accenture</h5>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i> 
                    <i class="fa fa-star"></i> 
                    <i class="fa fa-star"></i> 
                    <i class="fa fa-star-half-o"></i>
                </div>
 
            </div>
            <div class="testinomial-col" style="margin-left:50px; ">
                <img src="img/chandra.jpg">
                <div>
                    <p>I recommend every one to use ConsultingArc because it is one of the best IT consulting webportal.They have a group of consulting people that provides endToend Support and good efforts to assigned work</p>
                    <h3>Tarun</h3>
                    <h5>JpMorgan</h5>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i> 
                    <i class="fa fa-star"></i> 
                    <i class="fa fa-star"></i> 
                    <i class="fa fa-star-half-o"></i>
                </div>

            </div>
            

        </div>

    </section>
	<%@include file="component/footer.jsp"%>
	
</body>
</html>