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
	int pageDisplayCount = 10;
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
					<colgroup>
						<col width="10%">
						<col width="20%">
						<col width="50%">
						<col width="20%">
					</colgroup>
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
							<td><a href="view.jsp?num=<%=dto.getNum()%>&page=<%=cPage%>"><%=dto.getTitle() %></a></td>
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
				<%
					int totalRows = dao.getRows();
				
					int totalPage = totalRows%displayCount == 0 ?
							totalRows/displayCount :
							totalRows/displayCount + 1;
					if (totalPage == 0) { totalPage = 1; }
				
					int currentBlock = cPage%pageDisplayCount == 0 ?
							cPage/pageDisplayCount :
							cPage/pageDisplayCount + 1;

					int totalBlock = totalPage%pageDisplayCount == 0 ?
							totalPage/pageDisplayCount :
							totalPage/pageDisplayCount + 1;
					
					int startPage = 1 + (currentBlock - 1) * pageDisplayCount;
					
					int endPage = pageDisplayCount + (currentBlock - 1) * pageDisplayCount;
					if (currentBlock == totalBlock) {
						endPage = totalPage;
					}
					
				%>
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<% if(currentBlock == 1) { %>
						<li class="page-item disabled"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<% } else { %>
						<li class="page-item"><a class="page-link" href="list.jsp?page=<%= startPage - 1 %>"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<% } %>
						<%for(int i = startPage; i <= endPage; ++i) { %>
						<li class="page-item"><a class="page-link" href="list.jsp?page=<%= i %>"><%= i %></a></li>
						<%}%>
						<% if(totalBlock==currentBlock) { %>
						<li class="page-item disabled"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
						<% } else { %>
						<li class="page-item"><a class="page-link" href="list.jsp?page=<%= endPage + 1 %>"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
						<% } %>
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