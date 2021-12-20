package com.board.service;

import com.board.bean.MemberDTO;

public interface MemberService {

	public int insertMember(MemberDTO member);
	
	public String userCheck(MemberDTO member);
	
	public MemberDTO getMember(String id);
	
	public void updateMember(MemberDTO member);
	
	public int confirmId(String id);
	
	public int deleteMember(MemberDTO member);
}
