<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script language="JavaScript" src="/resources/script/script.js"></script>

<center>
	<b>글수정</b>
	<br>
	<form method="post" name="writeform" action="/myboard/updatePro" onsubmit="return writeSave()">
		<input type="hidden" name="pageNum" value="${pageNum}" />
		<table width="400" border="1" cellspacing="0" cellpadding="0"  bgcolor="#e0ffff" align="center">
		  <tr>
		    <td  width="70"  bgcolor="#b0e0e6" align="center">이 름</td>
		    <td align="left" width="330">
		       <input type="text" size="10" maxlength="10" name="writer" value="${boardDTO.writer}">
			   <input type="hidden" name="num" value="${boardDTO.num}"></td>
		  </tr>
		  <tr>
		    <td  width="70"  bgcolor="#b0e0e6" align="center" >제 목</td>
		    <td align="left" width="330">
		       <input type="text" size="40" maxlength="50" name="subject" value="${boardDTO.subject}"></td>
		  </tr>
		  <tr>
		    <td  width="70"  bgcolor="#b0e0e6" align="center">Email</td>
		    <td align="left" width="330">
		       <input type="text" size="40" maxlength="30" name="email" value="${boardDTO.email}"></td>
		  </tr>
		  <tr>
		    <td  width="70"  bgcolor="#b0e0e6" align="center" >내 용</td>
		    <td align="left" width="330">
		     <textarea name="content" rows="13" cols="40">${boardDTO.content}</textarea></td>
		  </tr>
		  <tr>
		    <td  width="70"  bgcolor="#b0e0e6" align="center" >비밀번호</td>
		    <td align="left" width="330" >
		     <input type="password" size="8" maxlength="12" name="passwd">
		     
			 </td>
		  </tr>
		  <tr>      
		   <td colspan=2 bgcolor="#b0e0e6" align="center"> 
		     <input type="submit" value="글수정" >  
		     <input type="reset" value="다시작성">
		     <input type="button" value="목록보기" 
		       onclick="document.location.href='/myboard/list?pageNum=${pageNum}'">
		   </td>
		 </tr>
		 </table>
	</form>
</center>	