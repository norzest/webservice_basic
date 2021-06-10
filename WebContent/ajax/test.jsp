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
        function test(json) {
            console.log(json);
        };
        $(function(){
            $('#btn').click(function(){
                $.ajax({
                    url : 'testXML/110.xml',
                    dataType : 'xml',
                    error : function(){
                        alert('error')
                    },
                    success : function(data){
                        console.log('h');
                    	
                    }
                }); // end of ajax
            }); // end of event
        }); // end of onloading
    </script>
</head>
<body>
    <button id="btn">가져오기</button>
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