package com.board.mybatis;

import javax.servlet.http.HttpServletRequest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.board.bean.BoardDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTest {

	@Setter(onMethod_=@Autowired)
	private BoardMapper mapper;
	
	@Test
	public void insert() {
		
		BoardDTO board = new BoardDTO();
		board.setWriter("test");
		board.setContent("test");
		board.setEmail("test");
		board.setSubject("test");
		board.setPasswd("test");
		board.setIp("1234");
		
		mapper.insertContent(board);
		
		log.info(board);
	}
}
