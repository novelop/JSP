package com.jsp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.command.Criteria;
import com.jsp.dto.MemberVO;

public interface MemberDAO {

		List<MemberVO> selectMemberList(SqlSession session) throws Exception;
		List<MemberVO> selectMemberList(SqlSession session, Criteria cri) throws Exception;
		
		//일반 리스트 전체 개수
		int selectMemberListCount(SqlSession session) throws Exception;
		
		//검색어 적용 -> 아키텍쳐 공부를 위해 다른 곳에서~
//		List<MemberVO> selectSearchMemberList(SqlSession session, Criteria cri, String searchType) throws Exception;
//		int selectSearchMemberListCount(SqlSession session, Criteria cri, String searchType) throws Exception;
		
		MemberVO selectMemberById(SqlSession session, String id) throws Exception;
		
		void insertMember(SqlSession session, MemberVO member) throws Exception;
		void updateMember(SqlSession session, MemberVO member) throws Exception;
		void deleteMember(SqlSession session, String id) throws Exception;
		void enabledMember(SqlSession session, String id, int enabled) throws Exception;
		
		
}
