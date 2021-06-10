<!-- C:\Users\dark1\eclipse-workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\ROOT\org\apache\jsp -->
<%@page import="kr.or.kpc.dto.MemberDto"%>
<%@page import="kr.or.kpc.dao.MemberDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@page session="false"%>
<%@page errorPage="error.jsp" %>

<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Page Directive</title>
</head>
<body>
	<h1>페이지 디렉티브</h1>
	<%
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		MemberDao dao = MemberDao.getInstance();
		ArrayList<MemberDto> list = dao.select(0, 10);
		out.println("<ul>");
		for(MemberDto dto : list) {
			int num = dto.getNum();
			String name = dto.getName();
			String addr = dto.getAddr();
			out.println("<li>" + name + "</li>");
		}
		out.println("</ul>");
	%>
	<%= year %>년도입니다.
</body>
</html>