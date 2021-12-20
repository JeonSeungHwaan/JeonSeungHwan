package com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.bean.BoardDTO;
import com.board.mybatis.BoardMapper;

import lombok.Setter;

@Service
public class BoardServiceImpl implements BoardService{

	@Setter(onMethod_=@Autowired)
	private BoardMapper mapper;
	
	@Override
	public int insertContent(BoardDTO board) {
		return mapper.insertContent(board);
	}

	@Override
	public int re_stepUpdate(int ref, int re_step) {
		return mapper.re_stepUpdate(ref, re_step);
	}
	
	@Override
	public int countMaxNum() {
		return mapper.countMaxNum();
	}

	@Override
	public List<BoardDTO> getList(int start, int end) {
		return mapper.getList(start, end);
	}

	@Override
	public int contentCount() {
		return mapper.contentCount();
	}

	@Override
	public void readCountUp(int num) {
		mapper.readCountUp(num);
	}

	@Override
	public BoardDTO getContent(int num) {
		return mapper.getContent(num);
	}

	@Override
	public int updateContent(BoardDTO board) {
		return mapper.updateContent(board);
	}

	@Override
	public int deleteContent(BoardDTO board) {
		return mapper.deleteContent(board);
	}
	
}
