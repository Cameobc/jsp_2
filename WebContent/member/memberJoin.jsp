<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<%@include file="../temp/css_meta.jsp" %>
</head>
<body>
<%@include file="../temp/header_nav.jsp" %>
	<div class="container">
  <h2>Join Form</h2>
  <form  action="./memberJoinProcess.jsp" method="post"  id="frm">
     <div class="form-group">
      <label for="id">Id:</label>
      <input type="text" class="form-control" id="id" placeholder="Enter id" name="id" title="id">
      <input type="hidden" id="idConfirm" value="1">
      <input type="button" value="중복확인" id="idcheck">
    </div>
    <div class="form-group">
      <label for="pw">Password:</label>
      <input type="password"  class="form-control" id="pw" placeholder="Enter password" name="pw">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="Enter password" >
    </div>
    <div class="form-group">
      <label for="name">Name:</label>
      <input type="text" class="form-control" id="name" placeholder="Enter PhoneName" name="name">
    </div>
    <div class="form-group">
      <label for="age">Age:</label>
      <input type="text" class="form-control" id="age" placeholder="Enter Age" name="age">
    </div>
       <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
    </div>
     <div class="form-group">
      <label for="phone">Phone:</label>
      <input type="text" class="form-control" id="phone" placeholder="Enter PhoneNumber" name="phone">
    </div>
    <input type="button" class="btn btn-default" value="Join" id ="btn">
  </form>
</div>
<%@include file="../temp/footer.jsp" %>
<script type="text/javascript">
$(function() {
	$('#pwd').blur(function() {
		if($(this).val()==$('#pw').val()){
			alert("일치");
		}else{
			alert("불일치");
			$(this).val('');
		}
	});
	$('#pw').blur(function() {
			$('#pwd').val('');
		
	});
	
	//*********************************************
/* 	$('#id').change(function() {
		$('#idConfirm').val('0');
	}); */
	//********************************************중복확인창
	$('#idcheck').click(function() {
		open('jquery_9t.html', '_blank', 'width=500px, height=300px;')
	});
	
	//*******************************************submit
	$('#btn').click(function() {
		var r = true;
		$('.form-control').each(function() {
			if($(this).val() == ''){
				r = false;
			}
		});
		if(r && $('#idConfirm').val()=='1'){
			$('#frm').submit();
		}else{
			alert("모두 작성하세요");
		}	
	});
}); 
</script>
</body>
</html>