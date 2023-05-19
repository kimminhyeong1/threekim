package com.myezen.myapp.service;
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myezen.myapp.domain.BoardVo;
import com.myezen.myapp.domain.SearchCriteria;
import com.myezen.myapp.persistance.BoardService_Mapper;

@Service("boardServiceImpl")
public class BoardServiceImpl implements BoardService{
	private BoardService_Mapper bsm;
	
	@Autowired
	public BoardServiceImpl(SqlSession sqlSession) {
		this.bsm = sqlSession.getMapper(BoardService_Mapper.class);
	}
	
	@Override
	public ArrayList<BoardVo> boardSelectAll(SearchCriteria scri) {		
		ArrayList<BoardVo> blist = bsm.boardSelectAll(scri);
		
		return blist;
	}

	@Override
	public int boardTotal(SearchCriteria scri) {		
		int value = bsm.boardTotal(scri);
		
		return value;
	}
	
	@Override
	public int boardViewCnt(int bidx) {		
		int value = bsm.boardViewCnt(bidx);		
		return value;
	}


	@Override
	public BoardVo boardSelectOne(int bidx) {		
		BoardVo bv = bsm.boardSelectOne(bidx);		
		return bv;
	}

	@Override
	public int boardInsert(BoardVo bv) {
		int value = bsm.boardInsert(bv);
		return 0;
	}

	@Override
	public int boardModify(BoardVo bv) {
		int value = bsm.boardModify(bv);
		return 0;
	}

	@Override
	public int boardDelete(BoardVo bv) {
		int value = bsm.boardDelete(bv);
		return 0;
	}

	@Override
	public int boardReply(BoardVo bv) {
		int value = bsm.boardReply(bv);
		return 0;
	}


	
	
	
	
	
	


}
