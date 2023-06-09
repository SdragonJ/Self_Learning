<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/common.jsp" %>
<%@ include file="../common/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>계산기</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<style>
	 table {
            border-collapse: collapse;
        }
        td {
            padding: 5px 10px;
            text-align: center;
        }
        input {
            text-align: right;
            border: none;
        }
        input:focus {
            outline: none;
        }
</style>

<body>
	<br>
	<table border="1">
        <tr>
	        <td colspan="4">
	            <input type="text" id="display">
	        </td>
	    </tr>
	    <tr>
	        <td colspan="4">
	            <input type="text" id="result" disabled>
	        </td>
	    </tr>
	    <tr>
	        <td colspan="3" onclick="reset()">clear</td>
	        <td onclick="add('/')">/</td>
	    </tr>
	    <tr>
	        <td onclick="add(7)">7</td>
	        <td onclick="add(8)">8</td>
	        <td onclick="add(9)">9</td>
	        <td onclick="add('*')">*</td>
	    </tr>
	    <tr>
	        <td onclick="add(4)">4</td>
	        <td onclick="add(5)">5</td>
	        <td onclick="add(6)">6</td>
	        <td onclick="add('-')">-</td>
	    </tr>
	    <tr>
	        <td onclick="add(1)">1</td>
	        <td onclick="add(2)">2</td>
	        <td onclick="add(3)">3</td>
	        <td onclick="add('+')">+</td>
	    </tr>
	    <tr>
	        <td colspan="2" onclick="add(0)">0</td>
	        <td onclick="add('.')">.</td>
	        <td onclick="calculate()">=</td>
	    </tr>
    </table>
    
<script>
	function add(char) {
	    var display = document.getElementById('display'); // 우리가 식을 입력할 input 태그를 불러옵니다.
	    // display.value는 input 태그 안에 들어 있는 값을 의미합니다.
	    display.value = display.value + char;
	    // display.value += char; 로 쓸 수도 있습니다.
	    // input 태그의 값 뒤에 char 문자를 추가해 주는 역할을 합니다.
	}
	function calculate() {
	    var display = document.getElementById('display');
	    var result = eval(display.value); // 식을 계산하고 result 변수에 저장합니다.
	    document.getElementById('result').value = result;
	}
	function reset() {
	    document.getElementById('display').value = "";
	    document.getElementById('result').value = "";
	}
</script>	
	
	
</body>
</html>