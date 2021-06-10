<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="./js/jquery-3.6.0.js"></script>

    <script>
        $(function(){
            $('#id').focus();
            $('#sendMember').bind("click", function(event){
                event.preventDefault(); // 원래의 기능을 못쓰게(submit 버튼의 기능)
                alert('send');

                let id = $("#id").val();
                let email = $("#email").val();
                let pwd = $("#pwd").val();

                if(id=="") {
                    $("#errorId").css("display", "block");
                } else {
                    $("#errorId").css("display", "none");
                }

                if(email=="") {
                    $("#errorEmail").css("display", "block");
                } else {
                    $("#errorEmail").css("display", "none");
                }
                
                if(pwd=="") {
                    $("#errorPwd").css("display", "block");
                } else {
                    $("#errorPwd").css("display", "none");
                }
                

                if(id=="") {
                    $('#id').focus();
                    return;
                }

                if(email=="") {
                    $('#email').focus();
                    return;
                }
                
                if(pwd=="") {
                    $('#pwd').focus();
                    return;
                }
                document.memberForm.action="/hello";
                document.memberForm.submit();
            });
        });
    </script>

    <style>
        .error {
            color: red;
        }
    </style>
</head>
<body>
    <h3>jquery event</h3>
    <form name="memberForm" method='post'>
        <div>
            <label for='id'>아이디</label>
            <input type="text" id="id" name="id"
                placeholder="아이디 입력">
            <span class="error" id="errorId"
                style="display:none;">아이디 입력</span>
        </div>
        <div>
            <label for='email'>이메일</label>
            <input type="email" id="email" name="email"
                placeholder="이메일 입력">
            <span class="error" id="errorEmail"
                style="display:none;">이메일 입력</span>
        </div>
        <div>
            <label for='pwd'>비밀번호</label>
            <input type="password" id="pwd" name="pwd"
                placeholder="이메일 입력">
            <span class="error" id="errorPwd"
                style="display:none;">비밀번호 입력</span>
        </div>
        <div style="margin-top: 10px;">
            <button type="submit" id="sendMember">회원가입</button>
            <button type="reset">취소</button>
        </div>


    </form>
    
    
</body>
</html>