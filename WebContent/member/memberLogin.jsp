<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<jsp:include page="../temp/css_meta.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../temp/header_nav.jsp"></jsp:include>
<body>
<div class="container">
  <h2>LogIn</h2>
  <form action="./memberLoginProcess.jsp" method="post">
    <div class="form-group">
      <label for="Id">id:</label>
      <input type="text" class="form-control" id="id" placeholder="Enter Id" name="id">
    </div>
    <div class="form-group">
      <label for="pw">Password:</label>
      <input type="password" class="form-control" id="pw" placeholder="Enter password" name="pw">
    </div>
    <div class="checkbox">
      <label><input type="checkbox" name="remember"> Remember me</label>
    </div>
    <button type="submit" class="btn btn-default">Login</button>
  </form>
</div>
<jsp:include page="../temp/footer.jsp"></jsp:include>
</body>
</html>