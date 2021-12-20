<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/resources/member/css/color.jsp"%>
<html>
<head>
<title>회원가입</title>
<link href="/resources/member/css/style.css" rel="stylesheet" type="text/css">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	//아이디 중복 여부를 판단
	$(function(){
		$("#confirm_id").click(function(){
			$.ajax({
				type : "post" ,
				url : "/member/confirm_id" ,
				data : { id : $("#id").val() } ,
				success : function(data){
					check = parseInt(data);
					if(check == 1){
						$("#result").html("<font color='red'>사용불가능</font>")
					} else {
						$("#result").html("<font color='green'>사용가능</font>")
					}
				}
			});
		});
		
		$("form").submit(function(){
			
			if($("#id").val() == ""){
				alert("ID를 입력하세요");
	            return false;
			}
			
			if($("#passwd").val() == ""){
				alert("비밀번호를 입력하세요");
	            return false;
			}
			
			if($("#passwd").val() != $("#passwd2").val()){
				alert("비밀번호를 동일하게 입력하세요");
	            return false;
			}
			
			if($("#name").val() == ""){
				alert("사용자 이름을 입력하세요");
	            return false;
			}
			
			if($("#jumin1").val() == "" || $("#jumin2").val() == ""){
				alert("주민등록번호를 입력하세요");
	            return false;
			}
			
			if($("#result").text() == ""){
				alert("아이디 중복확인을 해주세요.");
				return false;
			}
			
			if($("#result").text() == "사용불가능"){
				alert("다른아이디를 사용해주세요.");
				return false;
			}
			
		});
		
	});
    
</script>


<body bgcolor="${bodyback_c}">

<form method="post" action="/member/signUpPro">
  <table width="600" border="1" cellspacing="0" cellpadding="3" align="center" >
    <tr> 
    <td colspan="2" height="39" align="center" bgcolor="${value_c}" >
       <font size="+1" ><b>회원가입</b></font></td>
    </tr>
    <tr> 
      <td width="200" bgcolor="${value_c}"><b>아이디 입력</b></td>
      <td width="400" bgcolor="${value_c}">&nbsp;</td>
    </tr>  

    <tr> 
      <td width="200"> 사용자 ID</td>
      <td width="400"> 
        <input type="text" name="id" size="10" maxlength="12" id="id">
        <input type="button" id="confirm_id" value="ID중복확인" ><label id="result"></label>
      </td>
    </tr>
    <tr> 
      <td width="200"> 비밀번호</td>
      <td width="400" > 
        <input type="password" name="passwd" size="15" maxlength="12" id="passwd">
      </td>
    <tr>  
      <td width="200">비밀번호 확인</td>
      <td width="400"> 
        <input type="password" name="passwd2" size="15" maxlength="12" id="passwd2">
      </td>
    </tr>
    
    <tr> 
      <td width="200" bgcolor="${value_c}"><b>개인정보 입력</b></td>
      <td width="400" bgcolor="${value_c}">&nbsp;</td>
    <tr>  
    <tr> 
      <td width="200">사용자 이름</td>
      <td width="400"> 
        <input type="text" name="name" size="15" maxlength="10" id="name">
      </td>
    </tr>
    <tr> 
      <td width="200">주민등록번호</td>
      <td width="400"> 
        <input type="text" name="jumin1" size="7" maxlength="6" id="jumin1">
        -<input type="text" name="jumin2" size="7" maxlength="7" id="jumin2">
      </td>
    </tr>
    <tr> 
      <td width="200">E-Mail</td>
      <td width="400"> 
        <input type="text" name="email" size="40" maxlength="30">
      </td>
    </tr>
    <tr> 
      <td width="200"> Blog</td>
      <td width="400"> 
        <input type="text" name="blog" size="60" maxlength="50">
      </td>
    </tr>
    <tr> 
      <td colspan="2" align="center" bgcolor="${value_c}"> 
          <input type="submit" name="confirm" value="등   록" >
          <input type="reset" name="reset" value="다시입력">
          <input type="button" value="가입안함" onclick="javascript:window.location='/member/main'">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
