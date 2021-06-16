<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Bootstrap core CSS -->
<link href="<%=request.getContextPath()%>/bicycleAcc/css/bootstrap.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/bicycleAcc/css/style.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/bicycleAcc/css/elusive-webfont.css">
<link href="<%=request.getContextPath()%>/bicycleAcc/css/animate.css"
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

<body data-spy="scroll" data-offset="0" data-target="#navbar-main" style="width:100%;height:100%;">
	<div id="navbar-main">
		<!-- Fixed navbar -->
		<div class="navbar navbar-default navbar-fixed-top">
			<div class="container">
			
				<div class="navbar-header">
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
			<h1 class="animated bounceIn">"타느냐, 죽느냐 그것이 문제로다"</h1>
			<p class="animated slideInLeft">자전거 사고 다발 지역 확인하고</p>
			<p class="animated slideInRight">안전하게 라이딩하세요</p>
			<div style="width:300px; display:flex; margin:auto;">
			<form name="locForm" method="post" action="kakao_map.jsp">
				<input type="text" class="form-control" id="loc" name="loc"
					placeholder="ex) 강남구" style="margin-top:6px;"></input>
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
