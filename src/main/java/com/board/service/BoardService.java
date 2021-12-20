package com.board.service;

import java.util.List;

import com.board.bean.BoardDTO;

public interface BoardService {

	public int insertContent(BoardDTO board);
	
	public int countMaxNum();
	
	public int re_stepUpdate(int ref, int re_step);
	
	public List<BoardDTO> getList(int start, int end);
	
	public int contentCount();
	
	public void readCountUp(int num);
	
	public BoardDTO getContent(int num);
	
	public int updateContent(BoardDTO board);
	
	public int deleteContent(BoardDTO board);
}
