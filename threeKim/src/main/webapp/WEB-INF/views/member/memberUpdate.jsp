<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "com.myezen.myapp.domain.*" %>

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

#main{width:1440px; margin:35px auto 70px; text-align:center;}
#main #content{width:1440px; height:2400px;}
#main #bottom{width:1440px; height:300px;}
h2{text-align: center; margin-top:20px;}
#content table {width:60%; border-collapse:collapse; border:1px solid #ddd; margin: 60px auto 0; text-align:center;  line-height:100px; font-family:'omyu_pretty'; font-size:24px;}
#content table th{width:150px; text-align:center; border:1px solid #ddd; padding:8px;}
#content table td{border:1px solid #ddd;padding:8px;text-align:left;}
#content table td:nth-child(1){width:120px;text-align:center;}
#content table td:nth-child(2){width:400px; text-align:left;}
#content table tr:last-child td input{display: inline-block; width:120px; height:50px;}
input{
  font-family: 'omyu_pretty';
  font-size:24px;
  box-sizing: border-box;
  width: 100%;
  padding: 10px;
  margin: 2px 0;
  border: 1px solid #ccc;
  border-radius: 4px;
}

#content table button{width:180px; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#content table button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
</style>
<script type="text/javascript">
function autoHyphen2(target) {
	  target.value = target.value
	    .replace(/[^0-9]/g, '')
	    .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3")
	    .replace(/(\-{1,2})$/g, "");
	}
</script>

<script type="text/javascript">

function fnSubmit() {
	if(confirm("정말 수정하시겠습니까?")) {
		location.href='<%=request.getContextPath()%>/member/memberUpdate.do?memberId='+memberId;
	}
}
</script>


</head>
<body>
<div id="main">

	<%@include file="../header.jsp" %>
	
	<div id="content">
		
		<form action="memberUpdateAction.do" method="post" onsubmit="fnSubmit()">
		<table>
		 <tr>
		    <th colspan="2"><h2>회원정보</h2></th>
		  </tr>
				<tr>
					<th>아이디</th>
					<td>${memberId}</td>
				</tr>
				
				<tr>
					<th>비밀번호</th>
					<td><input type="password" id="memberPwd" name="memberPwd"></td>
				</tr>
				
				<tr>
					<th>이름</th>
					<td><input type="text" id="memberName" name="memberName"></td>
				</tr>
				
				<tr>
					<th>나이</th>
					<td><input type="number" id="memberAge" name="memberAge"></td>
				</tr>
				
				<tr>
					<th>휴대폰번호</th>
					<td><input type="tel" id="memberPhone" name="memberPhone" oninput="autoHyphen2(this)" maxlength="13"></td>
				</tr>
				
				<tr>
					<th>이메일</th>
					<td><input type="text" id="memberEmail" name="memberEmail"></td>
				</tr>
				
				<tr>
					<td colspan="2">
						<button type="submit">수정하기</button>
						<button type="reset">초기화하기</button>
						<button type="button">취소하기</button>
					</td>
					
					
				</tr>
				
		</table>
		</form>

	</div>
	
	
	<div id="bottom">	
	
	</div>





</div>

</body>
<%@include file="../footer.jsp" %>
</html>