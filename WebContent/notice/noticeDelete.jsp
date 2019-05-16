<%@page import="com.iu.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    int num = Integer.parseInt(request.getParameter("no"));
    NoticeDAO noticeDAO = new NoticeDAO();
    int result=noticeDAO.delete(num);
    String msg = "Delete Fail";
    if(result>0){
    	msg="Delete Success";
    }
    %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<%@include file="../temp/css_meta.jsp" %>
<script type="text/javascript">
	alert('<%=msg%>');
	location.href="./noticeList.jsp";
</script>
</head>
<body>
<%@include file="../temp/header_nav.jsp" %>


<%@include file="../temp/footer.jsp" %>
</body>
</html>