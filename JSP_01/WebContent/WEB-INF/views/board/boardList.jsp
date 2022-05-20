<%@page import="com.jsp.command.PageMaker"%>
<%@page import="java.util.Map"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.jsp.vo.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%
	Map<String,Object> dataMap 
		= (Map<String,Object>)request.getAttribute("dataMap");
	List<Board> boardList 
		= (List<Board>)dataMap.get("boardList");
	PageMaker pageMaker = (PageMaker)dataMap.get("pageMaker");
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
<title>Insert title here</title>
</head>
<script>

</script>
<body>




	<div class="container">
		<h1>게시판</h1>
		<hr>
		<br/>
		
		<div>
			<button class="btn btn-primary" onclick="location.href='insert';" type="button" >새글등록</button>
		</div>
			<div class="card-header with-border">
   				
   				<div id="keyword" class="card-tools" style="width:550px;">
   					 <div class="input-group row">
   					 	<!-- search bar -->
   					 	<!-- sort num -->
					  	<select class="form-control col-md-3" name="perPageNum" 
					  			id="perPageNum" onchange="">					  		  		
					  		<option value="10" >정렬개수</option>
					  		<option value="2" >2개씩</option>
					  		<option value="3">3개씩</option>
					  		<option value="5" >5개씩</option>
					  	</select>
					  	
					  	<!-- search bar -->
					 	<select class="form-control col-md-3" name="searchType" id="searchType">
					 		<option value=""  >검색구분</option>
							<option value="i" >아이디</option>
							<option value="n" >이 름</option>
							<option value="p" >전화번호</option>
							<option value="e" >이메일</option>				 									
						</select>
						<!-- keyword -->
   					 	<input  class="form-control" type="text" name="keyword" 
										placeholder="검색어를 입력하세요." value=""/>
						<span class="input-group-append">
							<button class="btn btn-primary" type="button" 
									id="searchBtn" data-card-widget="search" onclick="">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					<!-- end : search bar -->		
   					 </div>
   				</div>   			
   			</div>
		
		
		
		<br/>
		
		<table class="table table-striped">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<%
				

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
		
			<div class="card-footer">
    			<!-- pagination -->
    			<nav aria-label="Navigation">
					<ul class="pagination justify-content-center m-0">
						<li class="page-item">
							<a class="page-link" href="javascript:list_go(1);">
								<i class="fas fa-angle-double-left"></i>
							</a>
						<li class="page-item">
							<a class="page-link" href="">
								<i class="fas fa-angle-left"></i>
							</a>						
						</li>
						
						<% 
							int startPage = pageMaker.getStartPage();
							int endPage = pageMaker.getEndPage();
							int pageNum = pageMaker.getCri().getPage();
							
							for(int i=startPage;i<endPage+1;i++){
							%>
						<li class="page-item  <%= (i==pageNum)? "active":"" %>">
							<a class="page-link" href="javascript:list_go(<%=i %>);"><%=i %></a>
						</li>	
							
							<%	
							} 
							%>
						
						
						<li class="page-item">
							<a class="page-link" href="">
								<i class="fas fa-angle-right"></i>
							</a>						
						</li>
						<li class="page-item">
							<a class="page-link" href="">
								<i class="fas fa-angle-double-right"></i>
							</a>						
						</li>
					</ul>
				</nav>
    		</div>
		
		
	</div>
	
	<form id="jobForm">	
	<input type='hidden' name="page" value="" />
	<input type='hidden' name="perPageNum" value=""/>
	<input type='hidden' name="searchType" value="" />
	<input type='hidden' name="keyword" value="" />
</form>
  
	
	
	 <script>
	function list_go(page,url){
		//alert(page);
		if(!url) url="list";
		
		var jobForm=$('#jobForm');
		jobForm.find("[name='page']").val(page);
		jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
		
		jobForm.attr({
			action:url,
			method:'get'
		}).submit();
		
	}
  </script>
	
	
	
<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
</body>
</html>