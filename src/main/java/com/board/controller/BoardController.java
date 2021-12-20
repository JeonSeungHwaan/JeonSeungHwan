package com.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.bean.BoardDTO;
import com.board.service.BoardService;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/myboard/")
public class BoardController {
	
	@Setter(onMethod_=@Autowired)
	private BoardService service;
	
	@RequestMapping("write")
	public String writeForm(BoardDTO board, String pageNum, Model model) {
		log.info("========/writeForm/========");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		int num = 0, ref = 1, re_step = 0, re_level = 0;
		
		if(board.getNum() != null) {
			num = board.getNum();
			ref = board.getRef();
			re_step = board.getRe_step();
			re_level = board.getRe_level();
		}
		
		board.setNum(num);
		board.setRef(ref);
		board.setRe_step(re_step);
		board.setRe_level(re_level);
		
		model.addAttribute("boardDTO", board);
		model.addAttribute("pageNum", pageNum);
		
		return "board/write";
	}
	
	@RequestMapping("writePro")
	public String writePro(BoardDTO board, String pageNum, Model model, HttpServletRequest request) {
		log.info("========/writePro/========");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		int num = board.getNum();
		int ref = board.getRef();
		int re_step = board.getRe_step();
		int re_level = board.getRe_level();
		int number = 0;
		
		int maxCount = service.countMaxNum();
		
		if(maxCount != 0) {
			number = maxCount + 1;
		} else {
			number = 1;
		}
		
		if(num != 0) {
			service.re_stepUpdate(ref, re_step);
			re_step = re_step + 1;
			re_level = re_level + 1;
		} else {
			ref = number;
			re_step = 0;
			re_level = 0;
		}
		
		board.setRef(ref);
		board.setRe_step(re_step);
		board.setRe_level(re_level);
		
		// 사용자 IP 정보를 가져온 후 DTO 에 대입
		board.setIp(request.getRemoteAddr());
		
		model.addAttribute("result", service.insertContent(board));
		model.addAttribute("pageNum", pageNum);
		
		return "board/writePro";
	}
	
	@RequestMapping("list")
	public String list(String pageNum, Model model) {
		log.info("========/list/========");
		
		int pageSize = 10;
		
		if(pageNum == null) {
			pageNum = "1";
		}

		// 한 페이지 내에서 출력할 게시물 갯수
		// startRow ~ endRow 까지의 개시물만 출력 
	    int currentPage = Integer.parseInt(pageNum);
	    int startRow = (currentPage - 1) * pageSize + 1;
	    int endRow = currentPage * pageSize;
	    int count = 0;
		int number = 0;
		
	    List<BoardDTO> list = service.getList(startRow, endRow);
	    
	    count = service.contentCount();
	    if(count > 0) {
	    	model.addAttribute("list", list);
	    	model.addAttribute("pageNum", pageNum);
	    }
	    
	    number=count-(currentPage-1)*pageSize;
		model.addAttribute("number", number);
		
	    
	    // 페이징 처리 코드
	    if (count > 0) {
	        int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
			 
	        int startPage = (int)(currentPage/10)*10+1;
			int pageBlock=10;
	        int endPage = startPage + pageBlock-1;
	        if (endPage > pageCount) endPage = pageCount;
	        
	        // 밑의 if문, for문을 jsp 파일에서 작성하기 위해 연산 결과값을 model로 보냄
	        model.addAttribute("startPage", startPage);
	        model.addAttribute("endPage", endPage);
	        model.addAttribute("pageCount", pageCount);
	        
//	        if (startPage > 10) {    
//	        <a href="list.jsp?pageNum=${ startPage - 10 }">[이전]</a>
//	        }
//	        for (int i = startPage ; i <= endPage ; i++) {  
//	        <a href="list.jsp?pageNum=${ i }">[${ i }]</a>
//	
//	        }
//	        if (endPage < pageCount) {  
//	        <a href="list.jsp?pageNum=${ startPage + 10 }">[다음]</a>
//	
//	        }
	        
	    }
	    
		return "board/list";
	}
	
	@RequestMapping("readcountUp")
	public String readcountUp(int num, int pageNum, RedirectAttributes rttr) {
		log.info("========/readcountUp/========");
		service.readCountUp(num);
		rttr.addAttribute("num", num);
		rttr.addAttribute("pageNum", pageNum);
		
		return "redirect:/myboard/content";
	}
	
	@RequestMapping("content")
	public String content(int num, int pageNum, Model model) {
		log.info("========/content/========");
		model.addAttribute("boardDTO", service.getContent(num));
		model.addAttribute("pageNum", pageNum);
		
		return "/board/content";
	}
	
	@RequestMapping("update")
	public String update(int num, int pageNum, Model model) {
		log.info("========/update/========");
		model.addAttribute("boardDTO", service.getContent(num));
		model.addAttribute("pageNum", pageNum);
		
		return "board/update";
	}
	
	@RequestMapping("updatePro")
	public String updatePro(BoardDTO board, int pageNum, Model model) {
		log.info("========/updatePro/========");
		
		model.addAttribute("result", service.updateContent(board));
		model.addAttribute("pageNum", pageNum);
		
		return "board/updatePro";
	}
	
	@RequestMapping("delete")
	public String delete(BoardDTO board, int pageNum, Model model) {
		log.info("========/delete/========");
		model.addAttribute("boardDTO", board);
		model.addAttribute("pageNum", pageNum);
		
		return "board/delete";
	}
	
	@RequestMapping("deletePro")
	public String deletePro(BoardDTO board, int pageNum, Model model) {
		log.info("========/deletePro/========");
		model.addAttribute("result", service.deleteContent(board));
		model.addAttribute("pageNum", pageNum);
		
		return "board/deletePro";
	}
}
