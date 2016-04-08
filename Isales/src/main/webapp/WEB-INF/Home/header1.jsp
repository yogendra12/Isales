<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Neighbourhood Platform</title>
<style type="text/css">
div#spinner
{
    display: none;
    width:100px;
    height: 100px;
    position: fixed;
    top: 50%;
    left: 50%;
/*     background:url(images/spinner.gif) no-repeat center #fff; */
    text-align:center;
    padding:10px;
    font:normal 16px Tahoma, Geneva, sans-serif;
    border:1px solid #666;
    margin-left: -50px;
    margin-top: -50px;
    z-index:2;
    overflow: auto;
}
</style>
<script type="text/javascript">
var spinnerVisible = false;
function showProgress() {
        $("#spinner").show();
};
function hideProgress() {
        $("#spinner").hide();
};
</script>
<!-- SET: FAVICON -->
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico">
<!-- END: FAVICON -->

<!-- SET: STYLESHEET -->
<c:set var="adminRoleId" value="R0001"></c:set>
<c:set var="clientadminRoleId" value="R0002"></c:set>
<c:set var="supRoleId" value="R0003"></c:set>
<c:set var="salesRoleId" value="R0004"></c:set>
<%-- <c:if test="${cacheClienInfoBean.role == adminRoleId }">
	<c:set var="theme"	value="eSalesData/${cacheClientInfoBean.clientId }/Theme.css"></c:set>
	</c:if> --%>


<link rel="stylesheet" href="Branding/Theme.css" type="text/css" media="all" />
<!-- END: STYLESHEET -->
<link rel="stylesheet" href="Branding/js/jqueryui.css" />
<link rel="stylesheet" href="Branding/css/jquery-ui.css" />
<link rel="stylesheet" href="Branding/css/Jquery.css" />
<link rel="stylesheet"
	href="Branding/js/jquery-ui-1.10.3/themes/base/jquery-ui.css" />
<script src="Branding/js/jquery-1.7.2.js"></script>
<script src="Branding/js/jquery-ui.js"></script>
<script src="Branding/js/Jquery.js" type="text/javascript"></script>
<script src="Branding/js/jPages.min.js" type="text/javascript"></script>
<script src="Branding/js/custompagination.js" type="text/javascript"></script>
<script type="text/javascript" src="Branding/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="Branding/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="Branding/js/MntValidator.js"></script>
<link rel="stylesheet" href="Branding/css/chosen.css" />
<script src="Branding/js/chosen.jquery.js" type="text/javascript"></script>
<script src="Branding/js/jquery.alerts.js" type="text/javascript"></script>
<link href="Branding/css/jquery.alerts.css" rel="stylesheet" type="text/css"
	media="screen" />
<link rel="stylesheet" href="Branding/css/commoncss.css" />
 <script type="text/javascript" src="js/jqueryblockui.js"></script>
<!--[if lt IE 9]>
	<script src="js/html5.js"></script>
<![endif]-->
<script type="text/javascript">
	function salesUploadConfirm(id) {
		var download = confirm("Do you want to sales upload?");
		if (!download) {
			return;
			$("#" + id).attr("href", "#");
		} else {
			$("#" + id).attr("href", "salesUpload.htm");
		}
	}

	function stockUploadConfirm(id) {
		var download = confirm("Do you want to stock upload?");
		if (!download) {
			return;
			$("#" + id).attr("href", "#");
		} else {
			$("#" + id).attr("href", "DbBackUphome.htm");
		}
	}
</script>
</head>
<body>
	<!-- SET: WRAPPER -->
	<div class="wrapper">
		<!-- SET: CONTAINER -->
		<div class="container">
			<!-- SET: HEADER -->

			<header id="header">

				 <%
					HttpSession sess = request.getSession(false);
					if (sess.getAttribute("cacheUserBean") == null) {
						RequestDispatcher dispatcher = request
								.getRequestDispatcher(".././pages/login.jsp");
						dispatcher.forward(request, response);
					}
				%> 
				<div class="header-top">
					<h1 id="logo">
						<a href="#"><img src="Branding/Brand/logo.png" class="logo-center"
							hspace="20" alt=""></a>
					</h1>

					<span
						class="cnamelog">Logged as:</span><span class="cnameloginrole"><c:out
							value="${sessionScope.cacheUserBean.userName}"></c:out></span>
					<ul class="list-header-right">
						<li><a href="logout.htm">Logout</a></li>

						<li><strong>Welcome Back</strong> <br> <c:out
								value="${cacheUserBean.userName}"></c:out> </li>
						<li><strong>Address</strong><br> <c:out
								value="${cacheClientInfoBean.address}" /></li>
					</ul>
				</div>
					
				<nav>
				<c:set var="adm" value="admin"></c:set>
				
				<ul>
				<c:if test="${ empty sessionScope.partnerId}">
				<c:if test="${cacheUserBean.userName eq adm}">
				<li><a href="#">Admin</a>
				<ul>
						<li><a class="<c:out value="${catActive}"/>"	href="catHome.htm" ><span>Categories</span></a></li>
						<li><a class="<c:out value="${serActive}"/>"	href="serviceHome.htm" ><span>service</span></a></li>
						<%-- <li><a class="<c:out value="${expActive}"/>"	href="ExperienceHome.htm" ><span>Experience</span></a></li> --%>
						<li><a class="<c:out value="${venActive}"/>"	href="vendorHome.htm" ><span>Vendor Registration</span></a></li>
						<li><a class="<c:out value="${statusActive}"/>"	href="statusHome.htm" ><span>Status</span></a></li>
						<li><a class="<c:out value="${packageActive}"/>"	href="packageHome.htm" ><span>Packages</span></a></li>
						<li><a class="<c:out value="${packageActive}"/>"	href="adminBooking.htm" ><span>Order Booking</span></a></li>
						<li><a class="<c:out value="${packageActive}"/>"	href="locaHome.htm" ><span>Location</span></a></li>
						<li><a class="<c:out value="${packageActive}"/>"	href="vendorLocationHome.htm" ><span>Vendor Location</span></a></li>
						<li><a class="<c:out value="${partnerLogin}"/>"	href="partnerReg.htm" ><span>Partner Registration</span></a></li>
				</ul>	
				<li><a class="<c:out value="${pathologyOrderActive}"/>" href="adminOrderHome.htm" ><span>Admin Order</span></a></li>
				
				<li><a class="<c:out value="${NewOrderActive}"/>" href="newadminHome.htm" ><span>Admin Order</span></a></li>		
				</c:if>	
				</c:if>
				<li><li><a href="#">Coupons</a>
				<ul>
				<c:if test="${ empty sessionScope.partnerId}">
					<li><a class="<c:out value="${couponAcitve}"/>"	href="couponHome.htm" ><span>Coupon Code</span></a></li>
					</c:if>
					<li><a class="<c:out value="${coActive}"/>"	href="coHome.htm" ><span>Partner Coupons</span></a></li>
				</ul>
				</li>
				 
				</ul>
				
				
				</nav>
			</header>
			
			<div id="page-title">
				

				<ul class="page-title-left">
					<!--  <span class="homeicon">&nbsp;</span> -->
					<li>&nbsp;Home</li>
					<li>/</li>
					<li><c:out value="${tabName}" /></li>
				</ul>
				<p class="marquee-scorll">
					<marquee behavior="scroll" direction="left"
						onmouseover="this.stop();" onmouseout="this.start();"></marquee>
				</p>
			</div>

			<!-- END: CONTAINER -->

		</div>
	</div>
	<!-- END: WRAPPER -->

<div id="spinner">
        Loading...
    </div>
    
</body>
</html>
