package com.board.bean;

import java.util.Date;

import lombok.Data;

@Data
public class BoardDTO {
	
	private Integer num;
	private String writer;
	private String subject;
	private String email;
	private String content;
	private String passwd;
	private Date reg_date;
	private Integer readcount;
	private String ip;
	private Integer ref;
	private Integer re_step;
	private Integer re_level;
}
