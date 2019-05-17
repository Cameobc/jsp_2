<%@page import="com.iu.member.MemberDTO"%>
<%@page import="com.iu.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    %>
<jsp:useBean id="memberDTO" class="com.iu.member.MemberDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="memberDTO"/>
	<% 
    MemberDAO memberDAO = new MemberDAO();
    int result = memberDAO.memberJoin(memberDTO);
    String msg = "Join Fail";
    if(result>0){
    	msg = "Join Success";
    }
    request.setAttribute("message", msg);
    request.setAttribute("path", "../index.jsp");
    //RequestDispatcher view = request.getRequestDispatcher("../common/test/result.jsp");
    //view.forward(request, response);
    %>
<jsp:forward page="../common/test/result.jsp"></jsp:forward>