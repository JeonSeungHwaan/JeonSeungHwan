package com.board.controller;

import java.sql.Timestamp;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.bean.MemberDTO;
import com.board.service.MemberService;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member/")
public class MemberController {

	@Setter(onMethod_=@Autowired)
	private MemberService service;
	
	@RequestMapping("main")
	public String main(HttpSession session) {
		session.getAttribute("memId");
		return "member/main";
	}
	
	@RequestMapping("confirm_id")
	public @ResponseBody int confirm_id(String id) {
		log.info("============/confirm_id/============");
		return service.confirmId(id);
	}
	
	@RequestMapping("signUp")
	public String signUp() {
		return "member/signUp";
	}
	
	@RequestMapping("signUpPro")
	public String signUpPro(MemberDTO member, Model model) {
		
		member.setReg_date(new Timestamp(System.currentTimeMillis()) );
		model.addAttribute("result", service.insertMember(member));
		
		return "member/signUpPro";
	}
	
	@RequestMapping("loginForm")
	public String loginForm() {
		return "member/loginForm";
	}
	
	@RequestMapping("loginPro")
	public String loginPro(MemberDTO member, Model model, HttpSession session) {
		
		String uesrPw = service.userCheck(member);

		if(uesrPw != null) {
			if(uesrPw.equals(member.getPasswd())) {
				session.setAttribute("memId", member.getId());
			}
		}
		return "member/loginPro";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "member/logout";
	}
	
	@RequestMapping("modify")
	public String modify() {
		return "member/modify";
	}
	
	@RequestMapping("modifyForm")
	public String modifyForm(String id, Model model) {
		model.addAttribute("c", service.getMember(id));
		return "member/modifyForm";
	}
	
	@RequestMapping("modifyPro")
	public String modifyPro(MemberDTO member) {
		service.updateMember(member);
		return "member/modifyPro";
	}
	
	@RequestMapping("deleteForm")
	public String deleteForm() {
		return "member/deleteForm";
	}
	
	@RequestMapping("deletePro")
	public String deletePro(MemberDTO member, Model model, HttpSession session) {
		int result = service.deleteMember(member);
		
		if(result != 0) {
			session.invalidate();
			model.addAttribute("result", result);
		}
		
		return "member/deletePro";
	}
}
