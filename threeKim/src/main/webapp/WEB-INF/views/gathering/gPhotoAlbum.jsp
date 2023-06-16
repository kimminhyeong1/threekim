<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>타다-모임-사진첩</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_gathering.css">
		<meta name="viewport" content="width=device-width, initial-scale=1">		  
		<style type="text/css">
			.gContainer{border: 1px solid #0000;}
			/*사진첩 틀*/ 
			.gContent{ width: 100%; border: 1px solid #bbb;background-color: #f1f1f1;border-radius: 10px;}
			/*사진첩 부분*/
			.card{height: 320px; background-color: #d2dfcc;}
			.cardImg{height: 80%;}

			/*버튼 부분*/
			#createBtn{text-align: right;}	
			/*페이징 부분*/
			.gPaging{font-size: 25px;}		
		</style>
	</head>
	<body>
		<%@include file="../header2.jsp" %>
		<%@include file="header3.jsp" %>
		<main id="main">
			<section class="gContainer">
				<div class="gContent" >
				 <c:forEach var="gpv" items="${gPhotoList}">
					<div class="card" >
						<img class="cardImg" onclick="location.href='${pageContext.request.contextPath}/gathering/gPhotoAlbumContent.do'" src="../resources/bikeimg/bike.jpg">
						<h3 class="cardTitle">gpv.gPhotoAlbumDate</h3>
						<h3 class="cardTitle">gpv.gPhotoAlbumTitle</h3>
					</div>
				</c:forEach>
					
					<div class="gPaging">  1-2-3 </div><!-- 페이징 -->
				</div>
				<div id="createBtn">
					<button class="gBtn2" onclick="location.href='${pageContext.request.contextPath}/gathering/gPhotoAlbumWrite.do'">사진첩 만들기</button>
				</div>
				
			</section>
		</main>
		<%@include file="../footer.jsp" %>
	</body>
</html>
