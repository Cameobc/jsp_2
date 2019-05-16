<%@page import="com.iu.notice.NoticeDTO"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    NoticeDTO noticeDTO = new NoticeDTO();
    noticeDTO.setNo(Integer.parseInt(request.getParameter("no")));
    noticeDTO.setTitle(request.getParameter("title"));
    noticeDTO.setContents(request.getParameter("contents"));
    NoticeDAO noticeDAO = new NoticeDAO();
    int result=noticeDAO.update(noticeDTO);
    if(result>0){
    	String msg="Update Success";
    	request.setAttribute("message", msg);
    	request.setAttribute("path", "./noticeList.jsp");
    	RequestDispatcher view = request.getRequestDispatcher("../common/test/result.jsp");
    	view.forward(request, response);
    }else{
		response.sendRedirect("./noticeUpdate.jsp?no="+noticeDTO.getNo());    	
    }
    %>
