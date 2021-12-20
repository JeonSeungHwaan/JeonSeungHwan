package com.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.bean.MemberDTO;
import com.board.mybatis.MemberMapper;

import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService{

	@Setter(onMethod_=@Autowired)
	private MemberMapper mapper;

	@Override
	public int insertMember(MemberDTO member) {
		return mapper.insertMember(member);
	}

	@Override
	public String userCheck(MemberDTO member) {
		return mapper.userCheck(member);
	}

	@Override
	public MemberDTO getMember(String id) {
		return mapper.getMember(id);
	}

	@Override
	public void updateMember(MemberDTO member) {
		mapper.updateMember(member);
	}

	@Override
	public int confirmId(String id) {
		return mapper.confirmId(id);
	}

	@Override
	public int deleteMember(MemberDTO member) {
		return mapper.deleteMember(member);
	}
	
	
}
