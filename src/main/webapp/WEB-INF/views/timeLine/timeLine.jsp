<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>Insert title here</title>
<style>
	#optionbtn{
		width:2em;
		height:2em;
	}
</style>
<link rel="icon" href="/img/core-img/favicon.ico">
<link rel="stylesheet" href="/css/style2.css">
<style>
</style>
</head>

<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
   <!-- Preloader -->
    <jsp:include page="/WEB-INF/views/module/headerAndNavi.jsp"></jsp:include>
   <!-- Header Area End -->


	<!-- Welcome Area Start -->


	<!-- About Area Start -->
	<section class="akame-about-area section-padding-80-0"> <!--        --------------------------------------------------------------------------------------------------- -->
	<button id="writebtn">글쓰기</button>
	<script>
      $("#writebtn").on("click",function(){
         $(location).attr("href", "/timeline/tl_boardWrite")
      })
   </script>
	<div class="container " id="startSns">
		<c:forEach var="i" items="${result}">
			<div class="row mt-4">
				<div class="col-lg-6 border" style="margin: 0 auto">
					<div class="row py-3">
						<div class="col-lg-2 text-center">
							<img class="rounded-circle" alt=""
								src="/img/core-img/empty_profile.png">${i.tl_writer }</div>

						<div class="col-lg-8 py-2 text-center">${i.tl_title }<input type="hidden" value="${i.tl_board_seq }"></div>
						<div class="col-lg-2 text-right"><button id="optionbtn" data-toggle="modal" data-target="#tlboardInfo${i.tl_board_seq }" style="background-color:white; border:none;"><i class="xi-bars"></i></button></div>

					</div>
					<div class="single-post-area">
						<div class="post-thumbnail" style="text-align: center">
							<img src="${i.tl_imgaddr}" alt="">
						</div>
						<div class="post-content">

							<div class="post-meta">
								<a href="#" class="post-date"><i class="icon_clock_alt">작성일</i>
									${i.tl_writedate}</a> <a href="#"
									class="post-comments"><i class="xi-star-o">좋아요</i>
									${i.tl_likecount }</a>
							</div>
							<p>${i.tl_contents }</p>
							<hr>
							<div class="post-meta">
								<c:forEach var="j" items="result2">
									
								</c:forEach>
							</div>
							<form action="/timeline/boardReply" method="post">
							<div><input type="text" name="tl_repl_contents" class="mb-3" style="width:25em; border-radius:4px;"><button class="commentbtn btn btn-outline-success btn-sm ml-2 mb-2">댓글 입력</button></div>
							<input type="hidden" name="tl_board_seq" value="${i.tl_board_seq }">
							</form>
						</div>	
					</div>
				</div>
			</div>
	
	<div class="modal fade" id="tlboardInfo${i.tl_board_seq }" tabindex="-1"
               role="dialog" aria-labelledby="exampleModalLabel1"
               aria-hidden="true">
               <div class="modal-dialog" role="document">
                  <div class="modal-content">
                     <div class="modal-body1">
                        <form>
                           <div class="form-group m-0 p-0">
                              <div class="card">
                                 <div class="card-header">
                                    <i class="fa fa-user"></i><strong class="card-title pl-2">옵션 </strong>
                                    <button type="button" class="close" data-dismiss="modal"
                                       aria-label="Close">
                                       <span aria-hidden="true">&times;</span>
                                    </button>
                                 </div>
                                 <div class="card-body text-center">
                                    <div class="mx-auto d-block">
                                       <h5 class="text-center mt-2 mb-1">
                                          <b id="member_id"> </b>
                                       </h5>
                                    </div>
                                    <hr>
                                    <div class="card-text">
                                       <div>
                                          <a href="/timeline/reportProc?seq=${i.tl_board_seq }"><b style="color:red;">신고하기</b></a>
                                       </div>
                                       <div>
                                          <a href="/timeline/boardModify?seq=${i.tl_board_seq }&writer=${i.tl_writer}&title=${i.tl_title}&imgaddr=${i.tl_imgaddr }&contents=${i.tl_contents}"><b>글 수정 </b></a>
                                       </div>
                                       <div>
                                          <a href="/timeline/boardDelete?seq=${i.tl_board_seq }&writer=${i.tl_writer}"><b>글 삭제</b></a>
                                       </div>
                                       <div>
                                          <b>쪽지보내기</b>
                                          <p id="tl_board"></p>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <div class="modal-footer">
                              <button type="button" class="btn btn-secondary"
                                 data-dismiss="modal">닫기</button>
                           </div>
                        </form>

                     </div>
                  </div>
               </div>
            </div>
	
	
	
	
	
	
		
		
		


		</c:forEach>
		</div>
		<div class="row mt-4"></div>
	</section>

	
	<script>
      var count = 2;
      $(window).scroll(
            function() {
               // 최하단일 경우를 체크하기 위해 최하단 위치값을 지정
               // 화면 문서전체의 길이에서, 현재 창 높이를 뺀 것이 최하단 값
                  if($(document).height() <= $(window).scrollTop() + $(window).height() ){
                  // 최하단으로 도달했을 경우
                  $.ajax({
                     url : "/timeline/ajaxProc",
                     type : "post",
                     data : {
                        page : count
                     }
                  }).done(function(resp) {
                     count++
                     var result = JSON.parse(resp);
                     console.log(result[0].tl_contents);
                     console.log(result);
                     for(var i = 0 ; i < result.length ; i ++){

                    	 
                     $("#startSns").append(`<div class='row mt-4'><div class='col-lg-6 border' style='margin: 0 auto'>
 					<div class='row py-3'>
					<div class='col-lg-2'>
						<img class='rounded-circle'
							src='/img/core-img/empty_profile.png'>`+result[i].tl_writer+` </div>

					<div class='col-lg-8 py-2'>`+result[i].tl_title +`<input type='hidden' value='`+result[i].tl_board_seq +`'></div>
					<div class='col-lg-2 text-right'><button id='optionbtn' data-toggle='modal' data-target='#tlboardInfo`+result[i].tl_board_seq +`' style='background-color:white; border:none;'><i class='xi-bars'></i></button></div>

				</div>
				<div class='single-post-area'>
					<div class='post-thumbnail' style='text-align: center'>
						<img src='`+result[i].tl_imgaddr+`'>
					</div>
					<div class='post-content'>

						<div class='post-meta'>
							<a href='#' class='post-date'><i class='icon_clock_alt'>작성일</i>
							`+result[i].tl_writedate+`</a> <a href='#'
								class='post-comments'><i class='icon_chat_alt'>조회수</i>
								`+result[i].tl_likecount+`</a>
						</div>
						<p>`+result[i].tl_contents+`</p>
					</div>
				</div>
			</div></div>

			<div class='modal fade' id='tlboardInfo`+result[i].tl_board_seq+`' tabindex='-1'
		          role='dialog' aria-labelledby='exampleModalLabel1'
		          aria-hidden='true'>
		          <div class='modal-dialog' role='document'>
		             <div class='modal-content'>
		                <div class='modal-body1'>
		                   <form>
		                      <div class='form-group m-0 p-0'>
		                         <div class='card'>
		                            <div class='card-header'>
		                               <i class='fa fa-user'></i><strong class='card-title pl-2'>옵션 </strong>
		                               <button type='button' class='close' data-dismiss='modal'
		                                  aria-label='Close'>
		                                  <span aria-hidden='true'>&times;</span>
		                               </button>
		                            </div>
		                            <div class='card-body text-center'>
		                               <div class='mx-auto d-block'>
		                                  <h5 class='text-center mt-2 mb-1'>
		                                     <b id='member_id'> </b>
		                                  </h5>
		                               </div>
		                               <hr>
		                               <div class='card-text'>
		                                  <div>
		                                     <a href='/timeline/reportProc?seq=`+result[i].tl_board_seq+`'><b style='color:red;'>신고하기</b></a>
		                                     
		                                  </div>
		                                  <div>
		                                     <a href='/timeline/boardModify?seq=`+result[i].tl_board_seq+`&writer=`+result[i].tl_writer+`&title=`+result[i].tl_title+`&imgaddr=`+result[i].tl_imgaddr+`&contents=`+result[i].tl_contents+`'><b>글 수정 </b></a>
		                                  </div>
		                                  <div>
		                                     <a href='/timeline/boardDelete?seq=`+result[i].tl_board_seq+`&writer=`+result[i].tl_writer+`'><b>글 삭제</b></a>
		                                  </div>
		                                  <div>
		                                     <a href='/timeline/boardNote'><b>쪽지보내기</b></a>
		                                  </div>
		                               </div>
		                            </div>
		                         </div>
		                      </div>
		                      <div class='modal-footer'>
		                         <button type='button' class='btn btn-secondary'
		                            data-dismiss='modal'>닫기</button>
		                      </div>
		                   </form>

		                </div>
		             </div>
		          </div>
		       </div>`)
                     }
                  
                     })

                  
                  console.log('바닥입니다!');
               } else if ($(window).scrollTop() == 0) {
                  // 최상단으로 도달했을 경우
                  console.log('꼭대기입니다!');
               }
            });
      
   </script>



	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
</body>
</html>