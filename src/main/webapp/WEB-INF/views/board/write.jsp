<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script language="JavaScript" src="/resources/script/script.js"></script>

<center>
	<b>글쓰기</b>
	<br>
	<form method="post" name="writeform" action="/myboard/writePro" onsubmit="return writeSave()">
		<input type="hidden" name="num" value="${boardDTO.num}">
		<input type="hidden" name="ref" value="${boardDTO.ref}">
		<input type="hidden" name="re_step" value="${boardDTO.re_step}">
		<input type="hidden" name="re_level" value="${boardDTO.re_level}">
		<input type="hidden" name="pageNum" value="${pageNum}">
	
		<table width="400" border="1" cellspacing="0" cellpadding="0"  bgcolor="#e0ffff" align="center">
		   <tr>
		    <td align="right" colspan="2" bgcolor="#b0e0e6">
			    <a href="list.jsp"> 글목록</a> 
		   </td>
		   </tr>
		   <tr>
		    <td  width="70"  bgcolor="#b0e0e6" align="center">이 름</td>
		    <td  width="330">
		       <input type="text" size="10" maxlength="10" name="writer"></td>
		  </tr>
		  <tr>
		    <td  width="70"  bgcolor="#b0e0e6" align="center" >제 목</td>
		    
		    <c:if test="${boardDTO.num == 0}">
			    <td  width="330">
			    	<input type="text" size="40" maxlength="50" name="subject">
			    </td>
		    </c:if>
		       
		    <c:if test="${boardDTO.num != 0}">
			    <td  width="330">
			    	<input type="text" size="40" maxlength="50" name="subject" value="[답변]">
			    </td>
		    </c:if>
		    
		  </tr>
		  <tr>
		    <td  width="70"  bgcolor="#b0e0e6" align="center">Email</td>
		    <td  width="330">
		       <input type="text" size="40" maxlength="30" name="email" ></td>
		  </tr>
		  <tr>
		    <td  width="70"  bgcolor="#b0e0e6" align="center" >내 용</td>
		    <td  width="330" >
		     <textarea name="content" rows="13" cols="40"></textarea> </td>
		  </tr>
		  <tr>
		    <td  width="70"  bgcolor="#b0e0e6" align="center" >비밀번호</td>
		    <td  width="330" >
		     <input type="password" size="8" maxlength="12" name="passwd"> 
			 </td>
		  </tr>
		<tr>      
		 <td colspan=2 bgcolor="#b0e0e6" align="center"> 
		  <input type="submit" value="글쓰기" >  
		  <input type="reset" value="다시작성">
		  <input type="button" value="목록보기" OnClick="window.location='/myboard/list?pageNum=${pageNum}'">
		</td>
		</tr>
		</table>    
	</form> 
</center>	 