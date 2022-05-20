package com.jsp.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.jsp.command.Criteria;
import com.jsp.vo.Board;

public class BoardDAOImpl implements BoardDAO {

   @Override
   public List<Board> selectBoardList(SqlSession session) throws Exception {
      List<Board> boardList = null;
      try {
    	  boardList = session.selectList("Member-Mapper.selectBoardList");
      } catch (Exception e) {
         // 에러처리
         throw e;
      }
      return boardList;
   }

   @Override
   public List<Board> selectBoardList(SqlSession session, Criteria cri) throws Exception {
      int offset = cri.getStarRowNum();
      int limit = cri.getPerPageNum();
      RowBounds rowBounds = new RowBounds(offset, limit); // 시작~끝 까지 잘라서 리스트에 넣어줌

      List<Board> boardList = session.selectList("Member-Mapper.selectBoardList", null, rowBounds);
      return boardList;
   }

	@Override
	public int selectBoardListCount(SqlSession session) throws Exception {
		int totalCount = session.selectOne("Member-Mapper.selectBoardListCount");
		System.out.println(totalCount);
		return totalCount;
	}

}