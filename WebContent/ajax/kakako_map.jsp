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
	<div id="map" style="width: 900px; height: 900px;"></div>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.56779723637487,
					126.98248790767876), // 지도의 중심좌표
			level : 3, // 지도의 확대 레벨
			mapTypeId : kakao.maps.MapTypeId.ROADMAP
		// 지도종류
		};

		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 지도 타입 변경 컨트롤을 생성한다
		var mapTypeControl = new kakao.maps.MapTypeControl();

		// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	    
		// 마커 그룹
		var positions = [
			{
				title: '테스트',
				lating: new kakao.maps.LatLng(37.56779723637487, 126.98248790767876)
			},
			{
				title: '테스트2',
				lating: new kakao.maps.LatLng(37.567, 126.982)
			}
		];
		
		for (var i = 0; i < positions.length; ++i) {
			// 지도에 마커를 생성하고 표시한다
			var marker = new kakao.maps.Marker({
			    position: positions[i].lating, // 마커의 좌표
			    title: positions[i].title, // 마커의 타이틀
			    map: map // 마커를 표시할 지도 객체
			});
		}
	    

		// 마커에 클릭 이벤트를 등록한다 (우클릭 : rightclick)
		kakao.maps.event.addListener(marker, 'click', function() {
		    alert('마커를 클릭했습니다!');
		});

	</script>
</body>
</html>
