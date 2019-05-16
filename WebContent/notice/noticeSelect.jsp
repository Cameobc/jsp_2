<%@page import="com.iu.notice.NoticeDTO"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("no"));
	NoticeDAO noticeDAO = new NoticeDAO();
	NoticeDTO noticeDTO=noticeDAO.seletOne(num);
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<%@include file="../temp/css_meta.jsp" %>
<style type="text/css">

</style>
</head>
<body>
<%@include file="../temp/header_nav.jsp" %>
<%	if(noticeDTO!=null){ %>
<div class="container">
	<div class="row">
		<table class="table table-hover">
			<tr>
				<td>NO</td><td>TITLE</td><td>WRITER</td><td>DATE</td><td>HIT</td>
			</tr>
			<tr>
				<td><%=noticeDTO.getNo() %></td>
				<td><%=noticeDTO.getTitle() %></td>
				<td><%=noticeDTO.getWriter() %></td>
				<td><%=noticeDTO.getReg_date() %></td>
				<td><%=noticeDTO.getHit() %></td>
			</tr>
			<tr>
				<td colspan="5"><%=noticeDTO.getContents() %></td>
			</tr>
		</table>
	</div>
	<div class="row">
		<a href="./noticeUpdate.jsp?no=<%=noticeDTO.getNo() %>"><button class="btn btn-primary">Update</button></a>
		<a href="./noticeDelete.jsp?no=<%=noticeDTO.getNo() %>"><button class="btn btn-danger">Delete</button></a>
	</div>
</div>
<%}else{ %>
	<h1>다시 확인해주세요.</h1>
<%} %>
<%@include file="../temp/footer.jsp" %>
</body>
</html>