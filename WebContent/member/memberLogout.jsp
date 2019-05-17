<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    //session.setAttribute("member", null); // 1번
    //session.removeAttribute("member"); //2번
    //session.removeValue("member");  //3
    session.invalidate();
    response.sendRedirect("../index.jsp");
    %>