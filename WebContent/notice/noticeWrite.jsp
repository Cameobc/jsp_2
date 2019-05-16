<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<%@include file="../temp/css_meta.jsp" %>
<style type="text/css">
#title{
	width : 500px;
}
#writer{
	width : 300px;

}
.form-control {
    display: block;
    height: calc(2.25rem + 2px);
    padding: .375rem .75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: .25rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}
</style>
</head>
<body>
<%@include file="../temp/header_nav.jsp" %>
<form class="form-horizontal" action="./noticeWriterProcess.jsp" method="post">
  <div class="form-group">
    <label class="control-label col-sm-2" for="title">Title:</label>
    <div class="col-sm-10" cols="3">
      <input id="title" type="text" class="form-control" id="title" placeholder="Enter Title" name="title">
      </div>
  </div>
    <div class="form-group">
    <label class="control-label col-sm-2" for="writer">Writer:</label>
    <div class="col-sm-10">
      <input id="writer" type="text" class="form-control" id="writer" placeholder="Enter writer" name="writer">
      </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="contents">Contents:</label>
    <div class="col-sm-10"> 
      <textarea class="container" rows="30" name="contents"></textarea>
    </div>
  </div>
  <div class="form-group"> 
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">Write</button>
    </div>
  </div>
</form>
<%@include file="../temp/footer.jsp" %>
</body>
</html>