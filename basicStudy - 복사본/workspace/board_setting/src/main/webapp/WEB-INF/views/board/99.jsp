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

<style>
	#start, #end
	{
		width: 20px;
	}
	table, td
	{
		border: 1px solid #000000;
	}
</style>

<body>
<!-- 	구구단 -->
	<div class="container">
		<div class="row">
			<form>
				<select id="select1"> </select>단 부터
				<select id="select2"> </select> 까지 보여줘요~
				<input id="btn" type="button" value="시작"/>
			</form>
			<table>
				<thead id="guguHead"></thead>
				<tbody id='guguBody'></tbody>
			</table>
		</div>
	</div>
	
<!-- 	글자색 변경 -->
	<div class="container">
		<div class="row">
			<h1>글자색 변경</h1>
			
				<h2 id="바나나">바나나</h2>
				<h2 id="파인애플">파인애플</h2>
				<h2 id="키위">키위</h2>
				
				<select id="과일" >
					<option value="과일선택">과일선택</option>
					<option value="바나나">바나나</option>
					<option value="파인애플">파인애플</option>
					<option value="키위">키위</option>
				</select>
				<select id="색" >
					<option value="색선택">색선택</option>
					<option value="파랑색">파랑색</option>
					<option value="빨간색">빨간색</option>
					<option value="쥐색">쥐색</option>
				</select>
			<input type="button" value="변경" onclick="GoEx()"/>	
		</div>
	</div>	
			  			
</body>

<!-- 글자색 -->
<script type="text/javascript">
	function GoEx(){
	    var fruit = document.getElementById("과일");
	    var color = document.getElementById("색");
	    	
	        if(fruit.value=='바나나'){ // 바나나
	        	if(color.value=='파랑색'){
	        		document.getElementById('바나나').style.color = "blue";
	        	}
	        	if(color.value=='빨간색'){
	        		document.getElementById('바나나').style.color = "#db0d36";
	        	}
	        	if(color.value=='쥐색'){
	        		document.getElementById('바나나').style.color = "#92B3B7";
	        	}
	        } 
	        if (fruit.value=='파인애플'){ // 파인애플
	        	if(color.value=='파랑색'){
	        		document.getElementById('파인애플').style.color = "blue";
	        	}
	        	if(color.value=='빨간색'){
	        		document.getElementById('파인애플').style.color = "#db0d36";
	        	}
	        	if(color.value=='쥐색'){
	        		document.getElementById('파인애플').style.color = "#92B3B7";
	        	}
	        } 
	        if(fruit.value=='키위'){ // 키위
	        	if(color.value=='파랑색'){
	        		document.getElementById('키위').style.color = "blue";
	        	}
	        	if(color.value=='빨간색'){
	        		document.getElementById('키위').style.color = "#db0d36";
	        	}
	        	if(color.value=='쥐색'){
	        		document.getElementById('키위').style.color = "#92B3B7";
	        	}
	        }
	        if(fruit.value=='과일선택'){
	        	alert("변경할 과일을 선택해주세요")
	        }else if(color.value=='색선택'){
	        	alert("변경할 과일색을 선택해주세요")
	        }
	}
</script>

<!-- 구구단 -->
<script>
	//윈도우 로드시
	 window.addEventListener('load', function(){
		// select태그 안에 option값을 셋팅하기위함
		var select1 = document.querySelector('#select1');
		var select2 = document.querySelector('#select2');
		var option = '';
		//option값을 2~9까지 설정
		for(var i=2; i<10; i++){
			option += '<option>' + i + '</option>';
		}
		//html에 삽입
		select1.innerHTML = option;
		select2.innerHTML = option;
		
		//시작버튼
		var btn = document.querySelector('#btn');
		btn.addEventListener('click', function(){
			var array = [];	//단수를 저장할 배열
			var str = ''; //몇단인지 보여줄 문자열
			var str2 = ''; //해당하는 단의 테이블을 출력할 변수
			var str3 = ''; // 2*1 = 2<-이런식으로 textarea에 셋팅해줄 문자열
			// table head부분 2단 3단...9단 
			var guguH = document.querySelector('#guguHead');
			// table body부분 2*1 = 2 .....
			var guguB = document.querySelector('#guguBody');
			
			//만약 첫번째 셀렉트한 값이 두번째 셀렉트한 값보다 작으면 ex)2선택 8선택
			if(Number(select1.value)<Number(select2.value)){
				// 그대로 2~9 순차적
				for(var i=Number(select1.value); i<=Number(select2.value); i++){
					//배열에 push
					array.push(i);	
				}
				//반대로 첫번째 셀렉트한 값이 클경우 ex)8선택 2선택
			}else{
				// 역순으로 출력 8~2 역순
				for(var i=Number(select1.value); i>=Number(select2.value); i--){
					//배열에 push
					array.push(i);		
				}
			}
			str += '<tr>';
			str2 += '<tr>';
			// 배열의 크기만큼 반복
			for(var i=0; i<array.length; i++){
				//테스트 출력
				console.log(array[i]);
				//table head부분 에 들어갈 태그
				str += '<td>' + array[i] + '단</td>';
				for(var j=1; j<10; j++){
					str3 += array[i] + '*' + j + '=' + array[i]*j+ '\n';
				}
				// textarea에 보여질 문자열 
				str2 += '<td><textarea rows="10" cols="10">'+str3+'</textarea>'+'</td>';
				str3 = '';
			}
			str += '</tr>';
			str2 += '</tr>';
			// 값 삽입
			guguH.innerHTML = str;
			guguB.innerHTML = str2;
		});
		
		
	}); 
</script>
</html>