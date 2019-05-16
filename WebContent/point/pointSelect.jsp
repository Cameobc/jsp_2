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
    //1
	PointDAO pointDAO = new PointDAO();
    PointDTO pointDTO=pointDAO.selectOne(num);
    %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<%@include file="../temp/css_meta.jsp" %>
</head>
<body>
<%@include file="../temp/header_nav.jsp" %>
	<%
		if(pointDTO!=null){%>
		<h1>Num : <%=pointDTO.getNum() %></h1>
		<h1>Name : <%=pointDTO.getName() %></h1>
		<h1>Kor : <%=pointDTO.getKor() %></h1>
		<h1>Eng : <%=pointDTO.getEng() %></h1>
		<h1>Math : <%=pointDTO.getMath() %></h1>
		<h1>Sum : <%=pointDTO.getSum() %></h1>
		<h1>Avg : <%=pointDTO.getAvg() %></h1>

	<div>
		<a href="./pointUpdate.jsp?num=<%=pointDTO.getNum() %>">Update</a>
		<a href="./pointDelete.jsp?num=<%=pointDTO.getNum() %>">Delete</a>
	</div>
	<%}else{%>
	
		<h1>없는 번호입니다.</h1>
	
		<%}%>
<%@include file="../temp/footer.jsp" %>
</body>
</html>