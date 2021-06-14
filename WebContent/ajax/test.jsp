<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Bootstrap core CSS -->
<link href="<%=request.getContextPath()%>/css/bootstrap.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/css/style.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/elusive-webfont.css">
<link href="<%=request.getContextPath()%>/css/animate.css"
	rel="stylesheet">

<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,700,300italic,400italic'
	rel='stylesheet' type='text/css'>

<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/modernizr.custom.js"></script>

<title>Document</title>

<script>
	$(function() {
		$('#saveLoc').click(function() {
			locForm.submit();
		});
	});
</script>
</head>

<body data-spy="scroll" data-offset="0" data-target="#navbar-main">
	<div id="navbar-main">
		<!-- Fixed navbar -->
		<div class="navbar navbar-default navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<i class="el-icon-lines"></i>
					</button>
					<a class="navbar-brand hidden-xs hidden-sm">
						<h1>ACCIDENT BY BICYCLE</h1>
					</a>
				</div>

			</div>
		</div>
	</div>



	<!-- ==== HEADERWRAP ==== -->
	<div id="headerwrap" id="home" name="home">
		<header class="clearfix"style="margin-top:100px;">
			<h1 class="animated bounceIn">Template Stock</h1>
			<p class="animated slideInLeft">Let Us Help You Be Something
				Awesome.</p>
			<p class="animated slideInRight">We Are Here For You.</p>
			<div style="width:300px; display:flex; margin:auto;">
			<form name="locForm" method="post" action="kakako_map.jsp">

				<input type="text" class="form-control" id="loc" name="loc"
					placeholder="Your Name" style="margin-top:6px;"></input>
			</form>
				<p><a  id="saveLoc" class="btn btn-success">검색</a></p>
			</div>
		</header>
	</div>
	<!-- headerwrap -->

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/plugins.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/init.js"></script>
</body>
</html>

<%--
				<select class="btn homebtn smoothScroll" id="loc" name="loc">
					<option value="강남구">강남구</option>
					<option value="강동구">강동구</option>
					<option value="강북구">강북구</option>
					<option value="강서구">강서구</option>
					<option value="관악구">관악구</option>
					<option value="광진구">광진구</option>
					<option value="구로구">구로구</option>
					<option value="금천구">금천구</option>
					<option value="노원구">노원구</option>
					<option value="도봉구">도봉구</option>
					<option value="동대문구">동대문구</option>
					<option value="동작구">동작구</option>
					<option value="마포구">마포구</option>
					<option value="서대문구">서대문구</option>
					<option value="서초구">서초구</option>
					<option value="성동구">성동구</option>
					<option value="성북구">성북구</option>
					<option value="송파구">송파구</option>
					<option value="양천구">양천구</option>
					<option value="영등포구">영등포구</option>
					<option value="용산구">용산구</option>
					<option value="은평구">은평구</option>
					<option value="종로구">종로구</option>
					<option value="중구">중구</option>
					<option value="중랑구">중랑구</option>
				</select>

			<button id="openLP" role="button">레이어팝업</button>
 --%>
