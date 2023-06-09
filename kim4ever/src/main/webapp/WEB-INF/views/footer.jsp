<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<style>
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

footer {width:100%;background-color:#f5f7f8; height:200px; display:flex; justify-content:center; align-items:center; 	font: inherit;   flex-shrink: 0;
 margin-top: 50px}
.foot {display: flex; align-items: center;}
.footer_L, .footer_R{ font-size: 15px;   margin-right:50px; margin-left:50px;}
.footer_L h1{font-size: 40px;}
.footer_R h2{text-align:left;}
@media (max-width: 1500px) {
  footer{width: 1500px;}
  }
@media (min-width: 300px) and (max-width: 940px)  {
 footer {background-color:#eeeeee; height:130px; display:flex; justify-content:center; align-items:center; width: auto;   margin-top: 40px}
.foot {display: flex; align-items: center;}
.footer_L{ font-size: 10px;   margin-right:10px; margin-left:10px;   word-break: keep-all;}
.footer_R{ font-size: 10px; margin-right:10px; margin-left:10px;   word-break: keep-all;}
.footer_L h1{font-size: 10px; }
.footer_R h2{text-align:left; }
.hide{display:none;}
}    

</style>


<footer>
  <div class="foot">
	<div class="footer_L">
		<h1><strong>타 : 바 TABA</strong></h1><hr/><br/>
		<p>법인(상호)TABA | 사업자등록번호 000-11-111111</p>
		<p>주소: 전라북도 전주시 전주동 전주로123 빌딩00층 00호</p>
		<p>대표이사:Kim4ever| 개인정보보호책임자:Kim4ever</p>
		<p>대표전화:063-000-0000</p> 
	</div>
  
	<div class="footer_R"> 
		<h2 class="hide">-타 : 바 소개</h2>      
		<p>타 : 바는 공영자전거 대여 서비스를 제공하는 플랫폼입니다.</p>
		<p class="hide">타 : 바는 "타다 바이크"와 "이거 한번 타봐"라는 의미를 가졌습니다.</p>
		<p>타 : 바를 통해 쉽고 편리하게 공영 자전거를  이용해보세요!</p><br/>
		<h2 class="hide">-타 : 바 이용안내</h2>
		<p class="hide">자전거는 여러종류로 운용중이며 대여료는 일반자전거 기준 1회 대여 시 1,000원입니다.</p>   
		<p>2023 TABA/Kim4ever. All rights reserved.</p>
		<p>Designed by 아이콘: flaticon.com</p>
	</div>
  </div>
</footer>
