<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/dist/css/adminlte.min.css">
<title>Insert title here</title>
</head>
<body>

	<div class="row" style="margin-bottom: 20px; margin-left: 1px;">
		<div class="col-lg-12">
			<h1 class="page-header">수정 페이지</h1>
		</div>
	</div>
	

	<div class="panel" style="margin-left: 1px;">
		<div id="contAreaBox">
			<div class="panel">
				<div class="panel-body">
					<form action="modify" method="post" >
						<div class="table-responsive" style="text-align: center;">
							<table id="datatable-scroller"
								class="table table-bordered tbl_Form">
								<caption></caption>
								<colgroup>
									<col width="250px" />
									<col />
								</colgroup>
								<tbody>
								
									<tr>
										<th class="active">제목</th>
										<td>
											<input type="text" name="title" value="${board.title }"/>
										</td>
									</tr>
									<tr>
										<th class="active">작성자</th>
										<td>
											<input type="text" name="writer" value="${board.writer }" />
										</td>
									</tr>
									<tr>
										<th class="active">내용</th>
										<td>
											<textarea rows="" cols="" name="content" >${board.content }</textarea>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div style="margin-left: 1px;">
							<input type="hidden" name="bno" value="${board.bno }"/>
							<input class="btn btn-primary" type="submit" value="수정" />
							<a  class="btn btn-primary" onclick="location.href='boardList';">목록</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<!-- jQuery -->
<!-- jQuery -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/adminlte.min.js"></script>
</body>
</html>



<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시물 수정</h1>
	<form action="modify" method="post" >
		<input type="hidden" name="bno" value="${board.bno }"/><br/>
		제목 : <input type="text" name="title" value="${board.title }"/><br/>
		작성자 : <input type="text" name="writer" value="${board.writer }" /><br/>
		내용 : <textarea rows="" cols="" name="content" >${board.content }</textarea>
		<input type="submit" value="등록" />
	</form>
</body>
</html> --%>