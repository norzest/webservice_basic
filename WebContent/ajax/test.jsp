<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="../js/jquery-3.6.0.js"></script>
    <title>Document</title>

    <script>
        function getBicycleAcc(location) {
        	$.ajax({
            	url : 'testXML/' + location + '.xml',
                dataType : 'xml',
                error : function(){
                	alert('error')
               	},
                success : function(data){
                	let locationsArray = [];
                	
                	let html = $(data).find("item").each(function(){
                		let spotName = $(this).find("spot_nm").text();
                    	let info = $(this).find("geom_json").text();
                    	let json = JSON.parse(info);
                    	for (var i = 0; i < json.coordinates[0].length; i++){
	                    	locationsArray[i] = json.coordinates[0][i];
						}
                    	
	                	$('#sel').append(spotName + '</br>' + locationsArray + '</br>');
                    });
                }
          	}); // end of ajax
        };
        $(function(){
        	const locations = ["강남구", "강동구"];
        	for (var i = 0; i < locations.length; i++) {
				getBicycleAcc(locations[i]);
        	}
        }); // end of onloading
    </script>
</head>
<body>
    <div id="sel">

    </div>
</body>
</html>

<%-- 
let html = $(data).find("item").each(function(){
                        	var info = "afos_fid" + $(this).find("afos_fid").text() + "<br/>";
                        $('#sel').append(html);
                        });
 --%>