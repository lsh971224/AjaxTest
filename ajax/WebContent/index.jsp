<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width", inital-scale=1">
<link rel ="stylesheet" href="css/bootstrap.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript">
	var request = new XMLHttpRequest();
	function searchFunction(){
		request.open("Post","./UserSearchServlet?userName" +encodeURIComponent(document.getElementById("userName").value),true);
		request.onreadystatechange = searchProcess;
		request.send(null);
	}
	function searchProcess(){
		var table = document.getElementById("ajaxTable");
		table.innerHTML = "";
		if(request.readyState = 4 && request.status ==200){
			var object = eval('(' + request.responseText + ')');
			var result = object.result;
			for(var i=0; i<result.length;i++){
				var row= table.insertRow(0);
				for(var j =0; j<result[i].length;i++){
					var cell = row.insertCell(j);
					cell.innerHTML = result[i][j].value;
				}
			}
		}
	}
</script>
<title>JSP AJAX</title>
</head>
<body>
	<br>
	<div class = "container">
		<div class ="form-group row pull-right">
			<div class="col-xs-8">
				<input class="form-control" id="userName" onkeyup="searchFunction()"type="text" size="20">
			</div>
			<div class="col-xs-2">
				<button class="btn btn-primary" onclick="searchFunction()" type="button">검색</button>
			</div>
			<table class="table" style="text-align:center; border:1px solid #dddddd">
			<thead>
			<tr>
				<th style="boackground-color:#fafafa; text-align:center;">이름</th>
				<th style="boackground-color:#fafafa; text-align:center;">나이</th>
				<th style="boackground-color:#fafafa; text-align:center;">성별</th>
				<th style="boackground-color:#fafafa; text-align:center;">이메일</th>
			</tr>
			</thead>
			<tbody id="ajaxTable">
			</tbody>
			</table>
			
			</div>
	</div>
</body>
</html>