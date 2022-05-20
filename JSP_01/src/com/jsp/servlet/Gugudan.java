package com.jsp.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/gugudan")
public class Gugudan extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 입력
		int dan = 2;
		String result = "";


		// 처리
		for(int i=2 ; i<=9; i++){
			result +="<h3>"+ i +"단 입니다.</h3>";
			for(int j=1; j<=9; j++){
				result += i + " * " + j + " = " + i*j + "<br/>"; 
			}
			result += "<br/>";
		}
		
		request.setAttribute("result", result);
		request.getRequestDispatcher("/gugudan.jsp").forward(request, response);

	}

}
