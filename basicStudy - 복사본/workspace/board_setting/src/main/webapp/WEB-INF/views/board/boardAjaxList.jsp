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
					
					<tbody id="boardList"> 
					</tbody>
				</table>
<!-- 			<input type="button" id="write" value="작성"></input> -->
			<button  id="write" value="작성" >작성</button>
			<div id="result" style="display:none"></div>
		</div>
	</div>
	
	
</body>


		
<script>
 	$(document).ready(function() { 
		boardAjaxList(); 	// 시작하자마자 리스트 띄워주기 
	}); 
	
	// 게시판 조회 
 	function boardAjaxList(data) { 
		$.ajax({ 
 			type : "GET", 			
 			url : "/board/boardAjaxList",
 			dataType:"json", 
			success : function(data) {
					console.log("게시판 조회 ajax 통신성공 === "+JSON.stringify(data));
					var a = JSON.stringify(data);
					var obj = JSON.parse(a);
					for(var i=0; i<obj.length; i++){
						$('#boardList').append(
								"<tr class='list'>" 
								+ "<td>" + obj[i].boardNum + "</td>" 
								+ "<td>" + obj[i].boardTitle + "</td>" 
								+ "<td>" + obj[i].boardUser + "</td>"
								+ "<td>" + obj[i].boardPostdate + "</td>"
								+ "<td>" + "<button type='button' id='modalDelBtn' >삭제</button>" + "</td>"
								+ "</tr>" 
								+ "<input type='hidden'  value='" + obj[i].boardNum + "' id='Num'></input>"
								)
					}
 			}, 
			error : function() { 
				alert('통신오류'); 
			} 
		}); 
 	}
	
	
	
	// 삭제 함수
	$(document).on("click", "#modalDelBtn", function(){
// $("#modalDelBtn").click(function() {

  var boardNum = $("#Num").val();
//   alert("board넘 뭐들어와" + boardNum)
  $.ajax({
    type : "post",
    url : "/board/AjaxDelete",
    data : {"boardNum": boardNum},
    success : function() {
    	removeTable();
    	boardAjaxList();
    	location.reload();	// 아 이거 없이 안되나 ????? ㅜㅜ
    },
    error : function(status, error){
    	alert("삭제에 실패했습니다. ");
    }
    
  });

});
	
	
	
	// 글쓰기 버튼 눌렀을 때 글쓰기 추가화면
	$('#write').click(function(){
		$("#result").toggle();	// 한번 더 클릭하면 폼 사라지게 하기
		$('#result').html(
			'<form class="form-signin" id="form">'	
			+ "<div class='form-group'>"
			+ '<label for="exampleFormControlInput1">제목</label>'
			+ '<input type="text" class="form-control" id="boardTitle" name="boardTitle" placeholder="제목을 작성해주세요.">'
			+ "</div>"
			+ "<div class='form-group'>"
			+ '<label for="exampleFormControlInput1">작성자</label>'
			+ '<input type="text" class="form-control" id="boardUser" name="boardUser" placeholder="작성자를 적어주세요.">'
			+ "</div>"
			+ "<div class='form-group'>"
			+ '<label for="exampleFormControlInput1">내용</label>'
			+ '<input type="text" class="form-control" id="boardContent" name="boardContent" placeholder="내용을 입력하세요.">'
			+ "</div>"
			+ '<button type="button" class="btn btn-primary" onclick="AjaxCreate()">제출</button>'
			+ "</form>"
		);
	});
	
	// 게시글 작성
	function AjaxCreate(){
		// 벨리데이션 체크
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
		
		// ajax로 폼 내용 넘기기
		var form1 = $("#form").serialize();
		$.ajax({ 
 			type : "post", 			
 			url : "/board/AjaxInsert",
 			data: form1,
 			dataType:"json", 
			success : function(data) {
				removeTable();		// 게시글 작성 폼 지우기
				create(data);		// 새로 만든거 list밑에 추가하기
// 				location.reload(); // 이렇게 쓰면 ajax 쓰는 의미가 없음 --> 화면이동 생김
 			}, 
			error : function() { 
				alert('아작스 통신오류'); 
			} 
		});
	}	
	
	function removeTable(){
		  $('.form-signin').remove();
		  $(".list").remove();		
		  $(".list2").remove();		
		}
	
	function create(data){
		for(let category of data){
			$('#boardList').append(
					"<tr class='list2'>" 
					+ "<td>" + category.boardNum + "</td>" 
					+ "<td>" + category.boardTitle + "</td>" 
					+ "<td>" + category.boardUser + "</td>"
					+ "<td>" + category.boardPostdate + "</td>"
					+ "<input type='hidden' value=" + category.boardNum + "id='Num'></input>"
					+ "<td>" + "<button type='button' id='modalDelBtn'>삭제</button>" + "</td>"
					+ "</tr>" 
					)
		  }
		
	}
	

</script>



</html>