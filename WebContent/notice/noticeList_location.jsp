<%@page import="com.iu.notice.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    NoticeDAO noticeDAO = new NoticeDAO();
    ArrayList<NoticeDTO> ar =noticeDAO.selectList();
    %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<%@include file="../temp/css_meta.jsp" %>
</head>
<body>
<%@include file="../temp/header_nav.jsp" %>
<div class="container">
	<div class="row">
		<table class="table table-hover">
			<tr>
				<td>NO</td><td>TITLE</td><td>WRITER</td><td>DATE</td><td>HIT</td>
			</tr>
			<%for(NoticeDTO dto : ar){ %>
				<tr>
					<td><%=dto.getNo() %></td>
					<td class="title" title="<%=dto.getNo() %>"><%=dto.getTitle() %></td>
					<td><%=dto.getWriter() %></td>
					<td><%=dto.getReg_date() %></td>
					<td><%=dto.getHit() %></td>
				</tr>
			<%}%>
		</table>
	</div>
	<div class="row">
		<a href ="./noticeWrite.jsp"><button class="btn btn-danger">Write</button></a>
	</div>
</div>
<%@include file="../temp/footer.jsp" %>
<script type="text/javascript">
	$('.title').click(function() {
		var id=$(this).prev().text();
		location.href="./noticeSelect.jsp?no="+id;
	});
</script>
</body>
</html>