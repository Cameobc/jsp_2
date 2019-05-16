<%@page import="com.iu.notice.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    NoticeDAO noticeDAO = new NoticeDAO();
    int curPage=1;
    try{
    	curPage= Integer.parseInt(request.getParameter("curPage"));
    	if(curPage<1){
    		curPage=1;
    	}
    }catch(Exception e){
    	
    }
    int perPage=10;
    int startRow=(curPage-1)*perPage+1;
    int lastRow=curPage*perPage;
    //1.총 글의 개수
    int totalCount= noticeDAO.getCountNum();
    //2. 총 페이지 개수
    int totalPage=totalCount/perPage;
    if(totalCount%perPage!=0){
    	totalPage++;
    }
    try{
    	if(curPage>totalPage){
    		response.sendRedirect("./noticeList.jsp?curPage=1");
    	}
    }catch(Exception e){
    	
    }
    ArrayList<NoticeDTO> ar =noticeDAO.selectList(startRow, lastRow);
    //3. 블럭 당 숫자의 범위
    int perBlock=5;
    
    //4. 총 블럭수
    int totalBlock = totalPage/perBlock;
    if(totalPage%perBlock!=0){
    	totalBlock++;
    }
    
    //5.curPage를 이용해서 현재 블럭 번호 찾기
    int curBlock = curPage/perBlock;
    if(curPage%perBlock !=0){
    	curBlock++;
    }
    //6.curBlock를 이용해서 startNum과 lastNum 찾기
    int startNum=(curBlock-1)*perBlock+1;
    int lastNum= perBlock*curBlock;
    
    //7.curBlock이 마지막 블록일 때 lastNum을 다시 대입하기
    if(curBlock == totalBlock){
    	lastNum=totalPage;
    }
    %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<%@include file="../temp/css_meta.jsp" %>
<style type="text/css">
#btn{
	display: none;
}
</style>
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
					<td class="select" title="<%=dto.getNo() %>"><%=dto.getTitle() %></td>
					<td><%=dto.getWriter() %></td>
					<td><%=dto.getReg_date() %></td>
					<td><%=dto.getHit() %></td>
				</tr>
			<%}%>
		</table>
	</div>
	<div class="row">
		<form class="row" action="./noticeSelect.jsp" method="post">
			<input type="hidden" id="n" name="no">
		</form>
	</div>
	<div class="row">
		<%if(curBlock>1) {%>
		<a href="./noticeList.jsp?curPage=<%=startNum-1 %>">[이전]</a>
		<%} %>
		<%for(int i=startNum;i<=lastNum;i++){ %>
			<a href="./noticeList.jsp?curPage=<%=i%>"><%=i %></a>
		<%} %>
		<%if(curBlock<totalBlock){ %>
		<a href="./noticeList.jsp?curPage=<%=lastNum+1%>">[다음]</a>
		<%} %>
	</div>
	<div class="row">
		<a href ="./noticeWrite.jsp"><button class="btn btn-danger">Write</button></a>
	</div>
</div>
<%@include file="../temp/footer.jsp" %>
<script type="text/javascript">
	$('.select').click(function() {
		var n=$(this).attr('title');
		$('#n').val(n);
		$('form').submit();
	});
</script>
</body>
</html>