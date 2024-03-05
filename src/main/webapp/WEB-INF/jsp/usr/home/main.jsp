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


<!-- 검색 창 -->
<div class="navbar1">
	<!-- 검색 창 -->
	<div class="search-container" style="margin-right: 450px;">
		<form action="/search">
			<input type="text" placeholder="검색..." name="search" style="width: 300px;">
			<button type="submit">검색</button>
		</form>
	</div>
	<div class="login-signup-links">
		<!-- 로그인 링크 -->
		<a class="hover:underline" href="../member/login" style="margin-right: 50px;">로그인</a>

		<!-- 회원가입 링크 -->
		<a class="hover:underline" href="../member/join" style="margin-right: 50px;">회원가입</a>
	</div>


</div>
<hr style="border-top: 3px solid white;" />
<div class="container">

	<div class="slider">

		<div class="slides">

			<!--  The last slide goes before the first one,
        because the slideshow shows the second slide on load by default. -->
			<div class="slides__img" id="" style="background-image: url('https://source.unsplash.com/1400x900/?mountain')">
				<div class="slides__img__filter"></div>
				<div class="slide__caption">
					<h1 class="slide__caption__title">Fifth slide</h1>
					<h2 class="slide__caption__subtitle">This is the fifth slide.</h2>
					<h3 class="slide__caption__text">Lorem ipsum dolor sit amet.</h3>
				</div>
			</div>

			<div class="slides__img" id="" style="background-image: url('https://source.unsplash.com/1400x900/?forest')">
				<div class="slides__img__filter"></div>
				<div class="slide__caption">
					<h1 class="slide__caption__title">First slide</h1>
					<h2 class="slide__caption__subtitle">This is the first slide.</h2>
					<h3 class="slide__caption__text">Lorem ipsum dolor sit amet.</h3>
				</div>
			</div>

			<div class="slides__img" id="" style="background-image: url('https://source.unsplash.com/1400x900/?sea')">
				<div class="slides__img__filter"></div>
				<div class="slide__caption">
					<h1 class="slide__caption__title">Second slide</h1>
					<h2 class="slide__caption__subtitle">This is the second slide.</h2>
					<h3 class="slide__caption__text">Lorem ipsum dolor sit amet.</h3>
				</div>
			</div>

			<div class="slides__img" id="" style="background-image: url('https://source.unsplash.com/1400x900/?sky')">
				<div class="slides__img__filter"></div>
				<div class="slide__caption">
					<h1 class="slide__caption__title">Third slide</h1>
					<h2 class="slide__caption__subtitle">This is the third slide.</h2>
					<h3 class="slide__caption__text">Lorem ipsum dolor sit amet.</h3>
				</div>
			</div>

			<div class="slides__img" id="" style="background-image: url('https://source.unsplash.com/1400x900/?rocks')">
				<div class="slides__img__filter"></div>
				<div class="slide__caption">
					<h1 class="slide__caption__title">Fourth slide</h1>
					<h2 class="slide__caption__subtitle">This is the fourth slide.</h2>
					<h3 class="slide__caption__text">Lorem ipsum dolor sit amet.</h3>
				</div>
			</div>

		</div>

	</div>
	<!-- / slider -->

	<!-- #Controls -->
	<a class="control fas fa-chevron-left" id="prev"></a> <a class="control fas fa-chevron-right" id="next"></a>

	<!-- #Position dots -->
	<div class="dots">
		<span class="dots__single" id=""></span> <span class="dots__single" id=""></span> <span class="dots__single" id=""></span>
		<span class="dots__single" id=""></span> <span class="dots__single" id=""></span>
	</div>

</div>
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



$(document).ready(function() {
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
    $cap1.animate(
      {
        bottom: "20%",
        opacity: 1
      },
      {
        duration: d,
        easing: e,
        complete: dotsFocus()
      }
    );
  }

  // slide down caption
  function captionSlideDown(d, e) {
    $(".slide__caption").animate(
      {
        bottom: "5%",
        opacity: 0
      },
      {
        duration: d,
        easing: e
      }
    );
  }

  // slide movement
  function slideMove(t) {
    if (t === "prev") {
      return $(".slides__img")
        .first()
        .before($(".slides__img").last());
    }
    if (t === "next") {
      return $(".slides__img")
        .last()
        .after($(".slides__img").first());
    }
  }

  // slide images
  function slideIt(l, d, e, t) {
    var $slides = $(".slides");
    captionSlideDown(150, "linear");
    $slides.animate(
      {
        left: l
      },
      {
        duration: d,
        easing: e,
        complete: function() {
          $slides.css("left", "-100%");
          slideMove(t);
          captionSlideUp(1700, "swing");
        }
      }
    );
  }

  // slide with dots
  function dotsControl(d, e) {
    $(".dots__single").click(function() {
      var currentId = parseInt(
        $(".dots__current")
          .attr("id")
          .substr(-1)
      );
      var clickId = parseInt(
        $(this)
          .attr("id")
          .substr(-1)
      );
      var max = $(".dots__single").length - 1;
      var half = Math.floor($(".dots__single").length / 2);
      var diff;
      if (currentId > clickId) {
        diff = currentId - clickId;
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
        diff = clickId - currentId;
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
<!-- / slideshow -->

<!-- <div class="movie poster" style="position: relative; overflow-x: auto;">
    <button class="scroll-button left" style="position: absolute; top: 50%; left: 10px; transform: translateY(-50%); color: white; font-size: 24px; border: 2px solid white; border-radius: 50%; background-color: transparent;"> < </button>
    <img src="https://media.istockphoto.com/id/1207316492/ko/%EB%B2%A1%ED%84%B0/%EC%9D%B8%EC%87%84.jpg?s=2048x2048&w=is&k=20&c=KVcBrbKeNmZ6Ksc4j_JPLLtXbmEL3DDofHxZt1PQnVA=" alt="">
    <img src="https://joyposter.cafe24.com//NEW-posters/F600X848Poster/SMS-006.jpg" alt="">
    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTf0AL5pslDWHHeLR9FqsYpYUUqt2OrMCgcUA&usqp=CAU" alt="">
    <button class="scroll-button right" style="position: absolute; top: 50%; right: 10px; transform: translateY(-50%); color: white; font-size: 24px; border: 2px solid white; border-radius: 50%; background-color: transparent;"> > </button>
</div>


<div class="algorithm">
  <div>Movie Time 에서 추천드리는 작품</div>
  
  <div class="image-container">
    <img src="https://joyposter.cafe24.com//NEW-posters/F600X848Poster/SMS-006.jpg" alt="">
    <img src="https://joyposter.cafe24.com//NEW-posters/F600X848Poster/SMS-006.jpg" alt="">
    <img src="https://joyposter.cafe24.com//NEW-posters/F600X848Poster/SMS-006.jpg" alt="">
    <img src="https://joyposter.cafe24.com//NEW-posters/F600X848Poster/SMS-006.jpg" alt="">
    <img src="https://joyposter.cafe24.com//NEW-posters/F600X848Poster/SMS-006.jpg" alt="">
    <img src="https://joyposter.cafe24.com//NEW-posters/F600X848Poster/SMS-006.jpg" alt="">
    <img src="https://joyposter.cafe24.com//NEW-posters/F600X848Poster/SMS-006.jpg" alt="">
    <img src="https://joyposter.cafe24.com//NEW-posters/F600X848Poster/SMS-006.jpg" alt="">
    <img src="https://joyposter.cafe24.com//NEW-posters/F600X848Poster/SMS-006.jpg" alt="">
    <img src="https://joyposter.cafe24.com//NEW-posters/F600X848Poster/SMS-006.jpg" alt="">
    
  </div>
</div> -->

<div class="content-wrapper">
	<div class="good bord">
		<h1>Mini Board</h1>
		<div class="post-container">
			<div class="post left">
				<h2>최고의 추천 영화</h2>
				<p>게시글 내용이 여기에 들어갑니다.</p>
				<p class="author">제목: 토끼의 거짓말</p>
			</div>
			<div class="post right">
				<h2>최고 좋아요 댓글</h2>
				<p>게시글 내용이 여기에 들어갑니다.</p>
				<p class="author">작성자: bae 내용</p>
			</div>
		</div>
	</div>
	<div class="map-container">
		<div class="map-box">
			<img
				src="https://play-lh.googleusercontent.com/pPTTNz433EYFurg2j__bFU5ONdMoU_bs_-yS2JLZriua3iHrksGP6XBPF5VtDPlpGcW4=w600-h300-pc0xffffff-pd"
				alt="">
		</div>
	</div>
	
</div>

<%@ include file="../common/foot.jspf"%>