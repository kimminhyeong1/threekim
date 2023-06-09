<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>타:바-모임검색</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_gathering.css">
		<link rel="stylesheet" media="(min-width: 300px) and (max-width: 940px)" href="${pageContext.request.contextPath}/css/style_gathering_mo.css">
		<link rel="icon" href="${pageContext.request.contextPath}/resources/logo/logo7.png">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		 <style type="text/css">
		 	/*검색부분*/
			#SearchPart{margin: 30px 0 30px 0; position: relative;}
			#SearchPart button{position: absolute;width: 50px; height: 50px;border: 0px;background: 0px; top: 3px; right: 380px;}
			#SearchPart img{width: 40px; height: 40px;}
		 </style>
	</head>
	<body>
	<%@include file="../header2.jsp" %>
	<main id="main">
		<section class="gContainer">
			
			<div id="SearchPart">
				<input class="gInput" type="text" placeholder="검색하세요.">
				<button onclick="location.href='<%=request.getContextPath()%>/gathering/gSearchResult.do'"><img src="../resources/icon/loupe.png"></button>
			</div>
			
			<div class="gContentTitle" >
				<h2>검색 키워드: ㅇㅇㅇㅇ</h2>
			</div>
			<div class="gContent" >
				<div class="card" >
					<img class="cardImg" src="../resources/bikeimg/bike.jpg">
					<img class="cardWish" src="../resources/icon/heart.png">
					<h3 class="cardTitle">바이크어썸</h3>
					<p class="cardInfo">자전거를 사랑하는 전주인들의 모임입니다!</p>
					<p>참여멤버(5/10))</p>
					<button class="gBtn" onclick="location.href='<%=request.getContextPath()%>/gathering/gContent.do'">구경하기</button>
				</div>
				<div class="card" >
					<img class="cardImg" src="../resources/bikeimg/bike.jpg">
					<img class="cardWish" src="../resources/icon/heart.png">
					<h3 class="cardTitle">바이크어썸</h3>
					<p class="cardInfo">자전거를 사랑하는 전주인들의 모임입니다!</p>
					<p>참여멤버(5/10))</p>
					<button class="gBtn" onclick="location.href='<%=request.getContextPath()%>/gathering/gContent.do'">구경하기</button>
				</div>
				<div class="card" >
					<img class="cardImg" src="../resources/bikeimg/bike.jpg">
					<img class="cardWish" src="../resources/icon/heart.png">
					<h3 class="cardTitle">바이크어썸</h3>
					<p class="cardInfo">자전거를 사랑하는 전주인들의 모임입니다!</p>
					<p>참여멤버(5/10))</p>
					<button class="gBtn" onclick="location.href='<%=request.getContextPath()%>/gathering/gContent.do'">구경하기</button>
				</div>
				<div class="card" >
					<img class="cardImg" src="../resources/bikeimg/bike.jpg">
					<img class="cardWish" src="../resources/icon/heart.png">
					<h3 class="cardTitle">바이크어썸</h3>
					<p class="cardInfo">자전거를 사랑하는 전주인들의 모임입니다!</p>
					<p>참여멤버(5/10))</p>
					<button class="gBtn" onclick="location.href='<%=request.getContextPath()%>/gathering/gContent.do'">구경하기</button>
				</div>			
			</div>
			<div><button class="gBtn2" >더보기</button></div>
			
			<div class="gContentTitle" >
				<h2>전주 모임 보기</h2>
			</div>
			<div class="gContent" >
				<div class="card" >
					<img class="cardImg" src="../resources/bikeimg/bike.jpg">
					<img class="cardWish" src="../resources/icon/heart.png">
					<h3 class="cardTitle">바이크어썸</h3>
					<p class="cardInfo">자전거를 사랑하는 전주인들의 모임입니다!</p>
					<p>참여멤버(5/10))</p>
					<button class="gBtn" onclick="location.href='<%=request.getContextPath()%>/gathering/gContent.do'">구경하기</button>
				</div>
				<div class="card" >
					<img class="cardImg" src="../resources/bikeimg/bike.jpg">
					<img class="cardWish" src="../resources/icon/heart.png">
					<h3 class="cardTitle">바이크어썸</h3>
					<p class="cardInfo">자전거를 사랑하는 전주인들의 모임입니다!</p>
					<p>참여멤버(5/10))</p>
					<button class="gBtn" onclick="location.href='<%=request.getContextPath()%>/gathering/gContent.do'">구경하기</button>
				</div>
				<div class="card" >
					<img class="cardImg" src="../resources/bikeimg/bike.jpg">
					<img class="cardWish" src="../resources/icon/heart.png">
					<h3 class="cardTitle">바이크어썸</h3>
					<p class="cardInfo">자전거를 사랑하는 전주인들의 모임입니다!</p>
					<p>참여멤버(5/10))</p>
					<button class="gBtn" onclick="location.href='<%=request.getContextPath()%>/gathering/gContent.do'">구경하기</button>
				</div>
				<div class="card" >
					<img class="cardImg" src="../resources/bikeimg/bike.jpg">
					<img class="cardWish" src="../resources/icon/heart.png">
					<h3 class="cardTitle">바이크어썸</h3>
					<p class="cardInfo">자전거를 사랑하는 전주인들의 모임입니다!</p>
					<p>참여멤버(5/10))</p>
					<button class="gBtn" onclick="location.href='<%=request.getContextPath()%>/gathering/gContent.do'">구경하기</button>
				</div>			
			</div>
			<div><button class="gBtn2" >더보기</button></div>
			
			<div class="gContentTitle" >
				<h2>근처 모임 보기</h2>
			</div>
			<div class="gContent" >
				<div class="card" >
					<img class="cardImg" src="../resources/bikeimg/bike.jpg">
					<img class="cardWish" src="../resources/icon/heart.png">
					<h3 class="cardTitle">바이크어썸</h3>
					<p class="cardInfo">자전거를 사랑하는 전주인들의 모임입니다!</p>
					<p>참여멤버(5/10))</p>
					<button class="gBtn" onclick="location.href='<%=request.getContextPath()%>/gathering/gContent.do'">구경하기</button>
				</div>
				<div class="card" >
					<img class="cardImg" src="../resources/bikeimg/bike.jpg">
					<img class="cardWish" src="../resources/icon/heart.png">
					<h3 class="cardTitle">바이크어썸</h3>
					<p class="cardInfo">자전거를 사랑하는 전주인들의 모임입니다!</p>
					<p>참여멤버(5/10))</p>
					<button class="gBtn" onclick="location.href='<%=request.getContextPath()%>/gathering/gContent.do'">구경하기</button>
				</div>
				<div class="card" >
					<img class="cardImg" src="../resources/bikeimg/bike.jpg">
					<img class="cardWish" src="../resources/icon/heart.png">
					<h3 class="cardTitle">바이크어썸</h3>
					<p class="cardInfo">자전거를 사랑하는 전주인들의 모임입니다!</p>
					<p>참여멤버(5/10))</p>
					<button class="gBtn" onclick="location.href='<%=request.getContextPath()%>/gathering/gContent.do'">구경하기</button>
				</div>
				<div class="card" >
					<img class="cardImg" src="../resources/bikeimg/bike.jpg">
					<img class="cardWish" src="../resources/icon/heart.png">
					<h3 class="cardTitle">바이크어썸</h3>
					<p class="cardInfo">자전거를 사랑하는 전주인들의 모임입니다!</p>
					<p>참여멤버(5/10))</p>
					<button class="gBtn" onclick="location.href='<%=request.getContextPath()%>/gathering/gContent.do'">구경하기</button>
				</div>			
			</div>
			<div><button class="gBtn2" >더보기</button></div>
		</section>
	</main>
	<%@include file="../footer.jsp" %>
	</body>
</html>