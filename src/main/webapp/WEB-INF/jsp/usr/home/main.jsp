<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAIN"></c:set>
<%@ include file="../common/head.jspf"%>
<meta charset="UTF-8">
<title>${pageTitle }</title>
<link rel="stylesheet" href="/resource/common.css" />
<script src="/resource/common.js" defer="defer"></script>
<!-- 테일윈드 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" />

<!-- daisy ui 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/daisyui/4.6.1/full.css" />

<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">

<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<title>Slick Carousel Example</title>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css" />
<body class="mainbody">


	<!-- 검색 창 -->
	<div class="navbar1">
		<!-- 검색 창 -->
		<div class="search-container" style="margin-right: 450px;">
			<form action="/search">
				<input type="text" placeholder="검색..." name="search" style="width: 300px;">
				<button type="submit">검색</button>
			</form>
		</div>
		<c:if test="${not rq.isLogined() }">
			<div class="login-signup-links">
				<!-- 로그인 링크 -->
				<a class="hover:underline" href="../member/login" style="margin-right: 50px;">로그인</a>

				<!-- 회원가입 링크 -->
				<a class="hover:underline" href="../member/join" style="margin-right: 50px;">회원가입</a>
			</div>
		</c:if>



	</div>
	<hr style="border-top: 3px solid white;" />
<div class="mainback">
    <div class="container">

        <div class="slider">

            <div class="slides">

                <!--  The last slide goes before the first one,
        because the slideshow shows the second slide on load by default. -->
                <div class="slides__img" id="">
                    <div class="slides__img__filter"></div>
                </div>

                <div class="slides__img" id="">
                    <div class="slides__img__filter"></div>
                </div>
            </div>

            <div class="slides__img" id="">
                <div class="slides__img__filter"></div>
            </div>

            <div class="slides__img" id="">
                <div class="slides__img__filter"></div>
            </div>

            <div class="slides__img" id="">
                <div class="slides__img__filter"></div>
            </div>

        </div>

    </div>
</div>

<!-- #Controls -->
<a class="control fas fa-chevron-left" id="prev"></a> <a class="control fas fa-chevron-right" id="next"></a>

<!-- #Position dots -->
<div class="dots">
    <span class="dots__single" id=""></span> <span class="dots__single" id=""></span> <span class="dots__single" id=""></span>
    <span class="dots__single" id=""></span> <span class="dots__single" id=""></span>
</div>

<script>
    // 크롤링한 이미지 URL
    var crawledImageUrl1 = "";
    var crawledImageUrl2 = "";
    var crawledImageUrl3 = "";
    var crawledImageUrl4 = "";

    // 이미지 URL을 배열에 추가
    var imageUrls = [crawledImageUrl1, crawledImageUrl2, crawledImageUrl3, crawledImageUrl4];

    // 슬라이드 요소를 가져와서 이미지 URL을 설정
    var slideElements = document.querySelectorAll(".slides__img");
    for (var i = 0; i < slideElements.length; i++) {
        slideElements[i].style.backgroundImage = "url('" + imageUrls[i] + "')";
    }
</script>







	<script>
		/**
		 * @Author: Andrea Alba
		 * @Date:   2018-03-14T21:25:14+01:00
		 * @Email:  subjuliodesign [at] gmail.com
		 * @Project: Responsive Slideshow with jQuery
		 * @Filename: slideshow_final.js
		 * @Last modified by:   Andrea Alba
		 * @Last modified time: 2018-03-23T13:07:33+01:00
		 * @Copyright: subjuliodesign
		 */

		$(document)
				.ready(
						function() {
							//==================================
							// #Slideshow with jQuery
							//==================================

							// id generator
							function idGenerator() {
								$(".slides__img").each(function(index, el) {
									$(this).attr("id", "slide_" + index);
								});
								$(".dots__single").each(function(index, el) {
									$(this).attr("id", "dot_" + index);
								});
							}

							// id extractor
							// at the end it focuses the current dot
							function dotsFocus() {
								$("[id^='dot_']").removeClass("dots__current");
								var id = $(".slides__img:eq(1)").attr("id");
								var n = Number(id.substr(-1));
								if (n === 0) {
									n = $(".slides__img").length;
								}
								$("#dot_" + (n - 1)).addClass("dots__current");
							}

							// slide up caption
							function captionSlideUp(d, e) {
								var $cap1 = $(".slide__caption:eq(1)");
								$cap1.animate({
									bottom : "20%",
									opacity : 1
								}, {
									duration : d,
									easing : e,
									complete : dotsFocus()
								});
							}

							// slide down caption
							function captionSlideDown(d, e) {
								$(".slide__caption").animate({
									bottom : "5%",
									opacity : 0
								}, {
									duration : d,
									easing : e
								});
							}

							// slide movement
							function slideMove(t) {
								if (t === "prev") {
									return $(".slides__img").first().before(
											$(".slides__img").last());
								}
								if (t === "next") {
									return $(".slides__img").last().after(
											$(".slides__img").first());
								}
							}

							// slide images
							function slideIt(l, d, e, t) {
								var $slides = $(".slides");
								captionSlideDown(150, "linear");
								$slides.animate({
									left : l
								}, {
									duration : d,
									easing : e,
									complete : function() {
										$slides.css("left", "-100%");
										slideMove(t);
										captionSlideUp(1700, "swing");
									}
								});
							}

							// slide with dots
							function dotsControl(d, e) {
								$(".dots__single")
										.click(
												function() {
													var currentId = parseInt($(
															".dots__current")
															.attr("id").substr(
																	-1));
													var clickId = parseInt($(
															this).attr("id")
															.substr(-1));
													var max = $(".dots__single").length - 1;
													var half = Math
															.floor($(".dots__single").length / 2);
													var diff;
													if (currentId > clickId) {
														diff = currentId
																- clickId;
														if (diff === max) {
															diff = 1;
															l = "-200%";
															t = "next";
														} else if (diff <= half) {
															l = "0%";
															t = "prev";
														} else {
															diff--;
															l = "-200%";
															t = "next";
														}
													}
													if (currentId < clickId) {
														diff = clickId
																- currentId;
														if (diff === max) {
															diff = 1;
															l = "0%";
															t = "prev";
														} else if (diff <= half) {
															l = "-200%";
															t = "next";
														} else {
															diff--;
															l = "0%";
															t = "prev";
														}
													}
													for (var i = 0; i < diff; i++) {
														slideIt(l, d, e, t);
													}
												});
							}

							// slideshow
							function slideShow(d, e) {
								$("#prev").click(function() {
									var t = $(this).attr("id");
									slideIt("0%", d, e, t);
								});
								$("#next").click(function() {
									var t = $(this).attr("id");
									slideIt("-200%", d, e, t);
								});
								dotsControl(d, e);
							}

							idGenerator();
							captionSlideUp(1700, "swing");
							slideShow(800, "swing");
						});
	</script>
<body class="mainbody2">
	<div class="wrapper">
		<h2>Slick Carousel Example</h2>
		<h3>추천영화</h3>
		<div class="carousel">
			<div>
				<div class="card">
					<div class="card-header">
						<img src="">
					</div>
					<div class="card-body">
						<div class="card-content"></div>
					</div>
				</div>
			</div>
			<div>
				<div class="card">
					<div class="card-header">
						<img src="">
					</div>
					<div class="card-body">
						<div class="card-content"></div>
					</div>
				</div>
			</div>
			<div>
				<div class="card">
					<div class="card-header">
						<img src="">
					</div>
					<div class="card-body">
						<div class="card-content"></div>
					</div>
				</div>
			</div>
			<div>
				<div class="card">
					<div class="card-header">
						<img src="">
					</div>
					<div class="card-body">
						<div class="card-content"></div>
					</div>
				</div>
			</div>
			<div>
				<div class="card">
					<div class="card-header">
						<img src="">
					</div>
					<div class="card-body">
						<div class="card-content"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		// 크롤링한 이미지 URL
		var crawledImageUrl1 = "";
		var crawledImageUrl2 = "";
		var crawledImageUrl3 = "";
		var crawledImageUrl4 = "";
		var crawledImageUrl5 = "";

		// 이미지 URL을 배열에 추가
		var imageUrls = [ crawledImageUrl1, crawledImageUrl2, crawledImageUrl3,
				crawledImageUrl4, crawledImageUrl5 ];

		// 카드 이미지를 크롤링한 이미지로 변경
		var cardImages = document.querySelectorAll(".card-header img");
		for (var i = 0; i < cardImages.length; i++) {
			cardImages[i].src = imageUrls[i];
		}
	</script>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
	<script>
		$(document).ready(function() {
			$('.carousel').slick({
				speed : 500,
				slidesToShow : 4,
				slidesToScroll : 1,
				autoplay : true,
				autoplaySpeed : 2000,
				dots : true,
				centerMode : true,
				responsive : [ {
					breakpoint : 1024,
					settings : {
						slidesToShow : 3,
						slidesToScroll : 1,
					}
				}, {
					breakpoint : 800,
					settings : {
						slidesToShow : 2,
						slidesToScroll : 2,
					}
				}, {
					breakpoint : 480,
					settings : {
						slidesToShow : 1,
						slidesToScroll : 1,
					}
				} ]
			});
		});
	</script>
</body>




</body>
<div class="board-container">
	<div class="board">
		<h2>인기 영화</h2>
		<ul class="post-list">
			<li class="post">게시글 1</li>
			<li class="post">게시글 2</li>
			<li class="post">게시글 3</li>
		</ul>
	</div>

	<div class="board">
		<h2>인기 글</h2>
		<ul class="post-list">
			<li class="post">게시글 1</li>
			<li class="post">게시글 2</li>
			<li class="post">게시글 3</li>
		</ul>
	</div>
</div>


<%@ include file="../common/foot.jspf"%>