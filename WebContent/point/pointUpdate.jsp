<%@page import="com.iu.point.PointDTO"%>
<%@page import="com.iu.point.PointDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    int num = Integer.parseInt(request.getParameter("num"));
    //
   PointDAO pointDAO = new PointDAO();
   PointDTO pointDTO=pointDAO.selectOne(num);
    
    %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<%@include file="../temp/css_meta.jsp" %>
<style type="text/css">
 #num{
 	display: none;
 }
</style>
</head>
<body>
<%@include file="../temp/header_nav.jsp" %>
<div id="main" class="container">
  <h2>Score</h2>
  <form class="form-horizontal" action="./pointUpdateProcess.jsp">
  <input type="hidden" value="<%= pointDTO.getNum() %>" name="num">
<%--     <div class="form-group" id="num">
      <label class="control-label col-sm-2" for="num">Num:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="num" value="<%= rs.getString("num") %>" name="num">
      </div>
       </div> --%>
    <div class="form-group">
      <label class="control-label col-sm-2" for="name">Name:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="name" value="<%= pointDTO.getName() %>" name="name">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="kor">KOR:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="kor" value="<%=pointDTO.getKor() %>" name="kor">
      </div>
    </div>
	<div class="form-group">
      <label class="control-label col-sm-2" for="eng">ENG:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="eng" value="<%=pointDTO.getEng() %>" name="eng">
      </div>  
     </div>
     	<div class="form-group">
      <label class="control-label col-sm-2" for="math">MATH:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="math" value="<%=pointDTO.getMath() %>" name="math">
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