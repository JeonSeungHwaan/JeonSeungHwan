<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<center>
	<b>글내용 보기</b>
	<br>
	<table width="500" border="1" cellspacing="0" cellpadding="0"  bgcolor="#e0ffff" align="center">  
	  <tr height="30">
	    <td align="center" width="125" bgcolor="#b0e0e6">글번호</td>
	    <td align="center" width="125" align="center">
		     ${boardDTO.num}</td>
	    <td align="center" width="125" bgcolor="#b0e0e6">조회수</td>
	    <td align="center" width="125" align="center">
		     ${boardDTO.readcount}</td>
	  </tr>
	  <tr height="30">
	    <td align="center" width="125" bgcolor="#b0e0e6">작성자</td>
	    <td align="center" width="125" align="center">
		     ${boardDTO.writer}</td>
	    <td align="center" width="125" bgcolor="#b0e0e6" >작성일</td>
	    <td align="center" width="125" align="center">
		     <fmt:formatDate value="${boardDTO.reg_date}" type="both" dateStyle="short" timeStyle="short" />
		</td>
	  </tr>
	  <tr height="30">
	    <td align="center" width="125" bgcolor="#b0e0e6">글제목</td>
	    <td align="center" width="375" align="center" colspan="3">
		     ${boardDTO.subject}</td>
	  </tr>
	  <tr>
	    <td align="center" width="125" bgcolor="#b0e0e6">글내용</td>
	    <td align="left" width="375" colspan="3"><pre>${boardDTO.content}</pre></td>
	  </tr>
	  <tr height="30">      
	    <td colspan="4" bgcolor="#b0e0e6" align="right" > 
		  <input type="button" value="글수정" 
	       onclick="document.location.href='/myboard/update?num=${boardDTO.num}&pageNum=${pageNum}'">
		   &nbsp;&nbsp;&nbsp;&nbsp;
		  <input type="button" value="글삭제" 
	       onclick="document.location.href='/myboard/delete?num=${boardDTO.num}&pageNum=${pageNum}'">
		   &nbsp;&nbsp;&nbsp;&nbsp;
	      <input type="button" value="답글쓰기" 
	       onclick="document.location.href='/myboard/write?num=${boardDTO.num}&ref=${boardDTO.ref}&re_step=${boardDTO.re_step}&re_level=${boardDTO.re_level}&pageNum=${pageNum}'">
		   &nbsp;&nbsp;&nbsp;&nbsp;
	       <input type="button" value="글목록" 
	       onclick="document.location.href='/myboard/list?pageNum=${pageNum}'">
	    </td>
	  </tr>
	</table>
</center>