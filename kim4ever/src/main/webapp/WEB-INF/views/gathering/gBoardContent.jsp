<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>타:바-모임-게시글보기</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_gathering.css">
		<link rel="stylesheet" media="(min-width: 300px) and (max-width: 940px)" href="${pageContext.request.contextPath}/css/style_gathering_mo.css">	
		<link rel="icon" href="${pageContext.request.contextPath}/resources/logo/logo7.png">	
		
 
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1">		
		<style type="text/css">
			a{text-decoration: none; color: #000;}	
			.gContainer{border: 1px solid #0000;}
			/*게시글 틀*/ 
			.gBoardList { width: 100%; border: 1px solid #bbb;background-color: #fbfdfa;border-radius: 10px;position: relative;  border-radius:20px;}
			/*게시글 멤버 부분*/
			.gBoardMember{text-align: left; font-size: 20px; margin: 20px 60px; position: relative;} 
			.gBoardMember .gBoardMember_box{display: inline-block;} 
			.gBoardMember>div>div:nth-child(1){width: 50px; height: 50px; float: left;}/*프로필*/ 
			.gProfileimage img{width: 50px; height: 50px;  object-fit: cover; border-radius: 50%;border: 1px solid #bbb;}/*프로필이미지*/
			.gBoardMember>div>div:nth-child(2){height: 25px; margin-left: 70px;}/*모임장,이름*/ 
			.gBoardMember>div>div:nth-child(2)>div{display: inline-block; margin-top: 5px;} 
			.gBoardMember>div>div:nth-child(3)>div{height: 25px; margin-left: 70px; font-size: 15px; margin-top: 5px;}/*날짜*/
			.gBoardMember>div>div:nth-child(4){font-size: 18px; margin-top: 20px;  padding-bottom: 20px;width: 950px;word-wrap: break-word;}/*게시글 내용*/
			/*게시글 글 부분*/
			.gBoardView{text-align: left; font-size: 20px; margin: 40px 60px;  word-wrap:break-word; white-space: pre-line;} 
			.gBoardView>div:nth-child(1){font-size: 30px; clear: both;margin-top: 10px; font-weight: bold;}/*게시글제목*/
			.gBoardView>div:nth-child(1)>span{font-size: 18px;margin-left: 10px;}/*게시글 카테고리*/
			.gBoardView>div:nth-child(2){font-size: 18px; margin-top: 100px; border-bottom: 2px solid #bbb; padding-bottom: 100px;}/*게시글 내용*/
			/*버튼 부분*/
			.writeBtn{width: 10%; height: 50px;margin-top: 14px;text-align: center;font-family: 'omyu_pretty';font-size: 21px;border-radius: 20px;border: 0px solid #99CC99;background: #05d100; vertical-align: top; color:white;}
			.writeBtn:active {background: #2bd727b5;box-shadow: 0 2px 2px rgba(0,0,0,0.1);transform: translateY(2px);}
			.modifyBtn{width: 10%; height: 50px;margin-top: 14px;text-align: center;font-family: 'omyu_pretty';font-size: 21px;border-radius: 20px;border: 0px solid #99CC99;background: #05d100; vertical-align: top; color:white;}
			.modifyBtn:active {background: #2bd727b5;box-shadow: 0 2px 2px rgba(0,0,0,0.1);transform: translateY(2px);}
			.replyBtn{width: 8%; height: 35px; position: absolute;right: 35px;top: 50px;margin-top: 14px;text-align: center;font-family: 'omyu_pretty';font-size: 21px;border-radius: 20px;border: 0px solid #99CC99;background: #05d100; vertical-align: top; color:white;}
			.replyBtn:active {background: #2bd727b5;box-shadow: 0 2px 2px rgba(0,0,0,0.1);transform: translateY(2px);}
			.replyCommentBtn{width: 10%; height: 50px;margin-top: 14px;text-align: center;font-family: 'omyu_pretty';font-size: 21px;border-radius: 20px;border: 0px solid #99CC99;background: #05d100; vertical-align: top; color:white;}
			.replyCommentBtn:active {background: #2bd727b5;box-shadow: 0 2px 2px rgba(0,0,0,0.1);transform: translateY(2px);}
			.hidden {display: none; }
		    .fade-in {
		      animation: fadeIn 0.2s ease-in;
		    }
		
		    @keyframes fadeIn {
		      from {
		        opacity: 0;
		      }
		      to {
		        opacity: 1;
		      }
		    }
			/*페이징 부분*/
			.gPaging{font-size: 24px; margin-top:40px;  margin-bottom:20px;}
			/*댓글타이틀*/		
			.gBoardCommentTitle{text-align: left;margin-left: 60px;margin-top: 30px;font-size: 25px;font-weight: bold;}
			/*좋아요 부분*/
			.gBoardLike div{margin-bottom: 20px;margin-top: 10px;}
			/*설정 부분*/
			.gBoardSettingBtn{position: absolute; right: 0px;top: 0px; width: 100px; z-index: 5;}	
			.gBoardSettingBtn img{width: 35px;}
			.gBoardSettingBtn ul{background: #05d100;border-radius: 20px;width: 110px;padding: 20px; color:white; font-size:24px; }
			.gBoardSettingBtn ul a:hover{color:black;}
			.gBoardSettingBtn li{margin: 5px;  cursor: pointer;}
			/*댓글 쓰는 부분*/
			.gBoardCommentWrite{position: relative;}
			.gBoardCommentWrite textarea{resize: none;padding: 20px;font-size: 18px; width: 580px; height: 40px; border-radius:20px;}
			.modifycommentForm{position: relative; text-align: center;width: 1120px;}
			.modifycommentForm textarea{resize: none;padding: 20px;font-size: 18px; width: 580px; height: 40px;margin-right: 5px; border-radius:20px;}
			.ReplyCommentForm{position: relative; text-align: center;width: 1120px;}
			.ReplyCommentForm textarea{resize: none;padding: 20px;font-size: 18px; width: 580px; height: 40px;margin-right: 5px; border-radius:20px;}
			#characterCount{position: absolute;top: 60px;right: 390px;} /*댓글카운터*/
			#replyCharacterCount{position: absolute;top: 60px;right: 320px;}
			.modifycommentForm span{position: absolute;top: 60px;right: 320px;}
			/*답장부분*/
			.reply_ba{display: inline-block;vertical-align: top;}
			.reply_ba img{width: 40px;}
			.under_ba{border-bottom: 2px solid #bbb;}
			.gPaging a{padding:10px;}
			
							/*************************모바일****************************************/
				/*****모바일 넓이***/
				@media (min-width: 300px) and (max-width: 940px)  {
			#main{width:auto; margin:0 auto; text-align:center;}
			#main #content{width:auto; height:auto; ;}
		
			/*게시글 틀*/ 
			.gBoardList { width: 99%; position: relative; margin-top:20px;}
			/*게시글 멤버 부분*/
			.gBoardMember{text-align: left; font-size: 20px; margin: 45px 30px; position: relative;} 
			.gBoardMember .gBoardMember_box{display: inline-block;} 
			.gBoardMember>div>div:nth-child(1){width: 50px; height: 50px; float: left;}/*프로필*/ 
			.gProfileimage img{width: 45px; height: 45px;  object-fit: cover; border-radius: 50%;}/*프로필이미지*/
			.gBoardMember>div>div:nth-child(2){height: 25px; margin-left: 70px;}/*모임장,이름*/ 
			.gBoardMember>div>div:nth-child(2)>div{display: inline-block; margin-top: 5px;} 
			.gBoardMember>div>div:nth-child(3)>div{height: 25px; margin-left: 70px; font-size: 15px; margin-top: 5px;}/*날짜*/
			.gBoardMember>div>div:nth-child(4){font-size: 18px; margin-top: 20px;  padding-bottom: 20px;width: 100%;word-wrap: break-word;}/*게시글 내용*/
			/*게시글 글 부분*/
			.gBoardView{text-align: left; font-size: 20px; margin: 20px 30px;} 
			.gBoardView>div:nth-child(1){font-size: 20px; clear: both;margin-top: 10px; }/*게시글제목*/
			.gBoardView>div:nth-child(1)>span{font-size: 18px;margin-left: 10px;}/*게시글 카테고리*/
			.gBoardView>div:nth-child(2){font-size: 18px; margin-top: 20px; border-bottom: 2px solid #bbb; padding-bottom: 100px;}/*게시글 내용*/
			/*버튼 부분*/
			.writeBtn{width: 100px; height: 30px;margin-top: 14px;text-align: center;font-family: 'omyu_pretty';font-size: 21px; vertical-align: top;}
			.writeBtn:active {background: #339933;box-shadow: 0 2px 2px rgba(0,0,0,0.1);transform: translateY(2px);}
			.modifyBtn{width: 80px; height: 30px;margin-top: 14px;text-align: center;font-family: 'omyu_pretty';font-size: 21px; vertical-align: top; float:right; margin-right: 25px; margin-bottom:20px;}
			.modifyBtn:active {background: #339933;box-shadow: 0 2px 2px rgba(0,0,0,0.1);transform: translateY(2px);}
			.replyBtn{width: 80px; height: 30px; position: absolute;right: 5px;top: 110px;margin-top: 14px;text-align: center;font-family: 'omyu_pretty';font-size: 21px; vertical-align: top;}
			.replyBtn:active {background: #339933;box-shadow: 0 2px 2px rgba(0,0,0,0.1);transform: translateY(2px);}
			.replyCommentBtn{width: 100px; height: 30px;margin: 15px 30px 30px 0px;text-align: center;font-family: 'omyu_pretty';font-size: 21px; vertical-align: top; float:right;}
			.replyCommentBtn:active {box-shadow: 0 2px 2px rgba(0,0,0,0.1);transform: translateY(2px);}
			.hidden {display: none; }
		    .fade-in {
		      animation: fadeIn 0.2s ease-in;
		    }
		
		    @keyframes fadeIn {
		      from {
		        opacity: 0;
		      }
		      to {
		        opacity: 1;
		      }
		    }
			/*페이징 부분*/
			.gPaging{font-size: 25px;}
			/*댓글타이틀*/		
			.gBoardCommentTitle{text-align: left;margin-left: 30px;margin-top: 30px;font-size: 18px;}
			/*좋아요 부분*/
			.gBoardLike div{margin-bottom: 20px;margin-top: 10px;}
			/*설정 부분*/
			.gBoardSettingBtn{position: absolute; right: 15px;top: 0px; width: 0px; z-index: 5;}	
			.gBoardSettingBtn img{width: 35px;}
			.gBoardSettingBtn ul{width: 80px;padding: 5px; position: absolute; margin-right:0px; right:-10px; font-size:18px;}
			.gBoardSettingBtn li{margin: 5px;  cursor: pointer;}			
				.gBoardSettingBtn li:nth-child(1){margin-bottom:10px;}
			/*댓글 쓰는 부분*/
			.gBoardCommentWrite{position: relative;}
			.gBoardCommentWrite textarea{resize: none;padding: 20px;font-size: 18px; width: 80%; height: 40px;}
			.modifycommentForm{position: relative; text-align: center;width: 100%;}
			.modifycommentForm textarea{resize: none;padding: 20px;font-size: 18px; width: 80%; height: 40px;margin-right: 5px;}
			.ReplyCommentForm{position: relative; text-align: center;width: 100%;}
			.ReplyCommentForm textarea{resize: none;padding: 20px;font-size: 18px; width: 80%; height: 40px;margin-right: 5px; margin-top:40px;}
			#characterCount{position: absolute;  top: 85px; right: 0px;  margin: 0 auto; margin-right: 35px;} /*댓글카운터*/
			#replyCharacterCount{position: absolute;  top: 125px;  right: 30px;  font-size: 15px; margin: 0 auto;}
			.modifycommentForm span{position: absolute;top: 85px;right: 30px; margin:0 auto; font-size:15px;}
			/*답장부분*/
			.reply_ba{display: inline-block;vertical-align: top;}
			.reply_ba img{width: 40px;}
			.under_ba{border-bottom: 2px solid #bbb;}
			.gBoardLike{width:100px; margin:0 auto;}
			
			
			}
		</style>
		<script>
			$(document).ready(function() {
			});
			
			function characterCheck(obj){
				var regExp =/[\{\}\[\]\/|\)*`^\_┼<>@\#$%&\'\"\\(\=]/gi;
			    if(regExp.test(obj.value)){
			        alert("특수문자는 입력할 수 없습니다.");
			        obj.value = obj.value.substring( 0 , obj.value.length - 1 );
			    }
			}
			function fnWrite() {
			    var fm = document.frm;
			    
			    // 특수문자 검사 정규식
			    var specialChars =/[\{\}\[\]\/|\)*`^\_┼<>@\#$%&\'\"\\(\=]/gi; 
			    
			    if (fm.subject.value == "") {
			        alert("내용을 입력하세요");
			        fm.subject.focus();
			        return;
			    } else if (specialChars.test(fm.subject.value)) {
			        alert("제목에 특수문자를 포함할 수 없습니다.");
			        fm.subject.focus();
			        return;
			    
			    }

			  
			}
		</script>
	</head>
	<body>
		<%@include file="../header2.jsp" %>
		<%@include file="header3.jsp" %>
		<main id="main">
			<section class="gContainer">
				<div class="gBoardList">
					<div class="gBoardMember">
						<div>
							<div class="gProfileimage"><img alt="프로필사진" src="${pageContext.request.contextPath}/resources/MemberProfile/${gjv.memberProfile}"></div>
							<div>
								<c:set var="gatheringMemberType" value="${gjv.gatheringMemberType}" />
								<c:choose>
								    <c:when test="${gatheringMemberType eq 'TL'}">
								        <div>모임장</div>
								    </c:when>
								    <c:when test="${gatheringMemberType eq 'TLD'}">
								        <div>[부]모임장</div>
								    </c:when>
								    <c:otherwise>
								        <div>모임원</div>
								    </c:otherwise>
								</c:choose>
								<div>${gjv.memberName}</div>
							</div>
							<div>
								<div>
									<fmt:parseDate value="${gjv.gBoardWriteDay}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedRentDay" />
									<fmt:formatDate value="${parsedRentDay}" pattern="yyyy-MM-dd HH:mm" var="formattedRentDay" />
									${formattedRentDay}
									<span>${gjv.gBoardCategory}</span><span>&nbsp;&nbsp;&nbsp;조회수[${gjv.gBoardViewsCNT}회]</span>
								</div>
							</div>		
						</div>
						<c:if test="${gjv.midx eq midx}">
							<div class="gBoardSettingBtn" id="settingBtn">
								<img alt="설정리스트" src="${pageContext.request.contextPath}/resources/btn/settingBtn.png">
								<ul id="list" class="hidden fade-in">
								  <li><a href="${pageContext.request.contextPath}/gathering/gBoardModify.do?gbidx=${gjv.gbidx}">게시글 수정</a></li> 
								  <li><a href="${pageContext.request.contextPath}/gathering/gBoardDelete.do?gbidx=${gjv.gbidx}">게시글 삭제</a></li>
								</ul>
							</div>
						</c:if>		
					</div>
					<div class="gBoardView">
						<div>${gjv.gBoardTitle}</div>
						<div>${gjv.gBoardContents}</div>
					</div>
					<div class="gBoardLike">
						 <img alt="좋아요" src="${pageContext.request.contextPath}/resources/icon/like.png" style="width: 50px;">
						 <div>${gjv.gBoardLikeCNT}</div>
					</div>
					<div class="gBoardCommentWrite">
					  <form id="commentForm"  name="frm" >
					    <input id="gbidx" type="hidden" name="gbidx" value="${gbidx}">
					    <textarea id="gCommentContents" rows="5" cols="100" maxlength="200" name="gCommentContents" onkeyup="characterCheck(this)" onkeydown="characterCheck(this)" oninput="updateCharacterCount()"></textarea>
					    <span id="characterCount">0/200</span>
					    <button class="writeBtn">댓글달기</button>
					  </form>
					</div>
					<div class="gBoardCommentTitle">댓글(${commentTotal})</div>
			    	<c:forEach var="gjvc" items="${gjvclist}">
						<div class="gBoardMember">
					    	<c:if test="${gjvc.gCommentDepth eq 1}">
			    			<div class="reply_ba"><img alt="답장하기" src="${pageContext.request.contextPath}/resources/icon/reply.png"></div>
					    	</c:if>
							<div class="gBoardMember_box">
								<div class="gProfileimage"><img alt="프로필사진" src="${pageContext.request.contextPath}/resources/MemberProfile/${gjvc.memberProfile}"></div>
								<div>
									<c:set var="gatheringMemberType" value="${gjvc.gatheringMemberType}" />
									<c:choose>
									    <c:when test="${gatheringMemberType eq 'TL'}">
									        <div style="color: #f00;">모임장</div>
									    </c:when>
									    <c:when test="${gatheringMemberType eq 'TLD'}">
									        <div style="color: #ff8400d6;">[부]모임장</div>
									    </c:when>
									    <c:otherwise>
									        <div>모임원</div>
									    </c:otherwise>
									</c:choose>
									<div>${gjvc.memberName}</div>
								</div>
								<div>
									<div>
										<fmt:parseDate value="${gjvc.gCommentWriteDay}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedRentDay" />
										<fmt:formatDate value="${parsedRentDay}" pattern="yyyy-MM-dd HH:mm" var="formattedRentDay" />
										${formattedRentDay}
									</div>
								</div>					
								<div class="PgCommentContents" data-gbidx="${gjvc.gbidx}" data-gcidx="${gjvc.gcidx}">					
									${gjvc.gCommentContents}
								</div>
								<c:if test="${gjvc.midx eq midx}">
									<div class="gBoardSettingBtn SettingBtn2">
										<img alt="설정리스트" src="${pageContext.request.contextPath}/resources/btn/settingBtn.png">
							            <ul class="hidden fade-in">
							                <li onclick="modifyComment(${gjvc.gbidx}, ${gjvc.gcidx})">댓글 수정</li>
											<li onclick="deleteComment(${gjvc.gbidx}, ${gjvc.gcidx})">댓글 삭제</li>
							            </ul>
									</div>
								</c:if> 
								<div>
							    	<c:if test="${gjvc.gCommentDepth eq 0}">
					    				<button type="button" class="replyBtn" onclick="replyComment(${gjvc.gbidx}, ${gjvc.gcidx},this)">답장하기</button>
							    	</c:if>
								</div>
							</div>
							<div class="under_ba"></div>
						</div>
					</c:forEach>	
					<div class="gPaging">
						<c:if test="${pm.prev == true}">
							<a href="${pageContext.request.contextPath}/gathering/gBoard/${gjv.gbidx}/Content.do?page=${pm.startPage-1}">◀</a>
						</c:if><!--if문-end-->
						<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
						<a href="${pageContext.request.contextPath}/gathering/gBoard/${gjv.gbidx}/Content.do?page=${i}">${i}</a>
						</c:forEach><!--for문-end-->
						<c:if test="${pm.next && pm.endPage > 0}">
							<a href="${pageContext.request.contextPath}/gathering/gBoard/${gjv.gbidx}/Content.do?page=${pm.endPage+1}">▶</a>
						</c:if><!--if문-end-->
					</div><!-- 페이징 -->
		 		</div>
			</section>
		</main>
		<%@include file="../footer.jsp" %>
		<script>
		  //게시판 설정리스트
		  const settingBtn = document.getElementById('settingBtn');
		  const list = document.getElementById('list');
		
		  // settingBtn에 클릭 이벤트 리스너를 추가
		  settingBtn.addEventListener('click', function() {
		    // list의 'hidden' 클래스를 토글
		    list.classList.toggle('hidden');
		  });
		</script>
		<script>
		    // 댓글 설정리스트
		    const settingBtns = document.querySelectorAll('.SettingBtn2');
		
		    // 각 gBoardSettingBtn 요소 반복
		    settingBtns.forEach(function(settingBtn) {

		        const list = settingBtn.querySelector('ul');
		
		        settingBtn.addEventListener('click', function() {

		            list.classList.toggle('hidden');
		        });
		    });
		</script>
		<script type="text/javascript">
		    function submitComment() {
		    	
		        var gCommentContents = $("#gCommentContents").val();
		        var gbidx = $("#gbidx").val();
		        
		     	// 현재 스크롤 위치 저장
		        var scrollPosition = $(window).scrollTop();
		
		        $.ajax({
		            type: "POST",
		            url: "${pageContext.request.contextPath}/gathering/gBoardComment.do",
		            data: { gCommentContents: gCommentContents, gbidx: gbidx },
		            success: function(data) {
		                if (data.value == 1) {
		                    alert("댓글이 성공적으로 등록되었습니다.");
		                    // 등록 성공 시 댓글 새로고침
		                    location.reload();
		                    // 페이지 새로고침 후 스크롤 위치 복원
		                    $(window).scrollTop(scrollPosition);
		                } else {
		                    alert("댓글 등록에 실패했습니다.");
		                }
		            },
		            error: function(xhr, status, error) {
		                console.error("댓글 제출 중 오류 발생: " + error);
		            }
		        });
		    }
		
		    // "댓글" 버튼을 클릭할 때 폼 제출
		    $(".writeBtn").click(function(event) {
		        event.preventDefault(); // 버튼 클릭 동작 방지
		        if ($("#gCommentContents").val().trim() !== "") { // 텍스트영역이 비어 있지 않거나 공백 문자만 포함되지 않았는지 확인
		        	submitComment();
		        }
		    });
		    function deleteComment(Pgbidx, Pgcidx) {
		     	// 현재 스크롤 위치 저장
		        var scrollPosition = $(window).scrollTop();
	
		        $.ajax({
		            type: "POST",
		            url: "${pageContext.request.contextPath}/gathering/gBoardDeleteComment.do",
		            data: { gbidx: Pgbidx, gcidx: Pgcidx },
		            success: function(data) {
		            	if (data.value == 1) {
		                    alert("댓글이 성공적으로 삭제되었습니다.");
		                    // 등록 성공 시 댓글 새로고침
		                    location.reload();
		                    // 페이지 새로고침 후 스크롤 위치 복원
		                    $(window).scrollTop(scrollPosition);
		                } else {
		                    alert("댓글 삭제에 실패했습니다.");
		                }
		            },
		            error: function(xhr, status, error) {
	
		            }
		        });
		    }
		    
		    function modifyComment(Pgbidx, Pgcidx) {
		        var scrollPosition = window.scrollY; // 현재 스크롤 위치를 저장합니다.
		        $.ajax({
		            type: "POST",
		            url: "${pageContext.request.contextPath}/gathering/gBoardModifyComment.do",
		            data: { gbidx: Pgbidx, gcidx: Pgcidx },
		            success: function(data) {
		                if (data.value == 1) {

		                    /* 코드 생성 */
		                    var commentDiv = document.createElement('div');
		                    commentDiv.classList.add('PgCommentContents');


		                    var modifyCommentForm = document.createElement('form');
		                    modifyCommentForm.classList.add('modifycommentForm');

		                    var gbidxInput = document.createElement('input');
		                    gbidxInput.type = 'hidden';
		                    gbidxInput.name = 'gbidx';
		                    gbidxInput.value = Pgbidx;
		                    
		                    var gcidxInput = document.createElement('input');
		                    gcidxInput.type = 'hidden';
		                    gcidxInput.name = 'gcidx';
		                    gcidxInput.value = Pgcidx;

		                    var gCommentContentsTextarea = document.createElement('textarea');
		                    gCommentContentsTextarea.id = 'gCommentContentsModify';
		                    gCommentContentsTextarea.rows = '5';
		                    gCommentContentsTextarea.cols = '100';
		                    gCommentContentsTextarea.name = 'gCommentContents';
		                    gCommentContentsTextarea.maxLength = '200';
		                    gCommentContentsTextarea.textContent = data.gCommentContents;
		                    
		                    gCommentContentsTextarea.addEventListener('input', function(){
		                        characterCheck(this);
		                    });
		                    $('.replyBtn').css('display','none');
		                    

		                    function characterCheck(obj){
		                        var regExp = /[\{\}\[\]\/|\)*`^\_┼<>@\#$%&\'\"\\(\=]/gi;
		                        if(regExp.test(obj.value)){
		                            alert("특수문자는 입력할 수 없습니다.");
		                            obj.value = obj.value.substring(0, obj.value.length - 1);
		                        }
		                    }

		                 	// 글자 수를 표시할 요소 생성
		                    var characterCount = document.createElement('span');
		                    characterCount.textContent = gCommentContentsTextarea.value.length + '/200';
		                    
		                    var modifyBtn = document.createElement('button');
		                    modifyBtn.classList.add('modifyBtn');
		                    modifyBtn.textContent = '댓글 수정';
		                    
		                    modifyCommentForm.appendChild(gbidxInput);
		                    modifyCommentForm.appendChild(gcidxInput);
		                    modifyCommentForm.appendChild(gCommentContentsTextarea);
		                    modifyCommentForm.appendChild(characterCount); // 글자 수 요소 추가
		                    modifyCommentForm.appendChild(modifyBtn);
		                    
		                    // 생성한 코드를 적절한 위치에 삽입합니다.
		                    var parentDiv = document.querySelector("[data-gbidx=\""+Pgbidx+"\"][data-gcidx=\""+Pgcidx+"\"]");
			                    parentDiv.innerHTML = ''; // 작성한글없애기
		                        parentDiv.appendChild(commentDiv);
		                        parentDiv.appendChild(modifyCommentForm);
							
		                     // 입력 내용이 변경될 때마다 글자 수 업데이트
		                        gCommentContentsTextarea.addEventListener('input', function() {
		                            var inputLength = gCommentContentsTextarea.value.length;
		                            characterCount.textContent = inputLength + '/200';
		                        });    
		                        

		                        $(".modifyBtn").on('click', function() {
		                            submitUpdatedComment(Pgbidx, Pgcidx, gCommentContentsTextarea.value);
		                        });
		                        
		                        console.log("코드생성이 완료되었습니다")
		                  /*  alert("코드 생성이 완료되었습니다.");*/
		                } else {
		                    alert("댓글을 가져오지 못했습니다.");
		                }
		            },
		            error: function(xhr, status, error) {
		                // 에러 응답을 처리하거나 에러 메시지를 표시합니다.

		                // 동작 수행 후 스크롤 위치를 복원합니다.
		                window.scrollTo(0, scrollPosition);
		            }
		        });
		    }

	    function submitUpdatedComment(gbidx, gcidx, gCommentContents) {

	    	  // AJAX를 사용하여 업데이트된 댓글을 제출합니다
	    	  $.ajax({
	    	    type: "POST",
	    	    url: "${pageContext.request.contextPath}/gathering/gBoardUpdateComment.do",
	    	    data: { gbidx: gbidx, gcidx: gcidx, gCommentContents: gCommentContents },
	    	    success: function(data) {
	    	      if (data.value == 1) {
	    	        alert("댓글이 성공적으로 업데이트되었습니다.");
	    	        location.reload(); // 댓글 새로고침
	    	      } else {
	    	        alert("댓글 업데이트에 실패했습니다.");
	    	      }
	    	    },
	    	    error: function(xhr, status, error) {
	    	      console.error("댓글을 업데이트하는 중 오류 발생: " + error);
	    	    }
	    	  });
	    	}
		    $(".modifyBtn").on('click', function() {
		        var parentDiv = $(this).closest('.modifycommentForm');
		        var gbidx = parentDiv.find('input[name="gbidx"]').val();
		        var gcidx = parentDiv.find('input[name="gcidx"]').val();
		        var gCommentContents = parentDiv.find('textarea[name="gCommentContents"]').val();
	
		        submitUpdatedComment(gbidx, gcidx, gCommentContents);
		    });
		    
		    //답장하기
		    function replyComment(Pgbidx, Pgcidx ,event) {
		        var scrollPosition = window.scrollY; // 현재 스크롤 위치를 저장합니다.
		                    /* 코드 생성 */
		                    var commentDiv = document.createElement('div');
		                    commentDiv.classList.add('PgCommentContents');


		                    var ReplyCommentForm = document.createElement('form');
		                    ReplyCommentForm.classList.add('ReplyCommentForm');

		                    var gbidxInput = document.createElement('input');
		                    gbidxInput.type = 'hidden';
		                    gbidxInput.name = 'gbidx';
		                    gbidxInput.value = Pgbidx;
		                    
		                    var gcidxInput = document.createElement('input');
		                    gcidxInput.type = 'hidden';
		                    gcidxInput.name = 'gcidx';
		                    gcidxInput.value = Pgcidx;

		                    var gCommentContentsTextarea = document.createElement('textarea');
		                    gCommentContentsTextarea.id = 'gCommentContentsReply';
		                    gCommentContentsTextarea.rows = '5';
		                    gCommentContentsTextarea.cols = '100';
		                    gCommentContentsTextarea.name = 'gCommentContents';
		                    gCommentContentsTextarea.maxLength = '200';
		                    gCommentContentsTextarea.textContent = '';
		                    gCommentContentsTextarea.addEventListener('input', function() {
		                        updateReplyCharacterCount(gCommentContentsTextarea);
		                      });
		                   
		                    var characterCount = document.createElement('span');
		                    characterCount.id = 'replyCharacterCount';
		                    characterCount.textContent = '0/200';
		                    
		                    
		                    function characterCheck(obj) {
		                    	var regExp =/[\{\}\[\]\/|\)*`^\_┼<>@\#$%&\'\"\\(\=]/gi;
		                        if (regExp.test(obj.value)) {
		                            alert("특수문자는 입력할 수 없습니다.");
		                            obj.value = obj.value.substring(0, obj.value.length - 1);
		                        }
		                    }
		                    gCommentContentsTextarea.addEventListener('input', function() {
		                        updateReplyCharacterCount(gCommentContentsTextarea);
		                        characterCheck(gCommentContentsTextarea);
		                    });
		                    
		                    var replyCommentBtn = document.createElement('button');
		                    replyCommentBtn.classList.add('replyCommentBtn');
		                    replyCommentBtn.textContent = '답글하기';
		                    
		                    // 클릭한 버튼 숨기기
							event.style.display = 'none';


		                    
							ReplyCommentForm.appendChild(gbidxInput);
							ReplyCommentForm.appendChild(gcidxInput);
							ReplyCommentForm.appendChild(gCommentContentsTextarea);
							ReplyCommentForm.appendChild(characterCount);
							ReplyCommentForm.appendChild(replyCommentBtn);
		                    
		                    // 생성한 코드를 적절한 위치에 삽입합니다.
		                    var parentDiv = document.querySelector("[data-gbidx=\""+Pgbidx+"\"][data-gcidx=\""+Pgcidx+"\"]");
			                     
		                        parentDiv.appendChild(commentDiv);
		                        parentDiv.appendChild(ReplyCommentForm);
									

		                        $(".replyCommentBtn").on('click', function() {
		                            submitReplyComment(Pgbidx, Pgcidx, gCommentContentsTextarea.value);
		                        });
		                        
		                        console.log("코드생성이 완료되었습니다")
		                  /*  alert("코드 생성이 완료되었습니다.");*/
		                        
		    }
		    
		    function updateReplyCharacterCount(textarea) {
		    	
		    	//답글 글자 수 세기
		    	  var characterCount = textarea.nextElementSibling;
		    	  var currentLength = textarea.value.length;
		    	  var maxLength = 200;

		    	  characterCount.textContent = currentLength + "/" + maxLength;

		    	  if (currentLength > maxLength) {
		    	    characterCount.style.color = "red";
		    	  } else {
		    	    characterCount.style.color = "black";
		    	  }
		    	}
		    
		    
		    document.addEventListener('click', function(event) {
		    	  // 클릭된 요소를 가져옵니다.
		    	  var targetElement = event.target;

		    	  // 가져온 요소가 버튼인지 확인합니다.
		    	  if (targetElement.classList.contains('replyBtn')) {
		    	    // 버튼인 경우에만 숨깁니다.
		    	    replyComment(targetElement);
		    	  }
		    	});
		    
		    function submitReplyComment(gbidx, gcidx, gCommentContents) {

		    	  // AJAX를 사용하여 업데이트된 댓글을 제출합니다
		    	  $.ajax({
		    	    type: "POST",
		    	    url: "${pageContext.request.contextPath}/gathering/gBoardReplyComment.do",
		    	    data: { gbidx: gbidx, gcidx: gcidx, gCommentContents: gCommentContents },
		    	    success: function(data) {
		    	      if (data.value == 1) {
		    	        alert("답글이 성공했습니다.");
		    	        location.reload(); // 댓글 새로고침
		    	      } else {
		    	        alert("답글이 실패했습니다.");
		    	      }
		    	    },
		    	    error: function(xhr, status, error) {
		    	      console.error("답글 오류 발생: " + error);
		    	    }
		    	  });
		    	}
			    $(".replyCommentBtn").on('click', function() {
			        var parentDiv = $(this).closest('.ReplyCommentForm');
			        var gbidx = parentDiv.find('input[name="gbidx"]').val();
			        var gcidx = parentDiv.find('input[name="gcidx"]').val();
			        var gCommentContents = parentDiv.find('textarea[name="gCommentContents"]').val();
		
			        submitReplyComment(gbidx, gcidx, gCommentContents);
			    });
			    //좋아요
			    $(".gBoardLike").on("click", function() {
			    	// 현재 스크롤 위치 저장
			        var scrollPosition = $(window).scrollTop();
			        // Ajax
			        $.ajax({
			          url: "${pageContext.request.contextPath}/gathering/gBoardLike.do",
			          data: { gbidx: '${gbidx}'}, 
			          method: "POST", 
			          success: function(data) {
			        	  if (data.value == 0) {
				    	        alert("좋아요 성공했습니다.");
				    	        location.reload(); // 댓글 새로고침
				    	      } else {
				    	        alert("좋아요  실패했습니다.");
				    	      }
			          },
			          error: function(xhr, status, error) {
			        	  console.error("좋아요 오류 발생: " + error);
			          }
			        });
			      });

		</script>
		
		
		<script>
		//답글 글자수 표시
		    function updateCharacterCount() {
		      var textarea = document.getElementById("gCommentContents");
		      var characterCount = document.getElementById("characterCount");
		
		      var text = textarea.value;
		      var currentLength = text.length;
		      var maxLength = 200;
		
		      characterCount.textContent = currentLength + "/" + maxLength;
		
		      if (currentLength > maxLength) {
		        characterCount.style.color = "red";
		      } else {
		        characterCount.style.color = "black";
		      }
		    }
	  	</script>
	</body>
</html>
