<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "com.myezen.myapp.domain.BikeJoinVo" %>
<%@page import = "java.util.*" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
ArrayList<BikeJoinVo> klist = (ArrayList<BikeJoinVo>)request.getAttribute("klist");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타:바-리뷰리스트</title>
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

#main{width:1250px; margin:35px auto 70px; text-align:center; }
#main #content{width:1250px; height:2400px;text-align:center;}
#main #bottom{width:1250px; height:300px; }
#content table .status-available { color:green; }
#content table .status-rented { color:orange; }
#content table .status-disuse { color:red; }
#content table .status-error { color:red; }
#content #reviewList{color: #ff7700; } 
#content #bikeList{color:#000; margin-right:10px;}
#main #content h2{text-align:left; margin-top:50px; margin-left:200px;font-family: 'GangwonEdu_OTFBoldA'; font-size:30px;}
#content p{text-align:right; margin-right:200px;}
#content table {width:70%; border-collapse:collapse; margin:0 auto; line-height:50px; font-size:20px;font-family:'omyu_pretty'; font-size:24px;}
#content table th{width:100px;padding: 10px;text-align: center; border-top:3px solid #000 ;border-bottom:3px solid #000;}
#content table td{padding: 10px; text-align:center;border-bottom:1px solid #CCCCCC;}
#content #bikeAddBtn button{width:250px; height:40px; margin-top:20px; margin-left:630px; text-align:center; cursor:pointer; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#content #bikeAddBtn button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
#content table tr th:nth-child(1){width:40px;}
#content table tr th:nth-child(2){width:90px;}
#content table tr th:nth-child(3){width:130px;}

#content table button{width:100px; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px;  border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#content table button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
#content .search {text-align:right; margin-right:185px; margin-bottom:40px;}
#content .search select {width:120px;height:30px;font-size:14px;padding:5px; cursor:pointer;}
#content .search input[type="text"] {width:200px;height:17px;font-size:14px;padding:5px;}
#content .search #searchBtn{width:80px;height:30px;font-size:14px;padding:5px;text-align:center; font-family:'omyu_pretty'; font-size:21px; cursor:pointer; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#content .search #searchBtn:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px}



</style>

</head>

<body>

<div id="main">
	<%@include file="../header4.jsp"%>
	
	<div id="content">
		<h2>
		<a id ="bikeList" href="${pageContext.request.contextPath}/admin/adminbikeList.do">자전거 리스트</a>
		<a id ="reviewList" href="${pageContext.request.contextPath}/admin/adminreviewList.do">리뷰 내역</a>
		</h2>
		
			<form action="${pageContext.request.contextPath}/admin/adminreviewList.do" method="get">
				<div class="search">
					<select id="searchType" name="searchType">
						<option value="">검색조건</option>
						<option value="rvidx">번호</option> 
						<option value="reviewContent">내용</option>
						<option value="reviewWriteDay">작성일</option>
					</select>
					<input type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요"/>
					<button type="submit" id="searchBtn">검색</button>
				</div>
			</form>
		
		<table>
			<tr>
				<th>번호</th>
				<th>작성일</th>
				<th>내용</th>
			</tr>
	
		<c:forEach var="rv" items="${rvlist}">
			<tr>
				<td>${rv.rvidx}</td>
				<td>${rv.reviewWriteDay}</td>		
				<td>					
				  <a href="adminreviewDetail.do?rvidx=${rv.rvidx}" class="review-content">${rv.reviewContent}</a>
				</td>					
			</tr>
		</c:forEach>		
		</table>
		
		
		
			<table>
			<tr>
				<td>
					<c:if test="${ pm.prev == true }">
					<a href="${pageContext.request.contextPath }/admin/adminreviewList.do?page=${pm.startPage-1}&searchType=${ pm.scri.searchType}&keyword=${ pm.encoding(pm.scri.keyword) } "> ◀</a>
					</c:if>
				</td>
				<td>
					<c:forEach var="i"  begin="${pm.startPage}" end="${pm.endPage}"  step="1" >
						<a href="${pageContext.request.contextPath }/admin/adminreviewList.do?page=${ i }&searchType=${pm.scri.searchType}&keyword=${ pm.encoding(pm.scri.keyword) } ">${ i }</a>
					</c:forEach>	
				</td>
					<td>
					<c:if test="${pm.next&&pm.endPage >0 }">
					<a href="${pageContext.request.contextPath }/admin/adminreviewList.do?page=${pm.endPage+1}&searchType=${pm.scri.searchType}&keyword=${ pm.encoding(pm.scri.keyword) } ">▶</a>
					</c:if>
				</td>
			</tr>
		</table>
	
	
	
	
	</div>
	
<script>
document.addEventListener('DOMContentLoaded', function() {
  var tdElements = document.querySelectorAll('.review-content');

  tdElements.forEach(function(tdElement) {
    var textContent = tdElement.textContent;

    if (textContent.length > 15) {
      tdElement.textContent = textContent.substring(0, 15) + '...';
    }
  });
});
</script>

	
	
	
	
</div>
	
	<div id="bottom">
	</div>

</body>
<%@include file="../footer.jsp" %>
</html>