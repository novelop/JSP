package com.jsp.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.command.Criteria;
import com.jsp.dto.MemberVO;

public interface MemberDAO {
	public List<MemberVO> selectMemberList(SqlSession session) throws Exception;
	public List<MemberVO> selectMemberList(SqlSession session,Criteria cri) throws Exception;
	// 일반 리스트 전체 개수 
	public int selectMemberListCount(SqlSession session) throws Exception;
	MemberVO selectMemberById(SqlSession session, String id) throws SQLException;
	void insertMember(SqlSession session, MemberVO member) throws SQLException;
	void updateMember(SqlSession session, MemberVO member) throws SQLException;
	void deleteMember(SqlSession session, String id) throws SQLException;
	void enabledMember(SqlSession session, String id, int enabled) throws SQLException;
}
