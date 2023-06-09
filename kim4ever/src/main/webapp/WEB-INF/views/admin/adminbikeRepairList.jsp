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
<title>타:바-자전거수리리스트</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/logo/logo6.png">
<style>
/*리셋코드*/

*{margin:0;padding:0;}
li{list-style:none;}
a{color:inherit; text-decoration:none;}


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

#main #content h2{text-align:left; margin-top:50px; margin-left:200px;font-family: 'GangwonEdu_OTFBoldA'; font-size:30px; }
#content table {width:70%; border-collapse:collapse; margin:0 auto; line-height:50px; font-size:20px;font-family:'omyu_pretty'; font-size:24px;}
#content table th{width:100px;padding: 10px;text-align: center; border-top:3px solid #000 ;border-bottom:3px solid #000;}
#content table td{padding: 10px; text-align:center;border-bottom:1px solid #CCCCCC;}
#content table .status-error { color:red; }
#content table .status-complete { color:green; }
#content table tr th:nth-child(1){width:30px;}
#content table tr th:nth-child(2){width:60px;}
#content table tr th:nth-child(3){width:40px;}
#content table tr th:nth-child(4){width:160px;}
#content #bikeError{color: #000; margin-right:10px;} 
#content #bikeRepair{color: #ff7700;} 
#content table button{width:100px; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#content table button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
#content .search {text-align:right; margin-right:185px; margin-bottom:40px;}
#content .search select {width:120px;height:30px;font-size:14px;padding:5px;cursor:pointer;}
#content .search input[type="text"] {width:200px;height:17px;font-size:14px;padding:5px;}
#content .search #searchBtn{width:80px;height:30px;font-size:14px;padding:5px;text-align:center; font-family:'omyu_pretty'; font-size:21px; cursor:pointer; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#content .search #searchBtn:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px}

</style>
</head>
<body>
<%@include file="../header4.jsp" %>
<div id="main">
	<div id="content">	
	<h2><a id="bikeError" href="${pageContext.request.contextPath}/admin/adminbikeError.do">신고 내역</a>  <a id="bikeRepair" href="${pageContext.request.contextPath}/admin/adminbikeRepairList.do">수리 내역</a></h2>
		<form action="${pageContext.request.contextPath }/admin/adminbikeRepairList.do" method="get">
		
		
		  <div class="search">
			<select id="searchType" name="searchType">
				<option value="">검색조건</option>
				<option value="bikeType">자전거종류</option> 
				<option value="bikeCode">자전거번호</option>
				<option value="errorContent">내용</option>
				<option value="bikeState">상태</option>
			</select>
			<input type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요"/>
			<button type="submit" id="searchBtn">검색</button>
		</div>	
		</form>
		<table>
				<tr>
					<th>번호</th>
					<th>자전거종류</th>
					<th>자전거번호</th>		
					<th>내용</th>
					<th>상태</th>			
				</tr>
			<c:forEach var="ejv" items="${elist}">
					<tr>
						<td>${ejv.eidx}</td>						
						<td>${ejv.bikeType}</td>
						<td>${ejv.bikeCode}</td>  
						<td>${ejv.errorContent}</td>
						<td>
							 <c:choose>
						        <c:when test="${ejv.errorState == 'R'}">
						          <button type="button" onclick="confirmRepair(${ejv.eidx},'${ejv.bikeCode}', '${ejv.bikeType}')">수리완료</button>
						        </c:when>
						        <c:when test="${ejv.errorState == 'Y'}">
						        	<span class="status-complete"> 처리완료</span>
						        </c:when>
						         <c:when test="${ejv.errorState == 'E'}">
									<span class="status-error"> 고장</span>
						        </c:when>
						      </c:choose>
						</td>			
					</tr>
			</c:forEach>
		</table>
	
		<table>
			<tr>
				<td>
					<c:if test="${ pm.prev == true }">
					<a href="${pageContext.request.contextPath }/admin/adminbikeRepairList.do?page=${pm.startPage-1}&searchType=${ pm.scri.searchType}&keyword=${ pm.encoding(pm.scri.keyword) } "> ◀</a>
					</c:if>
				</td>
				<td>
					<c:forEach var="i"  begin="${pm.startPage}" end="${pm.endPage}"  step="1" >
						<a href="${pageContext.request.contextPath }/admin/adminbikeRepairList.do?page=${ i }&searchType=${pm.scri.searchType}&keyword=${ pm.encoding(pm.scri.keyword) } ">${ i }</a>
					</c:forEach>	
				</td>
					<td>
					<c:if test="${pm.next&&pm.endPage >0 }">
					<a href="${pageContext.request.contextPath }/admin/adminbikeRepairList.do?page=${pm.endPage+1}&searchType=${pm.scri.searchType}&keyword=${ pm.encoding(pm.scri.keyword) } ">▶</a>
					</c:if>
				</td>
			</tr>
		</table>

	
	</div>

<script>
function confirmRepair(eidx, bikeCode, bikeType) {
  var confirmed = confirm(bikeType + "   " + bikeCode + "\n수리 완료 처리하시겠습니까?");
  if (confirmed) {
    // 확인 버튼을 눌렀을 때 수행할 로직을 여기에 작성하세요.
    location.href = '<%=request.getContextPath()%>/admin/adminbikeRepairYesAction.do?eidx=' + eidx;
  }
}
</script>

<script>
document.addEventListener('DOMContentLoaded', function() {
	  var tdElements = document.querySelectorAll('#content table td:nth-child(4)'); // 네 번째 열(인덱스 3)의 모든 테이블 셀을 선택합니다.

	  tdElements.forEach(function(tdElement) {
	    var textContent = tdElement.textContent;
	    if (textContent.length > 10) {
	      tdElement.textContent = textContent.substring(0, 10) + '...';
	    }
	  });
	});
</script>

</div>
</body>

<%@include file="../footer.jsp" %>
</html>