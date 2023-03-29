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
		<h2>게시글 수정</h2>
		<form method="post" action="${path}/board/update?boardNum=${data.boardNum}" onsubmit="return checkAll()">
	    	<div class="form-group">
	              <label for="exampleFormControlInput1">제목</label>
	            <input type="text" class="form-control" id="boardTitle" name="boardTitle" placeholder="제목을 작성해주세요."
	            value="${data.boardTitle}">
	          </div>
	        <div class="form-group">
	            <label for="exampleFormControlInput1">작성자</label>
	            <input type="text" class="form-control" id="boardUser" name="boardUser" placeholder="작성자를 적어주세요."
	            value="${data.boardUser}">
	          </div>
	          <div class="form-group">
	            <label for="exampleFormControlTextarea1">내용</label>
	             <textarea class="form-control" id="boardContent" name="boardContent" placeholder="내용을 입력하세요." rows="10"  value="${data.boardUser}">${data.boardContent}</textarea>
	          </div>
	        <button type="submit" class="btn btn-info">수정</button>
	        <button type="button" class="btn btn-primary" onClick="location.href='/board/board'">목록</button>
		</form>
	</div>
</div>	

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
	

</body>
</html>