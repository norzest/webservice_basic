<%@ page pageEncoding="utf-8"%>
<%@ include file="../inc/header.jsp"%>
<%
	String tempPage = request.getParameter("page");
	int cPage = 0;
	if(tempPage == null || tempPage.length()==0){
		cPage = 1;
	}
	try{
		cPage = Integer.parseInt(tempPage);
	}catch(NumberFormatException e){
		cPage = 1;
	}
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
			<%-- form start --%>
			<h5>글 작성</h5>
			<form name="noticeForm" method="post" action="saveDb.jsp">
				<div class="form-group">
					<label for="writer">작성자</label>
					<input type="text"
						class="form-control" id="writer" name="writer"
						placeholder="작성자 입력">
				</div>
				<div class="form-group">
					<label for="title">제목</label>
					<input type="text"
						class="form-control" id="title" name="title" placeholder="타이틀 입력">
				</div>
				<div class="form-group">
					<label for="content">내용</label>
					<textarea class="form-control" id="content" name="content"
						rows="10"></textarea>
				</div>
			</form>
			<%-- form end --%>
			<div class="text-right">
				<a class="btn btn-secondary" href="list.jsp?page=<%=cPage %>" role="button">목록</a>
				<a class="btn btn-primary" id="saveNotice" role="button">저장</a>
			</div>

		</div>
	</div>
	<!-- col end -->
</div>
<!-- container end -->

<script>
	$(function(){
		$('#saveNotice').click(function(){
			noticeForm.submit();
		});
	});
</script>
<%@ include file="../inc/footer.jsp"%>