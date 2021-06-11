<%@page import="kr.or.kpc.dto.NoticeDto"%>
<%@page import="kr.or.kpc.dao.NoticeDao"%>
<%@ page pageEncoding="utf-8" %>
<%
	String tempPage = request.getParameter("page");
	String tempNum = request.getParameter("num");
	int cPage = 0;
	int num = 0;
	if(tempPage== null || tempPage.length()==0){
		cPage = 1;
	}
	try{
		cPage = Integer.parseInt(tempPage);
	}catch(NumberFormatException e){
		cPage = 1;
	}
	
	if(tempNum == null || tempNum.length()==0){
		num = -1;
	}
	
	try{
		num = Integer.parseInt(tempNum);
	}catch(NumberFormatException e){
		num = -1;
	}
	
	NoticeDao dao = NoticeDao.getInstance();
	NoticeDto dto = dao.select(num);//
	
	if(dto == null){
		num = -1;
	}
	
	if(num == -1){
%>
	<script>
		alert('해당글이 존재 하지않습니다.');
		location.href="view.jsp?num=<%=num%>&page=<%=cPage%>";
	</script>
<%} else {%>
<%@ include file="../inc/header.jsp" %>
  	<!-- breadcrumb start -->
  	<nav aria-label="breadcrumb">
	  <ol class="breadcrumb">
	    <li class="breadcrumb-item"><a href="/index.jsp">홈</a></li>
	    <li class="breadcrumb-item">공지사항</li>
	 </ol>
	</nav>
	<!-- breadcrumb end -->
  	
  	<!-- container start -->
	<div class="container">
		<!-- col start -->
		<div class="row">
			<div class="col-md-12">
				<h5>공지사항 수정</h5>
				<%-- form start --%>
				<form name="noticeForm" method="post" action="modifyDb.jsp">
				  <div class="form-group">
				    <label for="writer">작성자</label>
				    <input type="text" class="form-control" 
				    id="writer" name="writer" value="<%=dto.getWriter() %>" placeholder="작성자를 입력하세요">
				  </div>
				  <div class="form-group">
				    <label for="title">제목</label>
				    <input type="text" class="form-control" 
				    id="title" name="title" value="<%=dto.getTitle() %>" placeholder="제목을 입력하세요">
				  </div>
				  <div class="form-group">
				    <label for="content">내용</label>
				    <textarea class="form-control" 
				    id="content" name="content" rows="10"><%=dto.getContent() %></textarea>
				  </div>
				  <input type="hidden" name="num" value="<%=num%>/">
				  <input type="hidden" name="page" value="<%=cPage%>"/>
				  
				</form>
				<div class="text-right">
					<a class="btn btn-secondary" href="view.jsp?num=<%=num%>&page=<%=cPage%>" 
					role="button">뷰</a>
					<a class="btn btn-success" id="modifyNotice"
					role="button">수정</a>
				</div>
				<%-- form end --%>
			</div>
		</div>
		<!-- col end -->
	</div>
	<!-- container end -->
	
	<script>
		$(function(){
			$('#modifyNotice').click(function(){
				noticeForm.submit();
			});
		});
	</script>
<%@ include file="../inc/footer.jsp" %>
<%}%>