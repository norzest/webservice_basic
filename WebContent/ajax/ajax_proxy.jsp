<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="../js/jquery-3.6.0.js"></script>

    <script>
        function getBicycleAcc() {
        	
        	var address = encodeURIComponent('http://apis.data.go.kr/B552061/frequentzoneBicycle/getRestFrequentzoneBicycle?serviceKey=uzqVSGAn51ZoLPRRxN3%2BrS47DIR%2FD7HyH1lSAzGAHSAqhq4zjnlcq%2FpPlCLyApT8M%2B4VQ%2BHMHvSZVGdSE%2FjcrQ%3D%3D&searchYearCd=2015&siDo=11&guGun=110&type=json&numOfRows=1&pageNo=1');
            
            $.ajax({
                url : 'proxy.jsp?url='+address,
                type : 'get',
                dataType : 'json',
                error : function(){},
                success : function(json){
                    $('#sel').append(JSON.stringify(json));
                }
            });         
        }
        
        $(function(){
            getBicycleAcc();


        }); // end of onloading
    </script>
</head>
<body>
    <div id = "sel">

    </div>
</body>
</html>

<!-- 
http://apis.data.go.kr/B552061/frequentzoneBicycle/getRestFrequentzoneBicycle?serviceKey=BhPAjgZlO9Dmp6n8gIBEIy9FvRhjM7ftFPr1Ue/EUZ84r9Onu+hXUcamJrZ0a9cxAfHBIOvRbntRMdgRUhzDjA==&searchYearCd=2016&siDo=11&guGun=110&type=json&numOfRows=1&pageNo=1
 -->
