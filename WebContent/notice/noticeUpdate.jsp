<%@page import="com.iu.notice.NoticeDTO"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    int no = Integer.parseInt(request.getParameter("no"));
    NoticeDAO noticeDAO = new NoticeDAO();
    NoticeDTO noticeDTO=noticeDAO.seletOne(no);
    %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<%@include file="../temp/css_meta.jsp" %>
</head>
<body>
<%@include file="../temp/header_nav.jsp" %>
<%if(noticeDTO!=null){ %>
<form class="form-horizontal" action="./noticeUpdateProcess.jsp" method="post">
 <div class="form-group">
      <input id="no" type="hidden" class="form-control" id="no" value="<%=noticeDTO.getNo() %>" name="no">
      </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="title">Title:</label>
    <div class="col-sm-10" cols="3">
      <input id="title" type="text" class="form-control" id="title" value="<%=noticeDTO.getTitle() %>" name="title">
      </div>
  </div>
    <div class="form-group">
    <label class="control-label col-sm-2" for="writer">Writer:</label>
    <div class="col-sm-10">
      <input id="writer" type="text" class="form-control" id="writer" value="<%=noticeDTO.getWriter() %>" name="writer">
      </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="contents">Contents:</label>
    <div class="col-sm-10"> 
      <textarea class="container" rows="30" name="contents" ><%=noticeDTO.getContents() %></textarea>
    </div>
  </div>
  <div class="form-group"> 
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">Update</button>
    </div>
  </div>
</form>
<%}else{%>
	<h1>다시 확인해주세요.</h1>
	<% }%>

<%@include file="../temp/footer.jsp" %>
</body>
</html>