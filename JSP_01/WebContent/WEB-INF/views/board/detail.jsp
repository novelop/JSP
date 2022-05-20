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
			<h1 class="page-header">상세 페이지</h1>
		</div>
	</div>
	

	<div class="panel" style="margin-left: 1px;">
		<div id="contAreaBox">
			<div class="panel">
				<div class="panel-body">
					<form role="form" action="/board/create_action" method="post">
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
										<th class="active">글번호</th>
										<td>${board.bno }</td>
									</tr>
									<tr>
										<th class="active">제목</th>
										<td>${board.title }</td>
									</tr>
									<tr>
										<th class="active">작성자</th>
										<td>${board.writer }</td>
									</tr>
									<tr>
										<th class="active">작성일</th>
										<td>${board.regDate }</td>
									</tr>
									<tr>
										<th class="active">조회수</th>
										<td>${board.viewCnt }</td>
									</tr>
									<tr>
										<th class="active">내용</th>
										<td>${board.content }</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div style="margin-left: 1px;">
							<a  class="btn btn-primary" onclick="location.href='<%=request.getContextPath()%>/board/modify?bno=${board.bno }';">수정</a>
							<a  class="btn btn-primary" onclick="location.href='<%=request.getContextPath()%>/board/remove?bno=${board.bno  }';">삭제</a>
							<a  class="btn btn-primary" onclick="location.href='boardList';">목록</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>




	<%-- <h1>회원상세</h1>
		<button type="button" onclick="location.href='<%=request.getContextPath()%>/board/modify?bno=${board.bno }';" >수정</button>&nbsp;&nbsp;&nbsp;
		<button type="button" onclick="location.href='<%=request.getContextPath()%>/board/remove?bno=${board.bno  }';">삭제</button>&nbsp;&nbsp;&nbsp;
		<button type="button" onclick="location.href='boardList';">목록</button>
	<hr/>
	<table>
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
			<td>내용</td>
		</tr>
		<tr>
			<td>${board.bno }</td>
			<td>${board.title }</td>
			<td>${board.writer }</td>
			<td>${board.regDate }</td>
			<td>${board.viewCnt }</td>
			<td>${board.content }</td>
		</tr>
	</table> --%>
	<!-- jQuery -->
<!-- jQuery -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/adminlte.min.js"></script>
</body>
</html>