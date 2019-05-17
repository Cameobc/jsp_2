<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<jsp:include page="../temp/css_meta.jsp"/>
</head>
<body>
<%@include file="../temp/header_nav.jsp" %>
<div class="container">
  <h2>약관 동의</h2>
    <div class="checkbox">
      <label><input type="checkbox" id="checkAll"> 전체동의 </label>
    </div>
       <div class="checkbox">
      <label><input type="checkbox" class="check"> 동의A </label>
    </div>
       <div class="checkbox">
      <label><input type="checkbox" class="check"> 동의B </label>
    </div>
       <div class="checkbox">
      <label><input type="checkbox" class="check"> 동의C </label>
    </div>
    <input type="button" class="btn btn-default" value="Next" id="join">
</div>

<%@include file="../temp/footer.jsp" %>
<script type="text/javascript">
 $('#checkAll').click(function() {
	var c = $(this).prop('checked');
	$('.check').prop('checked', c);
});
$('.check').click(function() {
	var c = true;
	$('.check').each(function() {
		if(!$(this).prop('checked')){
			c = false;
		}
	});
		$('#checkAll').prop('checked', c);
});
$('#join').click(function() {
	if($('#checkAll').prop('checked')==true){
		location.href="./memberJoin.jsp";
	}else{
		alert('약관에 모두 동의해주세요.');
	}
	
});
</script>
</body>
</html>