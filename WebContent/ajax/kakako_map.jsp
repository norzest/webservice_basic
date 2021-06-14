<%@ page pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String loc = request.getParameter("loc");
	if (loc == "") { loc = "강남구"; }
	
	String[] locArr = {
   			"강남구", "강동구", "강북구", "강서구",
   			"관악구", "광진구", "구로구", "금천구",
   			"노원구", "도봉구", "동대문구", "동작구",
   			"마포구", "서대문구", "서초구", "성동구", 
   			"성북구", "송파구", "양천구", "영등포구",
   			"용산구", "은평구", "종로구", "중랑구"};
	
	double[][] laloArr = {
   			{37.4959854, 127.0664091}, {37.5492077, 127.1464824},
   			{37.6469954, 127.0147158}, {37.5657617, 126.8226561},
   			{37.4653993, 126.9438071}, {37.5481445, 127.0857528},
   			{37.4954856, 126.858121}, {37.4600969, 126.9001546},
   			{37.655264, 127.0771201}, {37.6658609, 127.0317674},
   			{37.5838012, 127.0507003}, {37.4965037, 126.9443073},
   			{37.5622906, 126.9087803}, {37.5820369, 126.9356665},
   			{37.4769528, 127.0378103}, {37.5506753, 127.0409622},
   			{37.606991, 127.0232185}, {37.5048534, 127.1144822},
   			{37.5270616, 126.8561534}, {37.520641, 126.9139242},
   			{37.5311008, 126.9810742}, {37.6176125, 126.9227004},
   			{37.5990998, 126.9861493}, {37.5953795, 127.0939669} 	
	};
	
	double laa = 37.56779723637487;
	double loo = 126.98248790767876;
	int level = 8;
	
	for(int i = 0; i < locArr.length; ++i) {
		if(locArr[i].equals(loc)) {
			laa = laloArr[i][0];
			loo = laloArr[i][1];
			level = 5;
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>

<script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=daa5ceef8e2d3962bdb57f5aa30c0356"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=daa5ceef8e2d3962bdb57f5aa30c0356&libraries=LIBRARY"></script>
<script type="text/javascript"
	src="http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst
	?serviceKey=BhPAjgZlO9Dmp6n8gIBEIy9FvRhjM7ftFPr1Ue%2FEUZ84r9Onu%2BhXUcamJrZ0a9cxAfHBIOvRbntRMdgRUhzDjA%3D%3D&numOfRows=10&pageNo=1
	&base_date=20210607&base_time=1100&nx=60&ny=127"></script>

<%------------------ style start ------------------%>
<%------------------ style start ------------------%>
<style>
	html, body {
		margin:0;
		height:100%;
	}
	
	.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>
<%------------------ style end ------------------%>
<%------------------ style end ------------------%>
</head>
<body>
	<div id="map" style="width: 90%; height: 100%;"></div>
	
	<script>
		var markers = [];
		var imageSrc = 'https://image.flaticon.com/icons/png/512/130/130151.png';

		let content = '<div class="wrap">' + 
	    '    <div class="info">' + 
	    '        <div class="title">' + 
	    '            타이틀' + 
	    '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	    '        </div>' + 
	    '        <div class="body">' + 
	    '            <div class="ellipsis">좌표</div>' + 
	    '            <div class="jibun ellipsis">사고 횟수</div>' +  
	    '        </div>' + 
	    '    </div>' +    
	    '</div>';

	    // 마커 위에 커스텀오버레이를 표시합니다
		var overlay = new kakao.maps.CustomOverlay({
		    content: content,
		    map: null,
		    position: null
		});
	    
		<%------------------ function start ------------------%>
		<%------------------ function start ------------------%>

	    // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
		function closeOverlay() {
		    overlay.setMap(null);     
		}
	    
	    function setOverlayContent(marker,cntArr) {
	    	var temp  = marker.getTitle();
	    	
			content = '<div class="wrap">' + 
		    '    <div class="info">' + 
		    '        <div class="title">' + 
		    			temp.substring(0, temp.indexOf("(")) + 
		    '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
		    '        </div>' + 
		    '        <div class="body" style="padding:5px;">' + 
		    '            <div class="ellipsis">' + temp.substring(temp.indexOf("(")+1, temp.length-1) + '</div>' + 
		    '            <div class="jibun ellipsis">발생건수: ' + cntArr[0] + '</div>' +  
		    '            <div class="jibun ellipsis">사상자:' + cntArr[1] + '   사망자: ' + cntArr[2] + '</div>' +  
		    '            <div class="jibun ellipsis">중상자:' + cntArr[3] + '   경상자: ' + cntArr[4] + '</div>' +  
		    '        </div>' + 
		    '    </div>' +    
		    '</div>';
		    overlay.setContent(content);
	    }

		// 지도에 마커를 생성하고 표시한다
		function displayMarker(positions, cntArr) {	
			var markerSize = (11-<%=level%>)*10;
			var markerImage = new kakao.maps.MarkerImage(imageSrc,
					new kakao.maps.Size(markerSize, markerSize),
					{offset: new kakao.maps.Point(markerSize/2, markerSize/2)});

			var marker = new kakao.maps.Marker({
				image : markerImage,
				position : positions.lating, // 마커의 좌표
				title : positions.title, // 마커의 타이틀
				map : map
			});

			// 마커를 클릭했을 때 이벤트입니다.
			kakao.maps.event.addListener(marker, 'click', function() {
				setOverlayContent(marker, cntArr);
				overlay.setPosition(marker.getPosition());
				overlay.setMap(map);
			});

			markers.push(marker);
		}
		
		
		// 지도에 표시할 원을 생성합니다
		function displayCircle(la, lo) {
			var circle = new kakao.maps.Circle({
				center : new kakao.maps.LatLng(la, lo), // 원의 중심좌표 입니다 
				radius : 100, // 미터 단위의 원의 반지름입니다 
				strokeWeight : 0, // 선의 두께입니다 
				strokeColor : '#FF5500', // 선의 색깔입니다
				strokeOpacity : 0, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
				strokeStyle : 'dashed', // 선의 스타일 입니다
				fillColor : '#FF5500', // 채우기 색깔입니다
				fillOpacity : 0.5
			// 채우기 불투명도 입니다   
			});

			// 지도에 원을 표시합니다 
			circle.setMap(map);			
		}
		

		// 지도가 확대 또는 축소되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
		function changeMarkerImage() {				
			// 지도의 현재 레벨을 얻어옵니다
			var mapLevel = map.getLevel();
			var markerSize = (11-mapLevel)*10;
			if (markerSize < 0) {
				markerSize = 0;
			}
			var set_markerI = new kakao.maps.MarkerImage(imageSrc,
					new kakao.maps.Size(markerSize, markerSize),
					{offset: new kakao.maps.Point(markerSize/2, markerSize/2)}); 

			
			for (var i = 0; i < markers.length; i++) {
				markers[i].setImage(set_markerI);
			}
			
		};
		
		function getBicycleAcc(location) {
			$.ajax({
				url : 'testXML/' + location + '.xml',
				dataType : 'xml',
				error : function() {
					alert('error')
				},
				success : function(data) {

					let xml = $(data).find("item").each(function() {
						let afos_id = $(this).find("afos_id").text();
						let spotName = $(this).find("spot_nm").text();
						let lo = $(this).find("lo_crd").text();
						let la = $(this).find("la_crd").text();
						let cntArr = [
							$(this).find("occrrnc_cnt").text(),
							$(this).find("caslt_cnt").text(),
							$(this).find("dth_dnv_cnt").text(),
							$(this).find("se_dnv_cnt").text(),
							$(this).find("sl_dnv_cnt").text()							
						];

						positions = {
							title : spotName,
							lating : new kakao.maps.LatLng(la, lo)
						};

						displayMarker(positions, cntArr);
						displayCircle(la, lo);
					});
				}
			}); // end of ajax
		};
		<%------------------ function end ------------------%>
		<%------------------ function end ------------------%>		
		
		<%-- KAKAO MAP --%>
		
		const locations = [
			"강남구", "강동구", "강북구", "강서구",
			"관악구", "광진구", "구로구", "금천구",
			"노원구", "도봉구", "동대문구", "동작구",
			"마포구", "서대문구", "서초구", "성동구", 
			"성북구","송파구", "양천구", "영등포구", 
			"용산구", "은평구", "종로구", "중랑구"
			];

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(<%=laa%>,
					<%=loo%>), // 지도의 중심좌표
			level : <%=level%>, // 지도의 확대 레벨
			mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		};


		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
		// 지도 타입 변경 컨트롤을 생성한다
		var mapTypeControl = new kakao.maps.MapTypeControl();

		// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		for (var i = 0; i < locations.length; i++) {
			getBicycleAcc(locations[i]);
		}

		// 지도가 확대 또는 축소되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'zoom_changed', changeMarkerImage);
		changeMarkerImage();
	</script>
</body>
</html>
