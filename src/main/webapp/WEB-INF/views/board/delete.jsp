<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<center><b>글삭제</b>
<br>
	<form method="POST" name="delForm"  action="/myboard/deletePro" > 
		<input type="hidden" name="pageNum" value="${pageNum}" />
		 <table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
		  <tr height="30">
		     <td align=center  bgcolor="#b0e0e6">
		       <b>비밀번호를 입력해 주세요.</b></td>
		  </tr>
		  <tr height="30">
		     <td align=center >비밀번호 :   
		       <input type="password" name="passwd" size="8" maxlength="12">
			   <input type="hidden" name="num" value="${boardDTO.num}"></td>
		 </tr>
		 <tr height="30">
		    <td align=center bgcolor="#b0e0e6">
		      <input type="submit" value="글삭제" >
		      <input type="button" value="글목록" 
		       onclick="document.location.href='/myboard/list?pageNum=${pageNum}'">     
		   </td>
		 </tr>  
		</table> 
	</form>
</center>