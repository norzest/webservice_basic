<%@ page pageEncoding="utf-8"%>
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

</head>
<body>
	<div id="map" style="width: 100%; height: 900px;"></div>
	<script>
		function getBicycleAcc(location) {
			$.ajax({
				url : 'testXML/' + location + '.xml',
				dataType : 'xml',
				error : function() {
					alert('error')
				},
				success : function(data) {

					let xml = $(data).find("item").each(function() {
						let spotName = $(this).find("spot_nm").text();
						let lo = $(this).find("lo_crd").text();
						let la = $(this).find("la_crd").text();

					positions = {title : spotName,
									lating : new kakao.maps.LatLng(la, lo)};

					// 지도에 마커를 생성하고 표시한다
					var marker = new kakao.maps.Marker({
						position : positions.lating, // 마커의 좌표
						title : positions.title, // 마커의 타이틀
						map : map
					// 마커를 표시할 지도 객체
					});
						
					// 지도에 표시할 원을 생성합니다
					var circle = new kakao.maps.Circle({
					    center : new kakao.maps.LatLng(la, lo),  // 원의 중심좌표 입니다 
					    radius: 50, // 미터 단위의 원의 반지름입니다 
					    strokeWeight: 0, // 선의 두께입니다 
					    strokeColor: '#FF5500', // 선의 색깔입니다
					    strokeOpacity: 0, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
					    strokeStyle: 'dashed', // 선의 스타일 입니다
					    fillColor: '#FF5500', // 채우기 색깔입니다
					    fillOpacity: 0.5  // 채우기 불투명도 입니다   
					}); 
							

					// 지도에 원을 표시합니다 
					circle.setMap(map);
	
				});

				}
			}); // end of ajax
		};
		
		<%-- KAKAO MAP --%>
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.56779723637487,
					126.98248790767876), // 지도의 중심좌표
			level : 8, // 지도의 확대 레벨
			mapTypeId : kakao.maps.MapTypeId.ROADMAP
		// 지도종류
		};

		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 지도 타입 변경 컨트롤을 생성한다
		var mapTypeControl = new kakao.maps.MapTypeControl();

		// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		

		let positions = [];				
		const locations = [ "강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구",
							"동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중랑구"];
		for (var i = 0; i < locations.length; i++) {
			getBicycleAcc(locations[i]);
		}
		


	</script>
</body>
</html>
