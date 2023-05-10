<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/*리셋코드*/

*{margin:0;padding:0;}
li{list-style:none;}

@font-face {
    font-family: 'GangwonEdu_OTFBoldA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'omyu_pretty';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'KCC-Ganpan';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/KCC-Ganpan.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

#main{width:1440px; margin:35px auto 70px; text-align:center; }
#main #content{width:1440px; height:2400px;text-align:center;}
#main #bottom{width:1440px; height:300px; }
#main #content h2{text-align:left; margin-top:50px; margin-left:160px; font-family: 'KCC-Ganpan'; font-size:27px;}
#content table{width:80%; border-collapse:collapse; margin:60px auto 0; line-height:60px;  font-size:24px; font-family: 'omyu_pretty';}
#content table th{width:100px;padding: 10px;text-align: center; border-top:3px solid #000 ;border-bottom:3px solid #000;}
#content table td{padding: 10px; text-align:center;border-bottom:1px solid #CCCCCC;}
#content table tr th:nth-child(1){width: 40px;}
#content table tr th:nth-child(2){width: 20px;}
#content table tr th:nth-child(3){width: 20px;}
#content table button{width:100px; height:35px; text-align:center; background:#ff9933; border-radius:10px; border:0px solid #ff9933; font-family:'omyu_pretty'; font-size:24px;}


</style>
</head>
<body>
<div id="main">
	
	<%@include file="../header.jsp" %>

	<div id="content">
		<h2>회원 리스트</h2>
		<table>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>삭제</th>
				</tr>
			
				<tr>
					<td>admin</td>
					<td>관리자</td>
					<td>삭제금지</td>
				</tr>
				
				<tr>
					<td>abcd123</td>
					<td>김회원</td>
					<td align="center">
					<button type="button">삭제</button>
					</td>
				</tr>
			
		</table>
		
	</div>
	
	
	
	
	</div>
	
	<div id="bottom">
	</div>

</body>
<%@include file="../footer.jsp" %>
</html>