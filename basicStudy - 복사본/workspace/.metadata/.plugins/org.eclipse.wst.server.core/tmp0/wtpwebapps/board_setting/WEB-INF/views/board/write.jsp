<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/common.jsp" %>
<%@ include file="../common/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

<div class="container">
	<div class="row">
		<h2>게시글 작성</h2>
		<form action="/board/insert"  method="post" name=form  onsubmit="return checkAll()">
	    	<div class="form-group">
	              <label for="exampleFormControlInput1">제목</label>
	            <input type="text" class="form-control" id="boardTitle" name="boardTitle" placeholder="제목을 작성해주세요.">
	          </div>
	        <div class="form-group">
	            <label for="exampleFormControlInput1">작성자</label>
	            <input type="text" class="form-control" id="boardUser" name="boardUser" placeholder="작성자를 적어주세요.">
	          </div>
	          <div class="form-group">
	            <label for="exampleFormControlTextarea1">내용</label>
	            <textarea class="form-control" id="boardContent" name="boardContent" placeholder="내용을 입력하세요." rows="10"></textarea>
	          </div>
<!-- 	        <button type="submit" class="btn btn-info" onclick="check()">작성</button> -->
	        <input type="submit" name="join" value="작성" class="btn btn-info">
	        <button type="button" class="btn btn-primary" onclick="history.back()">목록</button>
		</form>
	</div>
</div>	

</body>

<script>
	function checkAll(){
			if($('#boardTitle').val() == ""){ 
				alert("제목을 입력해 주세요");
				return false;
			}
			if($('#boardUser').val() == ""){
				alert("작성자를 입력해 주세요");
				return false;
			}
			if($('#boardContent').val() == ""){
				alert("내용을 입력해 주세요");
				return false;
			}
	}
</script>
</html>