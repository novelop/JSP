package com.jsp.action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.command.MemberRegistCommand;
import com.jsp.controller.HttpRequestParameterAdapter;
import com.jsp.dto.MemberVO;
import com.jsp.service.MemberService;

public class MemberRegistAction implements Action {
	
	private MemberService memberService;
	
	public void setSearchMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = "/member/regist_success";
		request.setCharacterEncoding("utf-8");
		try {
			//입력
			//리플랙션연습
			MemberRegistCommand command = HttpRequestParameterAdapter.execute(request, MemberRegistCommand.class);
			MemberVO member = command.toMemberVO();
			
			//처리
			memberService.regist(member);
			
		} catch (Exception e) {
			e.printStackTrace();
			//Exception 처리
			url = "/member/regist_fail";
		}
		return url;
	}

}
