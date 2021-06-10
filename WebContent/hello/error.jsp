<%@ page isErrorPage="true" %>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>error page</title>
</head>
<body>
	<h1>에러</h1>
	<%= exception.getMessage() %>
</body>
</html>