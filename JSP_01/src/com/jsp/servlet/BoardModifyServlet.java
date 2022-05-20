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
 * Servlet implementation class BoardModifyServlet
 */
@WebServlet("/board/modify")
public class BoardModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DataSource dataSource = DataSource.getInstance();
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="/WEB-INF/views/board/modify.jsp";
		String bno = request.getParameter("bno");
		
		Board board = dataSource.getBoardList().get(bno);
		
		request.setAttribute("board", board);
		request.getRequestDispatcher(url).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			request.setCharacterEncoding("utf-8");
			
				String bno = request.getParameter("bno");
				String title = request.getParameter("title");
				String writer = request.getParameter("writer");
				String content = request.getParameter("content");
				System.out.println(bno);
				String url = request.getContextPath()+"/board/detail?bno="+bno;
				
				
				Board board = dataSource.getBoardList().get(bno);
				board.setTitle(title);
				board.setContent(content);
				board.setWriter(writer);
				board.setRegDate(new Date());
				
				
				
				
				//memberService.regist(member); <-----DB저장
				
				dataSource.getBoardList().put(bno, board);
			
				
				//출력
				
				response.sendRedirect(url);
	}

}
