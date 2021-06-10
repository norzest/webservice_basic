<%@page import="kr.or.kpc.dto.NoticeDto"%>
<%@page import="kr.or.kpc.dao.NoticeDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page pageEncoding="utf-8"%>
<%@ include file="../inc/header.jsp"%>
<%
	String tempPage = request.getParameter("page");
	int cPage = 0;
	if(tempPage == null || tempPage.length()==0) { cPage = 1; }
	try {
		cPage = Integer.parseInt(tempPage);		
	} catch (NumberFormatException e) {
		cPage = 1;
	}
	
	NoticeDao dao = NoticeDao.getInstance();
	int displayCount = 10;
	int start = (cPage - 1) * displayCount;
	ArrayList<NoticeDto> list = dao.select(start, displayCount);
%>
<!-- breadcrumb start -->
<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="/index.jsp">홈</a></li>
		<li class="breadcrumb-item active" aria-current="page">공지사항</li>
	</ol>
</nav>
<!-- breadcrumb end -->

<!-- container start -->
<div class="container">
	<!-- col start -->
	<div class="row">
		<div class="col-md-12">
			<%-- table start --%>
			<h5>리스트</h5>
			<div class="table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">작성자</th>
							<th scope="col">제목</th>
							<th scope="col">날짜</th>
						</tr>
					</thead>
					<tbody>
					<%
						if(list.size() != 0) {
							for(NoticeDto dto : list) {
					%>
						<tr>
							<th scope="row"><%=dto.getNum() %></th>
							<td><%=dto.getWriter() %></td>
							<td><a href="view.jsp"><%=dto.getTitle() %></a></td>
							<td><%=dto.getRegdate() %></td>
						</tr>
					<%
							}
						} else {
					%>
						<tr>
							<td colspan='4'>데이터가 존재하지 않습니다.</td>
						</tr>
					<%
						}
					%>
					</tbody>
				</table>
				<%-- table end --%>
				<%-- Pagination start --%>
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
				<%-- Pagination end --%>
				<div class="text-right">
					<a class="btn btn-primary" href="write.jsp" role="button">글쓰기</a>
				</div>
			</div>
		</div>
	</div>
	<!-- col end -->
</div>
<!-- container end -->
<%@ include file="../inc/footer.jsp"%>