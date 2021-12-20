package com.board.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.board.bean.BoardDTO;

public interface BoardMapper {
	
	// 글 작성
	public int insertContent(BoardDTO board);
	
	// 현재까지 작성된 게시글의 최대 번호
	public int countMaxNum();
	
	// 답글 작성 시 re_step 증가
	public int re_stepUpdate(@Param("ref")int ref, @Param("re_step")int re_step);
	
	// 글 목록 리스트
	public List<BoardDTO> getList(@Param("start")int start, @Param("end")int end);
	
	// 글 갯수
	public int contentCount();
	
	// 게시글 조회수 증가
	public void readCountUp(int num);
	
	// 게시글 출력
	public BoardDTO getContent(int num);
	
	// 게시글 수정
	public int updateContent(BoardDTO board);
	
	// 게시글 삭제
	public int deleteContent(BoardDTO board);
}
