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
		<h2>게시판</h2>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${boardList}">
						<tr>
							<td>${list.boardNum}</td>	
							<td>
								<a href="${path}/board/listDetail?boardNum=${list.boardNum}">
									<c:out value="${list.boardTitle}"/>	
								</a>
							</td>
							<td>${list.boardUser}</td>
							<td>${list.boardPostdate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		<button type="button" class="btn btn-success"  onClick="location.href='/board/create'">글쓰기</button>
	</div>
</div>




</body>
</html>