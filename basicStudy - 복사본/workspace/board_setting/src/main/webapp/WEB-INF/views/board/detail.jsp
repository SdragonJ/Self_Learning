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
	<h2>게시글 상세</h2>
		
					번호 : 	${listDetail.boardNum}<br><br>
					제목 : 	${listDetail.boardTitle}<br><br>
					작성자 : 	${listDetail.boardUser}<br><br>
					내용 : 	${listDetail.boardContent}<br><br>
		
		<button type="button" class="btn btn-info" onClick="location.href='/board/update?boardNum= ${listDetail.boardNum}'">수정</button>
		<button type="button" class="btn btn-danger" onClick="location.href='/board/delete?boardNum=${listDetail.boardNum}'">삭제</button>
		<button type="button" class="btn btn-primary" onclick="history.back()">목록</button>
	</div>
</div>
	

</body>
</html>