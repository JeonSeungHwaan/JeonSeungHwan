<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<center>

<table width="700">
	<tr>
	    <td align="right" bgcolor="#b0e0e6">
	    <a href="/myboard/write">글쓰기</a>
	    </td>
	</tr>
</table>

<c:if test="${list == null}">
	<table width="700" border="1" cellpadding="0" cellspacing="0">
		<tr>
		    <td align="center">
		    게시판에 저장된 글이 없습니다.
		    </td>
		</tr>
	</table>
</c:if>

<c:if test="${list != null}">
	<table border="1" width="700" cellpadding="0" cellspacing="0" align="center"> 
	    <tr height="30" bgcolor="#b0e0e6"> 
	      <td align="center"  width="50"  >번 호</td> 
	      <td align="center"  width="250" >제   목</td> 
	      <td align="center"  width="100" >작성자</td>
	      <td align="center"  width="150" >작성일</td> 
	      <td align="center"  width="50" >조 회</td> 
	      <td align="center"  width="100" >IP</td>    
	    </tr>
	    
		<c:forEach items="${list}" var="boardDTO">
			 <tr height="30">
			    <td align="center"  width="50" >
			    	${number}
			    	<c:set var="number" value="${number - 1}" />
			    </td>
			    <td  width="250" >
			    
			    <c:if test="${boardDTO.re_level > 0}">
			    	<img src="/resources/board/images/level.gif" width="${5 * boardDTO.re_level}" height="16">
	 				<img src="/resources/board/images/re.gif">
			    </c:if>
			    
			    <c:if test="${boardDTO.re_level == 0}">
			    	<img src="/resources/board/images/level.gif" width="${5 * boardDTO.re_level}" height="16">
			    </c:if>
			    
			    <a href="/myboard/readcountUp?num=${boardDTO.num}&pageNum=${pageNum}">
			          ${boardDTO.subject}</a> 
				    <c:if test="${boardDTO.readcount >= 20}">
				    	<img src="/resources/board/images/hot.gif" border="0"  height="16">
				    </c:if>
			    </td>
			    <td align="center"  width="100"> 
			       <a href="mailto:${boardDTO.email}">${boardDTO.writer}</a></td>
			    <td align="center"  width="150">
			    	<fmt:formatDate value="${boardDTO.reg_date}" type="both" dateStyle="short" timeStyle="short" />
			    </td>
			    <td align="center"  width="50">${boardDTO.readcount}</td>
			    <td align="center" width="100" >${boardDTO.ip}</td>
			  </tr>
		</c:forEach>
		
	</table>
</c:if>

<c:if test="${startPage > 10}">
	<a href="/myboard/list?pageNum=${startPage - 10}">[이전]</a>	
</c:if>

<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
	<a href="/myboard/list?pageNum=${i}">[${i}]</a>
</c:forEach>

<c:if test="${endPage < pageCount}">
	<a href="/myboard/list?pageNum=${startPage + 10}">[다음]</a>
</c:if>

</center>





















