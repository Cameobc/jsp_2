<%@page import="com.iu.point.PointDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
	int num =Integer.parseInt(request.getParameter("num"));
	
    PointDAO pointDAO = new PointDAO();
	int result= pointDAO.delete(num);
	
	String msg ="delete fail";
	if(result>0){
		msg="delete Success";
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<%@include file="../temp/css_meta.jsp" %>
<script type="text/javascript">
	alert('<%=msg%>');
	location.href ="./point.jsp";
</script>
</head>
<body>
<%@include file="../temp/header_nav.jsp" %>
<h1>Point Update Process</h1>

<%@include file="../temp/footer.jsp" %>
</body>
</html>