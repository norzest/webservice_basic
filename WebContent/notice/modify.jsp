<%@ page pageEncoding="utf-8"%>
<%@ include file="../inc/header.jsp"%>
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
			<h5>글 수정</h5>
			<form name="noticeForm" method="post" action="modifyDb.jsp">
				<div class="form-group">
					<label for="writer">작성자</label> <input type="text"
						class="form-control" id="writer" name="writer"
						value="홍길동" placeholder="작성자 입력">
				</div>
				<div class="form-group">
					<label for="title">제목</label> <input type="text"
						class="form-control" id="title" name="title"
						value="안녕하세요" placeholder="타이틀 입력">
				</div>
				<div class="form-group">
					<label for="content">내용</label>
					<textarea class="form-control" id="content" name="content"
						rows="10">안녕하세요</textarea>
				</div>
			</form>
			<%-- form end --%>
			<div class="text-right">
				<a class="btn btn-secondary" href="view.jsp" role="button">취소</a>
				<a class="btn btn-primary" id="modifyNotice" role="button">수정</a>
			</div>
		</div>
	</div>
	<!-- col end -->
</div>
<!-- container end -->
<%@ include file="../inc/footer.jsp"%>