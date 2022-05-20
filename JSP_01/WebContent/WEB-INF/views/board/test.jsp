<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.jsp.vo.Board"%>
<%@page import="java.util.List"%>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<style type="text/css">
h2 {
	text-align: center;
}

tr {
	text-align: center;
}
</style>
</head>
<body>

	<div class="container">
		<h2>게시판리스트</h2>
			<button onclick="location.href='regist';" class="btn btn-dark" type="button"
				style="display: block; float: right;">글쓰기</button>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<%
				List<Board> boardList = (List<Board>) request.getAttribute("boardList");

				//int count = 0;
				if (boardList != null)
					for (Board board : boardList) {
						SimpleDateFormat mimi = new SimpleDateFormat("yyyy-MM-dd");
						pageContext.setAttribute("board", board);
						//pageContext.setAttribute("bno",count++);
			%>
			<tr style="text-align: center; cursor: pointer;"
				onclick="location.href='detail?bno=${board.bno}';";>
				<td>${board.bno }</td>
				<td>${board.title }</td>
				<td>${board.writer }</td>
				<td><%=mimi.format(board.getRegDate())%></td>
			</tr>
			<%
				}
				else {
			%>
			<tr>
				<td colspan="4">해당내용이 없습니다.</td>

			</tr>
			<%
				}
			%>
		</table>
	</div>

</body>
</html>
