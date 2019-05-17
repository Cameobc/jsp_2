<%@page import="com.iu.point.PointDTO"%>
<%@page import="com.iu.point.PointDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    int curPage=1;
    try{
    	curPage=Integer.parseInt(request.getParameter("curPage"));
    	if(curPage<1){
    		curPage=1;
    	}
    	}catch(Exception e){
    		
    	}
    String kind = request.getParameter("kind");
    if(kind==null){
    	kind="name";
    }else if(kind.equals("c")){
    	kind="contents";
    }else if(kind.equals("w")){
    	kind="writer";
    }else{
    	kind="name";  //kind="writer";
    }
    String search = request.getParameter("search");
    if(search == null){
    	search="";
    }
    System.out.println("kind : "+kind);
    System.out.println("search : "+search);
    int perPage=10;
    int startRow=(curPage-1)*perPage+1;
    int lastRow=curPage*perPage;//10
    //1.총 글의 개수
    PointDAO pointDAO = new PointDAO();
    int totalCount = pointDAO.getTotalCount(kind, search);
    //2.총 페이지 개수
    int totalPage;
    if((totalCount%perPage)==0){
    	totalPage=totalCount/perPage;
    }else{
    	totalPage=totalCount/perPage+1;
    }
    ArrayList<PointDTO> ar = pointDAO.selectList(kind, search, startRow, lastRow);
    //3.블럭 당 개수
    int perBlock = 5;
    //4.총 블럭 개수
    int totalBlock =totalPage/perBlock;
    if(totalPage%perBlock!=0){
    	totalBlock++;
    }
    //5. curPage를 이용해서 현재 block번호 찾기
    int curBlock = curPage/perBlock;
    if(curPage%perBlock!=0){
    	curBlock++;
    }
    //6.curBlock를 이용해서 startNum과 lastNum찾기
    int startNum=(curBlock-1)*perBlock+1;
    int lastNum=curBlock*perBlock;
    if(curBlock==totalBlock){
    	lastNum=totalPage;
    }
    %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<%@include file="../temp/css_meta.jsp" %>

  <style type="text/css">
  .main{
  	min-height: 800px;
  }
  table{
   border-spacing: 0;
   border-collapse: collapse;
  }
  td {
  	width: 100px;
  	height: 40px;
  	
  }
  </style>
</head>
<body>
 <%@include file="../temp/header_nav.jsp" %>
 <%if(curPage>0){ %>
<div class="container main">
	<div class="row">
		<h1>Point Page</h1>
	</div>
	<div class="row">
	<table class="table table-hover">
		<tr>
		<td>NUM</td><td>NAME</td><td>KOR</td><td>ENG</td><td>MATH</td><td>SUM</td><td>AVG</td>
		</tr>
	<%
		for(PointDTO dto : ar){%>
		<tr>
		<td><%=dto.getNum() %></td>
		<td><a href="./pointSelect.jsp?num=<%=dto.getNum() %>"><%=dto.getName() %></a></td>
		<td><%=dto.getKor() %></td>
		<td><%=dto.getEng() %></td>
		<td><%=dto.getMath() %></td>
		<td><%=dto.getSum() %></td>
		<td><%=dto.getAvg() %></td>
		</tr>
	<%}%>
	</table>
	</div>
	<div class="row">
		<form action="./point.jsp">
			<select name="kind">
				<option value="t">Title</option>
				<option value="w">Writer</option>
				<option value="c">Contents</option>
			</select>
			<input type="text" name="search">
			<button>Select</button>
		</form>
	</div>
	<div class= "row">
		<%if(startNum!=1){ %>  <!-- curBlock>1 -->
		<a href="./point.jsp?curPage=<%=startNum-1%>&kind=<%=kind%>&search=<%=search%>">[이전]</a>
		<%} %>
		<% for(int i=startNum;i<=lastNum;i++){ %>
			<a href="./point.jsp?curPage=<%=i %>&kind=<%=kind%>&search=<%=search%>"><%=i %></a>
		<%} %>
		<%if(curBlock<totalBlock){ %>
		<a href="./point.jsp?curPage=<%=lastNum+1%>&kind=<%=kind%>&search=<%=search%>">[다음]</a>
		<%} %>
	</div>
	<div class="row">
		<a href="./pointWrite.jsp" class="btn btn-primary">Write</a>
	</div>
</div>

<%@include file="../temp/footer.jsp" %>
<%}else{ 
	
	response.sendRedirect("./point.jsp?curPage=1");
} %>
</body>
</html>