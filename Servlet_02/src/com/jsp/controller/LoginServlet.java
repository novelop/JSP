package com.jsp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로그인 화면 전송
		String url="/WEB-INF/views/common/login.jsp";
		request.getRequestDispatcher(url).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로그인 입력(id/pwd)
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String message = "";
		
		//로그인 처리
		if(id!=null && id.equals("mimi")) {
			if(pwd!=null && pwd.equals("mimi")) {
				message = "로그인에 성공하였습니다.";
			}else {
				message = "암호가 불일치 합니다.";
			}
		}else {
			message = "아이디가 존재하지 않습니다.";
		}
		
		response.setContentType("text/html; charset=utf-8"); 
		PrintWriter out = response.getWriter();
		
//		out.println("<!DOCTYPE html>");
//		out.println("<html>");
//		out.println("<head>");
//		out.println("<title>로그인</title>");
//		out.println("</head>");
		out.println("<script>");
		out.println("alert('"+message+"');");
		out.println("</script>");
//		out.println("<body>");
//		out.println("</body>");
//		out.println("</html>");
	}

}
