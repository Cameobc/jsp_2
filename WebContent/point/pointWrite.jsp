<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<%@include file="../temp/css_meta.jsp" %>
<style type="text/css">
	#main{
		min-height: 800px;
	}
</style>
</head>
<body>
<%@include file="../temp/header_nav.jsp" %>

<div id="main" class="container">
  <h2>Score</h2>
  <form class="form-horizontal" action="./pointWriteProcess.jsp">
    <div class="form-group">
      <label class="control-label col-sm-2" for="name">Name:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="name" placeholder="Enter Name" name="name">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="kor">KOR:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="kor" placeholder="Enter Kor" name="kor">
      </div>
    </div>
	<div class="form-group">
      <label class="control-label col-sm-2" for="eng">ENG:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="eng" placeholder="Enter Eng" name="eng">
      </div>  
     </div>
     	<div class="form-group">
      <label class="control-label col-sm-2" for="math">MATH:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="math" placeholder="Enter Math" name="math">
      </div>  
     </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-danger" id="btn">Write</button>
      </div>
    </div>
  </form>
</div>
<%@include file="../temp/footer.jsp" %>
</body>
</html>