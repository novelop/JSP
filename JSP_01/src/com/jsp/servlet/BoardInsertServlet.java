package com.jsp.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.datasource.DataSource;
import com.jsp.vo.Board;
import com.jsp.vo.Member;

/**
 * Servlet implementation class BoardInsertServlet
 */
@WebServlet("/board/insert")
public class BoardInsertServlet extends HttpServlet {
	 private DataSource dataSource = DataSource.getInstance();
	 private static int bno = 19;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="/WEB-INF/views/board/insert.jsp";
		request.getRequestDispatcher(url).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Map<String, Board> boardMap = dataSource.getBoardList();
		    
			String url = request.getContextPath() +"/board/boardList";
			
			//입력
			
			String title = request.getParameter("title");
			String writer = request.getParameter("writer");
			String content = request.getParameter("content");
			
			bno++;
			//처리
			Board board = new Board();
			board.setBno(bno);
			board.setTitle(title);
			board.setContent(content);
			board.setWriter(writer);
			board.setRegDate(new Date());
			board.setViewCnt(0);
			
			
			boardMap.put(bno+"",board);
			
			
			//출력       
			//response.setContentType("text/html; charset=utf-8"); 
			response.sendRedirect(url);
	}

}
