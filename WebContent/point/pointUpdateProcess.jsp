<%@page import="com.iu.point.PointDAO"%>
<%@page import="com.iu.point.PointDTO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
	PointDTO pointDTO = new PointDTO();
    pointDTO.setNum(Integer.parseInt(request.getParameter("num")));
	pointDTO.setName(request.getParameter("name"));
	pointDTO.setKor(Integer.parseInt(request.getParameter("kor")));
	pointDTO.setEng(Integer.parseInt(request.getParameter("eng")));
	pointDTO.setMath(Integer.parseInt(request.getParameter("math")));
	pointDTO.setSum(pointDTO.getKor()+pointDTO.getEng()+pointDTO.getMath());
	pointDTO.setAvg(pointDTO.getSum()/3.0);
	
	PointDAO pointDAO = new PointDAO();
	int result = pointDAO.update(pointDTO);
	//수정 성공하면 성공메세지 alert으로 띄우고  point.jsp로 이동
	//수정 실패하면 pointUpdate.jsp로 이동 리다이렉트
	if(result>0){
		String msg="update Success";
		request.setAttribute("message", msg);
		request.setAttribute("path", "./point.jsp");
		RequestDispatcher view = request.getRequestDispatcher("../common/test/result.jsp");
		view.forward(request, response);
	}else{
		response.sendRedirect("./pointUpdate.jsp?num="+pointDTO.getNum());
	}
	
	
%>
