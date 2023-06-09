<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>타:바-모임-사진첩목록</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_gathering.css">
		<link rel="stylesheet" media="(min-width: 300px) and (max-width: 940px)" href="${pageContext.request.contextPath}/css/style_gathering_mo.css">
		<link rel="icon" href="${pageContext.request.contextPath}/resources/logo/logo7.png">
		<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script><!-- 풀캘린더 라이브러리 -->  
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1">		  
		<style type="text/css">
			.gContainer{border: 1px solid #0000;}
		
		.midmenu:nth-child(3) {color: #05d100 ;} /* 메뉴글자색*/
	 	.card{width: 390px;  height: 420px; cursor:pointer;}
	 	.cardImg{height:77%}
			/*버튼 부분*/
			#createBtn{text-align: right;}	
			/*페이징 부분*/
			.gPaging{font-size: 25px; margin-top:30px;}	
			.gPaging a{padding:10px;}
			.cardTitle {margin-bottom:20px;}	
			/*검색부분*/
			#searchCategory{ width: 100%;text-align: right; font-size: 20px; margin: 20px 30px; height: 30px; font-family: 'omyu_pretty'; border-radius:20px; margin-bottom:40px;} 
			#searchCategory>div{display: inline-block; vertical-align: top;} 
			#searchCategory>div>select{width: 100px; height: 40px; font-size: 24px; font-family: 'omyu_pretty';vertical-align: top; border-radius:20px; text-align: center;border: 1px solid #bbb;} 
			#searchCategory>div>input{width: 300px; height: 38px; font-size: 24px;vertical-align: top; border-radius:20px;border: 1px solid #bbb;} 
			#searchCategory>div>button{width: 100px; height: 40px; margin-top: 0px;margin-bottom: 0px; border-radius:20px;} 

			#empty{line-height: 300px;font-size: 24px;}
			
			
					
			/*************************모바일****************************************/
				/*****모바일 넓이***/
				@media (min-width: 300px) and (max-width: 940px)  {
			/*검색하기 부분*/
			#searchCategory{text-align: right; font-size: 18px; margin: 20px 10px; height: 30px; font-family: 'omyu_pretty';} 
			#searchCategory>div{display: inline-block; vertical-align: top;} 
			#searchCategory>div>select{width:70px; height: 30px; font-size: 15px; font-family: 'omyu_pretty';vertical-align: top;} 
			#searchCategory>div>input{width: 130px; max-width:300px; height: 26px; font-size: 15px;vertical-align: top;} 
			#searchCategory>div>button{width: 50px; height: 30px; margin-top: 0px;margin-bottom: 0px;} 
			
			.gBtn2 {width:100px}
			
			}
		</style>

 <script>
	window.onload = function() {
	    var alertMessage = "${alertMessage}"; //알림 메시지를 가져옴
	    if (alertMessage) {
	        alert(alertMessage); //알림 메시지를 출력
	    }
	}
</script>

	</head>
	<body>
		<%@include file="../header2.jsp" %>
		<%@include file="header3.jsp" %>
		<main id="main">
			<section class="gContainer">
				<div class="gContent" >
				
				<form id="searchCategory" name="frm" action="${pageContext.request.contextPath}/gathering/gPhotoAlbumList.do" method="get">
						<div class="search">
							<select name="searchType">
									<option value="gPhotoAlbumTitle">제목</option>					
							</select>
							<input type="text" name="keyword" size="10">
							<button type="submit" id="searchBtn" class="gBtn2">검색</button>
						</div>
				</form>
				<c:if test="${empty gPhotoList}">
					<div id="empty">사진첩이 없습니다.</div>
				</c:if>	
				<c:if test="${not empty midx}">
					<c:forEach var="gpv" items="${gPhotoList}">
						<div class="card" onclick="window.location.href='<%=request.getContextPath() %>/gathering/gPhotoAlbumContent.do?gpaidx=${gpv.gpaidx}'" >				
							<img class="cardImg" src="../resources/GATImages/${gpv.imageName}">
							<h3 class="cardTitle"> 
							<c:set var="dateString" value="${gpv.gPhotoAlbumWriteDay}" />
							<fmt:parseDate var="date" value="${dateString}" pattern="yyyy-MM-dd HH:mm:ss" />
							<fmt:formatDate value="${date}" pattern="yyyy년 MM월 dd일" />
							</h3>
							<h3 class="cardTitle">${gpv.gPhotoAlbumTitle }</h3>
						</div>	
					</c:forEach>
				</c:if>
				</div>
				
				<div class="gPaging">
				  <c:if test="${pm.prev == true}">
				    <a href="${pageContext.request.contextPath}/gathering/gPhotoAlbumList.do?page=${pm.startPage-1}&serchType=${pm.scri.searchType}&keyword=${pm.encoding(pm.scri.keyword)}">◀</a>
				  </c:if>
				  <c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
				    <a href="${pageContext.request.contextPath}/gathering/gPhotoAlbumList.do?page=${i}&serchType=${pm.scri.searchType}&keyword=${pm.encoding(pm.scri.keyword)}">${i}</a>
				  </c:forEach>
				  <c:if test="${pm.next && pm.endPage > 0}">
				    <a href="${pageContext.request.contextPath}/gathering/gPhotoAlbumList.do?page=${pm.endPage+1}&serchType=${pm.scri.searchType}&keyword=${pm.encoding(pm.scri.keyword)}">▶</a>
				  </c:if>
				</div>
				
				<div id="createBtn">
					<button class="gBtn2" onclick="location.href='${pageContext.request.contextPath}/gathering/gPhotoAlbumWriteCheck.do'">사진첩 만들기</button>
				</div>
			</section>
		</main>
		<%@include file="../footer.jsp" %>
	</body>
</html>