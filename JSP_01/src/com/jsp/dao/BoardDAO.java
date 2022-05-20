package com.jsp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.command.Criteria;
import com.jsp.vo.Board;

public interface BoardDAO {
	public List<Board> selectBoardList(SqlSession session) throws Exception;
	public List<Board> selectBoardList(SqlSession session,Criteria cri) throws Exception;
	public int selectBoardListCount(SqlSession session) throws Exception;
}
