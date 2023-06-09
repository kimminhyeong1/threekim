<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "com.myezen.myapp.domain.BikeJoinVo" %>
<%@page import = "java.util.*" %>      
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><!-- 날짜태그 -->    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타:바-자전거수리내역</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/logo/logo6.png">
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

#main{width:1440px; margin:35px auto 70px; text-align:center;}
#main #content{width:1440px; height:2400px; text-align:center;}
#main #bottom{width:1440px; height:300px; }
#main #content h2{text-align:left; margin-top:50px; margin-left:150px;font-family: 'GangwonEdu_OTFBoldA'; font-size:27px;}
#content table {width:80%; border-collapse:collapse; margin:60px auto 0; line-height:50px; font-size:20px;font-family:'omyu_pretty'; font-size:24px;}
#content table th{width:100px;padding: 10px;text-align: center; border-top:3px solid #000 ;border-bottom:3px solid #000;}
#content table td{padding: 10px; text-align:center;border-bottom:1px solid #CCCCCC;}
#content table tr th:nth-child(1){width:70px;}
#content table tr th:nth-child(2){width:180px;}
#content table tr th:nth-child(3){width:70px;}
#content table tr th:nth-child(4){width:120px;}
#content table tr th:nth-child(5){width:120px;}
#content table tr th:nth-child(6){width:200px;}
#content table tr th:nth-child(7){width:230px;}
#content table tr th:nth-child(8){width:120px;}
#content table button{width:100px; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#content table button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
</style>
</head>
<body>
<%@include file="../header4.jsp" %>
<div id="main">
	<div id="content">

		<h2>자전거 신고 내역</h2>
		<table>
				<tr>
					<th>고객명</th>
					<th>연락처</th>
					<th>대여소</th>
					<th>자전거종류</th>
					<th>자전거번호</th>		
					<th>신고시간</th>
					<th>내용</th>
					<th></th>					
				</tr>
			<c:forEach var="ejv" items="${elist}">
					<tr>						
						<td>${ejv.memberName}</td>
						<td>${ejv.memberPhone}</td>
						<td>${ejv.rentPlace}</td>
						<td>${ejv.bikeType}</td>
						<td>${ejv.bikeCode}</td>  
						<td>
				            <fmt:parseDate value="${ejv.errorDay}" pattern="yyyy-MM-dd HH:mm" var="parsedRentDay" /><!-- 날짜 변경 -->
            				<fmt:formatDate value="${parsedRentDay}" pattern="yyyy-MM-dd HH:mm" var="formattedRentDay" /><!-- 시간 설정 변경 -->
	           	 			${formattedRentDay}
						</td>   
						<td><a href="${pageContext.request.contextPath}/admin/adminErrorContents.do?eidx=${ejv.eidx}">${ejv.errorContent}</a></td>
						<td><button type="button" onclick="check();">수리 완료</button></td>					
					</tr>
			</c:forEach>
		</table>
	
		
	
		
	
	
	
	
	
	</div>
	
	<div id="bottom">
	</div>
</div>
</body>

<%@include file="../footer.jsp" %>
</html>