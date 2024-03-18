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

<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css" />
<body class="mainbody">

<hr style="border-top: 3px solid white;" />
	<div class="navbar1" style="display: flex; justify-content: center;">
    <!-- 검색 창 -->
    <div class="search-container" style="margin-right: 400px;">
        <form action="/search">
            <input type="text" placeholder="검색..." name="search" style="width: 500px;  height:40px;">
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
<!-- <div class="mainback">
    div class="mainback">
    <div class="container">
        <div class="slider">
            <div class="slides">
                이미지가 삽입될 div
            </div>
        </div>
    </div>
</div>

수정된 자바스크립트 코드
<script>
    // 새로운 이미지 URL 배열
    var newImageUrls = [
        "이미지1.jpg",
        "이미지2.jpg",
        "이미지3.jpg",
        // 추가 이미지 URL들...
    ];

    // 슬라이더에 이미지를 추가하는 함수
    function addImagesToSlider() {
        var slidesContainer = document.querySelector(".slider .slides");
        newImageUrls.forEach(function(imageUrl) {
            var slide = document.createElement("div");
            slide.className = "slides__img";
            var filter = document.createElement("div");
            filter.className = "slides__img__filter";
            var image = document.createElement("img");
            image.src = imageUrl;
            slide.appendChild(filter);
            slide.appendChild(image);
            slidesContainer.appendChild(slide);
        });
    }

    // 페이지 로드 시 이미지를 슬라이더에 추가
    window.addEventListener("load", addImagesToSlider);
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
	</script> -->
<%@ page import="java.util.List" %> <!-- List 클래스 import -->
<%@ page import="com.example.demo.util.CgvDAO" %>
<%@ page import="com.example.demo.vo.CgvVO" %>
<%@ page import="com.example.demo.util.CgvService" %>

<html>


<body class="mainbody2" style="margin-top: 0; background: black;">
    <div class="wrapper">
        
        <div class="carousel">
            <div class="card">
                <div class="card-header">
                    <img>
                </div>
            </div>
            <div class="card">
                <div class="card-header">
                    <img>
                </div>
            </div>
            <div class="card">
                <div class="card-header">
                    <img>
                </div>
            </div>
            <div class="card">
                <div class="card-header">
                    <img>
                </div>
            </div>
            <div class="card">
                <div class="card-header">
                    <img>
                </div>
            </div>
            <div class="card">
                <div class="card-header">
                    <img>
                </div>
            </div>
        </div>
    </div>
   <!-- Custom arrow buttons -->
        <button class="custom-prev">Previous</button>
        <button class="custom-next">Next</button>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
    <script>
        $(document).ready(function() {
            $('.carousel').slick({
                speed: 300,
                slidesToShow: 4,
                slidesToScroll: 1,
                autoplay: true,
                autoplaySpeed: 3000,
                dots: true,
                centerMode: true,
                prevArrow: $('.custom-prev'),
                nextArrow: $('.custom-next'),
                responsive: [{
                        breakpoint: 1024,
                        settings: {
                            slidesToShow: 3,
                            slidesToScroll: 1,
                        }
                    },
                    {
                        breakpoint: 800,
                        settings: {
                            slidesToShow: 2,
                            slidesToScroll: 2,
                        }
                    },
                    {
                        breakpoint: 480,
                        settings: {
                            slidesToShow: 1,
                            slidesToScroll: 1,
                        }
                    }
                ]
            });
        });
    </script>
</body>


  <script>
    // 영화 목록을 가져와서 JavaScript 배열로 변환
    var movieList = [
        <% List<CgvVO> movies = new CgvDAO().getMovies(); %>
        <% for (int i = 0; i < movies.size(); i++) { %>
            <% CgvVO movie = movies.get(i); %>
            {
                title: "<%= movie.getTitle() %>",
                image: "<%= movie.getImage() %>",
                genre: "<%= movie.getGenre() %>"
            }
            <% if (i < movies.size() - 1) { %>,<% } %>
        <% } %>
    ];

    // 이미지 URL 배열 초기화
    var imageUrls = [];

    // 영화 목록의 이미지 URL을 imageUrls 배열에 추가
    for (var i = 0; i < movieList.length; i++) {
        imageUrls.push(movieList[i].image);
    }

    // 카드 요소 가져오기
    var cardElements = document.querySelectorAll(".card");

    // 이미지 URL을 카드에 설정하고 클릭 이벤트 리스너 추가
    for (var i = 0; i < cardElements.length; i++) {
        if (i < imageUrls.length) {
            var imgElement = cardElements[i].querySelector("img");
            imgElement.src = imageUrls[i];
            cardElements[i].addEventListener("click", handleCardClick); // 클릭 이벤트 리스너 추가
            cardElements[i].setAttribute("data-index", i); // 각 카드에 인덱스 속성 추가
        } else {
            console.error("이미지 URL이 부족합니다.");
        }
    }

    // handleCardClick 함수 정의
    function handleCardClick(event) {
        var index = event.currentTarget.getAttribute("data-index"); // 클릭한 카드의 인덱스 가져오기
        // "detail.jsp" 페이지로 이동하면서 index를 전달
        window.location.href = "../article/detail?index=" + index;
    }

    // 여기서 영화 정보를 추가하면 됩니다. 이미지 URL을 새로운 URL로 바꿔야 합니다.
    movieList.push({ title: "새로운 영화", image: "새로운 이미지 URL", genre: "새로운 장르" });
    // 위에서 추가한 영화 정보에 대한 이미지 URL을 새로운 URL로 설정합니다.
    imageUrls.push("새로운 이미지 URL");
    
    var imgElements = document.querySelectorAll(".card img");

 // 모든 이미지 요소에 너비와 높이를 적용합니다.
 imgElements.forEach(function(imgElement) {
     imgElement.style.width = "500px"; // 너비를 200px로 설정합니다.
     imgElement.style.height = "100%"; // 높이를 300px로 설정합니다.
 });
</script>

</body>
</html>


</body>
<div></div>



	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
	<script>
		$(document).ready(function() {
			$('.carousel').slick({
				speed : 300,
				slidesToShow : 4,
				slidesToScroll : 1,
				autoplay : true,
				autoplaySpeed : 3000,
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

<div class = "crawl">
<div id="wrap" class="mvie5_4">
	










<script type="text/javascript">
	function mainTopMenuTopView(divName) {
		var frm = document.getElementById(divName);
		if(frm.style.display != "block") frm.style.display = "block";
		else frm.style.display = "none";
	}
	
	function fn_changeSearch() {
		SetCookie("sel_s_type", $("#sel_s_type").val());
		var pForm = document.searchMainTopMovie;
		
		if($("#sel_s_type").val() == "M") {
			pForm.action="/kobis/business/mast/mvie/searchMovieList.do";
			$("#inp_solrSearch").attr("name", "sMovName");
		} else {
			pForm.action="/kobis/business/comm/search/search.do";
			$("#inp_solrSearch").attr("name", "queryString");
		}
	}
	
	function fn_mainTopMovieSearch(){
		var pForm = document.searchMainTopMovie;
		pForm.submit();
	}
	
	$(document).ready(function() { 
	    if(GetCookie("sel_s_type") == "T") {
	    	$("#sel_s_type").val("T");
	    	
	    	var pForm = document.searchMainTopMovie;
	    	pForm.action="/kobis/business/comm/search/search.do";
	    	
	    	$("#inp_solrSearch").attr("name", "queryString"); 
	    }
	    $("ul.list_nav > li > a").click(function(){
	    
	    		
	    	if($(this).parent().find(".bg_sub ul.nav_sub > li:eq(0)  li.depth3:eq(0)").length >0){
	    		$(this).parent().find(".bg_sub ul.nav_sub > li:eq(0)  li.depth3:eq(0) a").click();
	    		goDirectPage($(this).parent().find(".bg_sub ul.nav_sub > li:eq(0)  li.depth3:eq(0) a").attr("href"));
	    	}else{
	    		$(this).parent().find(".bg_sub ul.nav_sub > li:eq(0) a").click();
	    		goDirectPage($(this).parent().find(".bg_sub ul.nav_sub > li:eq(0) a").attr("href"));
	    	}
	    	
	    	
	    	if($(this).parent().hasClass("nav5")){
	    		/* $(this).attr("href","/kobis/business/stat/online/onlinefindDailyBoxOfficeList.do"); */
	    		/* location.href="/kobis/business/stat/online/onlineMain.do"; */
	    		location.href="/kobis/business/stat/online/onlineintro.do";
	    		
	    	}
	    });
	}); 
	function goDirectPage(page){
		location.href=page;
	}
</script>


 <link rel="stylesheet" type="text/css" href="/kobis/web/comm/commcss/autoLogout.css">




			 	
			 		
            <form action="findTheaterSchedule.do" id="searchForm" name="searchForm" method="post">            	
            	<input type="hidden" name="CSRFToken" value="8GfJg1v2Zy7GkgC3PHWZBx_oIFA75FQzvmk3MzH5Yl0" autocomplete="off">
				<input type="hidden" id="wideareaCd" name="wideareaCd" value="0105001" autocomplete="off">
				<input type="hidden" id="basareaCd" name="basareaCd" value="" autocomplete="off">
				<input type="hidden" id="theaCd" name="theaCd" value="001123" autocomplete="off">
				<input type="hidden" id="showDt" name="showDt" value="20240314" autocomplete="off">
			</form>
            <div class="schedule">
            	<div class="fl step1 on">해당 단계일 때 .on 추가
                	<strong>광역</strong>
                    <ul>
                    	
							<li wideareacd="0105001" onclick="selectedWidearea(this, '0105001');">
							<input type="radio" name="step1" id="step1_1" autocomplete="off">
							<label for="step1_1">서울시</label>
							</li>
						
							<li wideareacd="0105002" onclick="selectedWidearea(this, '0105002');">
							<input type="radio" name="step1" id="step1_2" autocomplete="off">
							<label for="step1_2">경기도</label>
							</li>
						
							<li wideareacd="0105003" onclick="selectedWidearea(this, '0105003');">
							<input type="radio" name="step1" id="step1_3" autocomplete="off">
							<label for="step1_3">강원도</label>
							</li>
						
							<li wideareacd="0105004" onclick="selectedWidearea(this, '0105004');">
							<input type="radio" name="step1" id="step1_4" autocomplete="off">
							<label for="step1_4">충청북도</label>
							</li>
						
							<li wideareacd="0105005" onclick="selectedWidearea(this, '0105005');">
							<input type="radio" name="step1" id="step1_5" autocomplete="off">
							<label for="step1_5">충청남도</label>
							</li>
						
							<li wideareacd="0105006" onclick="selectedWidearea(this, '0105006');">
							<input type="radio" name="step1" id="step1_6" autocomplete="off">
							<label for="step1_6">경상북도</label>
							</li>
						
							<li wideareacd="0105007" onclick="selectedWidearea(this, '0105007');">
							<input type="radio" name="step1" id="step1_7" autocomplete="off">
							<label for="step1_7">경상남도</label>
							</li>
						
							<li wideareacd="0105008" onclick="selectedWidearea(this, '0105008');">
							<input type="radio" name="step1" id="step1_8" autocomplete="off">
							<label for="step1_8">전라북도</label>
							</li>
						
							<li wideareacd="0105009" onclick="selectedWidearea(this, '0105009');">
							<input type="radio" name="step1" id="step1_9" autocomplete="off">
							<label for="step1_9">전라남도</label>
							</li>
						
							<li wideareacd="0105010" onclick="selectedWidearea(this, '0105010');">
							<input type="radio" name="step1" id="step1_10" autocomplete="off">
							<label for="step1_10">제주도</label>
							</li>
						
							<li wideareacd="0105011" onclick="selectedWidearea(this, '0105011');">
							<input type="radio" name="step1" id="step1_11" autocomplete="off">
							<label for="step1_11">부산시</label>
							</li>
						
							<li wideareacd="0105012" onclick="selectedWidearea(this, '0105012');">
							<input type="radio" name="step1" id="step1_12" autocomplete="off">
							<label for="step1_12">대구시</label>
							</li>
						
							<li wideareacd="0105013" onclick="selectedWidearea(this, '0105013');">
							<input type="radio" name="step1" id="step1_13" autocomplete="off">
							<label for="step1_13">대전시</label>
							</li>
						
							<li wideareacd="0105014" onclick="selectedWidearea(this, '0105014');">
							<input type="radio" name="step1" id="step1_14" autocomplete="off">
							<label for="step1_14">울산시</label>
							</li>
						
							<li wideareacd="0105015" onclick="selectedWidearea(this, '0105015');">
							<input type="radio" name="step1" id="step1_15" autocomplete="off">
							<label for="step1_15">인천시</label>
							</li>
						
							<li wideareacd="0105016" onclick="selectedWidearea(this, '0105016');">
							<input type="radio" name="step1" id="step1_16" autocomplete="off">
							<label for="step1_16">광주시</label>
							</li>
						
							<li wideareacd="0105017" onclick="selectedWidearea(this, '0105017');">
							<input type="radio" name="step1" id="step1_17" autocomplete="off">
							<label for="step1_17">세종시</label>
							</li>
						
                        <li><input type="radio" name="step1" id="step1_1" /><label for="step1_1">서울시</label></li>
                        <li><input type="radio" name="step1" id="step1_2" /><label for="step1_2">경기도</label></li>
                        <li><input type="radio" name="step1" id="step1_3" /><label for="step1_3">강원도</label></li>
                        <li><input type="radio" name="step1" id="step1_4" /><label for="step1_4">충청북도</label></li>
                        <li><input type="radio" name="step1" id="step1_5" /><label for="step1_5">충청남도</label></li>
                        <li><input type="radio" name="step1" id="step1_6" /><label for="step1_6">경상북도</label></li>
                        <li><input type="radio" name="step1" id="step1_7" /><label for="step1_7">경상남도</label></li>
                        <li><input type="radio" name="step1" id="step1_8" /><label for="step1_8">전라북도</label></li>
                        <li><input type="radio" name="step1" id="step1_9" /><label for="step1_9">전라남도</label></li>
                        <li><input type="radio" name="step1" id="step1_10" /><label for="step1_10">제주도</label></li>
                        <li><input type="radio" name="step1" id="step1_11" /><label for="step1_11">부산시</label></li>
                        <li><input type="radio" name="step1" id="step1_12" /><label for="step1_12">대구시</label></li>
                        <li><input type="radio" name="step1" id="step1_13" /><label for="step1_13">대전시</label></li>
                        <li><input type="radio" name="step1" id="step1_14" /><label for="step1_14">울산시</label></li>
                        <li><input type="radio" name="step1" id="step1_15" /><label for="step1_15">인천시</label></li>
                        <li><input type="radio" name="step1" id="step1_16" /><label for="step1_16">광주시</label></li>
                        <li><input type="radio" name="step1" id="step1_17" /><label for="step1_17">세종시</label></li>
                    </ul>
                </div>
                <div class="fl step2 on">해당 단계일 때 .on 추가
                	<strong>기초</strong>
                    <ul>
                        <li><input type="radio" name="step2" id="step2_1" /><label for="step2_1">강남구</label></li>
                        <li><input type="radio" name="step2" id="step2_2" /><label for="step2_2">강동구</label></li>
                        <li><input type="radio" name="step2" id="step2_3" /><label for="step2_3">강북구</label></li>
                        <li><input type="radio" name="step2" id="step2_4" /><label for="step2_4">강서구</label></li>
                        <li><input type="radio" name="step2" id="step2_5" /><label for="step2_5">관악구</label></li>
                        <li><input type="radio" name="step2" id="step2_6" /><label for="step2_6">광진구</label></li>
                        <li><input type="radio" name="step2" id="step2_7" /><label for="step2_7">구로구</label></li>
                        <li><input type="radio" name="step2" id="step2_8" /><label for="step2_8">금천구</label></li>
                        <li><input type="radio" name="step2" id="step2_9" /><label for="step2_9">노원구</label></li>
                        <li><input type="radio" name="step2" id="step2_10" /><label for="step2_10">도봉구</label></li>
                        <li><input type="radio" name="step2" id="step2_11" /><label for="step2_11">동대문구</label></li>
                        <li><input type="radio" name="step2" id="step2_12" /><label for="step2_12">동작구</label></li>
                        <li><input type="radio" name="step2" id="step2_13" /><label for="step2_13">마포구</label></li>
                        <li><input type="radio" name="step2" id="step2_14" /><label for="step2_14">서대문구</label></li>
                        <li><input type="radio" name="step2" id="step2_15" /><label for="step2_15">서초구</label></li>
                        <li><input type="radio" name="step2" id="step2_16" /><label for="step2_16">성동구</label></li>
                        <li><input type="radio" name="step2" id="step2_17" /><label for="step2_17">성북구</label></li>
                        <li><input type="radio" name="step2" id="step2_18" /><label for="step2_18">송파구</label></li>
                        <li><input type="radio" name="step2" id="step2_19" /><label for="step2_19">양천구</label></li>
                        <li><input type="radio" name="step2" id="step2_20" /><label for="step2_20">영등포구</label></li>
                        <li><input type="radio" name="step2" id="step2_21" /><label for="step2_21">용산구</label></li>
                        <li><input type="radio" name="step2" id="step2_22" /><label for="step2_22">은평구</label></li>
                        <li><input type="radio" name="step2" id="step2_23" /><label for="step2_23">종로구</label></li>
                        <li><input type="radio" name="step2" id="step2_24" /><label for="step2_24">중구</label></li>
                        <li><input type="radio" name="step2" id="step2_25" /><label for="step2_25">중랑구</label></li>
                    </ul>
                    <ul id="sBasareaCd"><li basareacd="010600101" onclick="selectedBasarea($(this), '010600101'); " class="current"><input type="radio" name="step2" id="step2_1"><label for="step2_1">강남구</label></li><li basareacd="010600102" onclick="selectedBasarea($(this), '010600102'); "><input type="radio" name="step2" id="step2_2"><label for="step2_2">강동구</label></li><li basareacd="010600103" onclick="selectedBasarea($(this), '010600103'); "><input type="radio" name="step2" id="step2_3"><label for="step2_3">강북구</label></li><li basareacd="010600104" onclick="selectedBasarea($(this), '010600104'); "><input type="radio" name="step2" id="step2_4"><label for="step2_4">강서구</label></li><li basareacd="010600105" onclick="selectedBasarea($(this), '010600105'); "><input type="radio" name="step2" id="step2_5"><label for="step2_5">관악구</label></li><li basareacd="010600106" onclick="selectedBasarea($(this), '010600106'); "><input type="radio" name="step2" id="step2_6"><label for="step2_6">광진구</label></li><li basareacd="010600107" onclick="selectedBasarea($(this), '010600107'); "><input type="radio" name="step2" id="step2_7"><label for="step2_7">구로구</label></li><li basareacd="010600108" onclick="selectedBasarea($(this), '010600108'); "><input type="radio" name="step2" id="step2_8"><label for="step2_8">금천구</label></li><li basareacd="010600109" onclick="selectedBasarea($(this), '010600109'); "><input type="radio" name="step2" id="step2_9"><label for="step2_9">노원구</label></li><li basareacd="010600110" onclick="selectedBasarea($(this), '010600110'); "><input type="radio" name="step2" id="step2_10"><label for="step2_10">도봉구</label></li><li basareacd="010600111" onclick="selectedBasarea($(this), '010600111'); "><input type="radio" name="step2" id="step2_11"><label for="step2_11">동대문구</label></li><li basareacd="010600112" onclick="selectedBasarea($(this), '010600112'); "><input type="radio" name="step2" id="step2_12"><label for="step2_12">동작구</label></li><li basareacd="010600113" onclick="selectedBasarea($(this), '010600113'); "><input type="radio" name="step2" id="step2_13"><label for="step2_13">마포구</label></li><li basareacd="010600114" onclick="selectedBasarea($(this), '010600114'); "><input type="radio" name="step2" id="step2_14"><label for="step2_14">서대문구</label></li><li basareacd="010600115" onclick="selectedBasarea($(this), '010600115'); "><input type="radio" name="step2" id="step2_15"><label for="step2_15">서초구</label></li><li basareacd="010600116" onclick="selectedBasarea($(this), '010600116'); "><input type="radio" name="step2" id="step2_16"><label for="step2_16">성동구</label></li><li basareacd="010600117" onclick="selectedBasarea($(this), '010600117'); "><input type="radio" name="step2" id="step2_17"><label for="step2_17">성북구</label></li><li basareacd="010600118" onclick="selectedBasarea($(this), '010600118'); "><input type="radio" name="step2" id="step2_18"><label for="step2_18">송파구</label></li><li basareacd="010600119" onclick="selectedBasarea($(this), '010600119'); "><input type="radio" name="step2" id="step2_19"><label for="step2_19">양천구</label></li><li basareacd="010600120" onclick="selectedBasarea($(this), '010600120'); "><input type="radio" name="step2" id="step2_20"><label for="step2_20">영등포구</label></li><li basareacd="010600121" onclick="selectedBasarea($(this), '010600121'); "><input type="radio" name="step2" id="step2_21"><label for="step2_21">용산구</label></li><li basareacd="010600122" onclick="selectedBasarea($(this), '010600122'); "><input type="radio" name="step2" id="step2_22"><label for="step2_22">은평구</label></li><li basareacd="010600123" onclick="selectedBasarea($(this), '010600123'); "><input type="radio" name="step2" id="step2_23"><label for="step2_23">종로구</label></li><li basareacd="010600124" onclick="selectedBasarea($(this), '010600124'); "><input type="radio" name="step2" id="step2_24"><label for="step2_24">중구</label></li><li basareacd="010600125" onclick="selectedBasarea($(this), '010600125'); "><input type="radio" name="step2" id="step2_25"><label for="step2_25">중랑구</label></li></ul>
                </div>
                <div class="fl step3 on">해당 단계일 때 .on 추가
                	<strong>영화상영관</strong>
                    <ul id="sTheaCd"><li theacd="001123" onclick="selectedTheater($(this), '001123'); " class="current"><input type="radio" name="step3" id="step3_1"><label for="step3_1">CGV 강남</label></li><li theacd="001111" onclick="selectedTheater($(this), '001111'); "><input type="radio" name="step3" id="step3_2"><label for="step3_2">CGV 압구정</label></li><li theacd="001186" onclick="selectedTheater($(this), '001186'); "><input type="radio" name="step3" id="step3_3"><label for="step3_3">CGV 청담씨네시티</label></li><li theacd="001128" onclick="selectedTheater($(this), '001128'); "><input type="radio" name="step3" id="step3_4"><label for="step3_4">CINE de CHEF 압구정</label></li><li theacd="001277" onclick="selectedTheater($(this), '001277'); "><input type="radio" name="step3" id="step3_5"><label for="step3_5">롯데시네마 도곡</label></li><li theacd="001071" onclick="selectedTheater($(this), '001071'); "><input type="radio" name="step3" id="step3_6"><label for="step3_6">롯데시네마 브로드웨이(신사)</label></li><li theacd="001169" onclick="selectedTheater($(this), '001169'); "><input type="radio" name="step3" id="step3_7"><label for="step3_7">메가박스 강남대로(씨티)</label></li><li theacd="001003" onclick="selectedTheater($(this), '001003'); "><input type="radio" name="step3" id="step3_8"><label for="step3_8">메가박스 코엑스</label></li><li theacd="001293" onclick="selectedTheater($(this), '001293'); "><input type="radio" name="step3" id="step3_9"><label for="step3_9">씨티극장</label></li><li theacd="001242" onclick="selectedTheater($(this), '001242'); "><input type="radio" name="step3" id="step3_10"><label for="step3_10">픽처하우스</label></li></ul>
                </div>
                <div class="ovf step4 on">해당 단계일 때 .on 추가
                	<div class="date">
                    	<p><strong>3월 14일</strong></p>
                        <a href="javascript:;" class="prev" id="previous"><span class="ico_comm">이전</span></a>
                        <a href="javascript:;" class="next" id="next"><span class="ico_comm">다음</span></a>
                    </div>
                    <ul id="schedule">
                    <li><div class="tit"><span class="screen">01관</span><a href="#" onclick="mstView('movie','19970037')">비트(디지털)</a></div><div class="times"><input type="radio" name="step4" id="step4_1_1" disabled="disabled"><label for="step4_1_1" style="cursor:default;">23:45</label></div></li><li><div class="tit"><span class="screen">01관</span><a href="#" onclick="mstView('movie','20234675')">파묘(디지털)</a></div><div class="times"><input type="radio" name="step4" id="step4_2_1" disabled="disabled"><label for="step4_2_1" style="cursor:default;">26:10</label></div></li><li><div class="tit"><span class="screen">01관</span><a href="#" onclick="mstView('movie','20236295')">듄: 파트2(디지털)</a></div><div class="times"><input type="radio" name="step4" id="step4_3_1" disabled="disabled"><label for="step4_3_1" style="cursor:default;">16:45</label><input type="radio" name="step4" id="step4_3_2" disabled="disabled"><label for="step4_3_2" style="cursor:default;">20:20</label></div></li><li><div class="tit"><span class="screen">01관</span><a href="#" onclick="mstView('movie','20236732')">가여운 것들(디지털)</a></div><div class="times"><input type="radio" name="step4" id="step4_4_1" disabled="disabled"><label for="step4_4_1" style="cursor:default;">11:30</label></div></li><li><div class="tit"><span class="screen">01관</span><a href="#" onclick="mstView('movie','20247053')">메이 디셈버(디지털)</a></div><div class="times"><input type="radio" name="step4" id="step4_5_1" disabled="disabled"><label for="step4_5_1" style="cursor:default;">09:00</label></div></li><li><div class="tit"><span class="screen">01관</span><a href="#" onclick="mstView('movie','20247198')">마담 웹(디지털)</a></div><div class="times"><input type="radio" name="step4" id="step4_6_1" disabled="disabled"><label for="step4_6_1" style="cursor:default;">14:20</label></div></li><li><div class="tit"><span class="screen">02관</span><a href="#" onclick="mstView('movie','19980003')">태양은 없다(디지털)</a></div><div class="times"><input type="radio" name="step4" id="step4_7_1" disabled="disabled"><label for="step4_7_1" style="cursor:default;">22:00</label></div></li><li><div class="tit"><span class="screen">02관</span><a href="#" onclick="mstView('movie','20234789')">패스트 라이브즈(디지털)</a></div><div class="times"><input type="radio" name="step4" id="step4_8_1" disabled="disabled"><label for="step4_8_1" style="cursor:default;">10:10</label><input type="radio" name="step4" id="step4_8_2" disabled="disabled"><label for="step4_8_2" style="cursor:default;">14:50</label><input type="radio" name="step4" id="step4_8_3" disabled="disabled"><label for="step4_8_3" style="cursor:default;">19:40</label></div></li><li><div class="tit"><span class="screen">02관</span><a href="#" onclick="mstView('movie','20236732')">가여운 것들(디지털)</a></div><div class="times"><input type="radio" name="step4" id="step4_9_1" disabled="disabled"><label for="step4_9_1" style="cursor:default;">24:20</label></div></li><li><div class="tit"><span class="screen">02관</span><a href="#" onclick="mstView('movie','20247053')">메이 디셈버(디지털)</a></div><div class="times"><input type="radio" name="step4" id="step4_10_1" disabled="disabled"><label for="step4_10_1" style="cursor:default;">17:05</label></div></li><li><div class="tit"><span class="screen">02관</span><a href="#" onclick="mstView('movie','20247076')">귀멸의 칼날: 인연의 기적, 그리고 합동 강화 훈련으로(디지털)</a></div><div class="times"><input type="radio" name="step4" id="step4_11_1" disabled="disabled"><label for="step4_11_1" style="cursor:default;">12:30</label></div></li><li><div class="tit"><span class="screen">03관</span><a href="#" onclick="mstView('movie','20234675')">파묘(디지털)</a></div><div class="times"><input type="radio" name="step4" id="step4_12_1" disabled="disabled"><label for="step4_12_1" style="cursor:default;">09:10</label><input type="radio" name="step4" id="step4_12_2" disabled="disabled"><label for="step4_12_2" style="cursor:default;">11:50</label><input type="radio" name="step4" id="step4_12_3" disabled="disabled"><label for="step4_12_3" style="cursor:default;">14:40</label><input type="radio" name="step4" id="step4_12_4" disabled="disabled"><label for="step4_12_4" style="cursor:default;">17:25</label><input type="radio" name="step4" id="step4_12_5" disabled="disabled"><label for="step4_12_5" style="cursor:default;">20:10</label><input type="radio" name="step4" id="step4_12_6" disabled="disabled"><label for="step4_12_6" style="cursor:default;">22:50</label><input type="radio" name="step4" id="step4_12_7" disabled="disabled"><label for="step4_12_7" style="cursor:default;">25:30</label></div></li><li><div class="tit"><span class="screen">04관(SCREENX)</span><a href="#" onclick="mstView('movie','20234675')">파묘(ScreenX)</a></div><div class="times"><input type="radio" name="step4" id="step4_13_1" disabled="disabled"><label for="step4_13_1" style="cursor:default;">12:40</label></div></li><li><div class="tit"><span class="screen">04관(SCREENX)</span><a href="#" onclick="mstView('movie','20236295')">듄: 파트2(ScreenX)</a></div><div class="times"><input type="radio" name="step4" id="step4_14_1" disabled="disabled"><label for="step4_14_1" style="cursor:default;">09:20</label><input type="radio" name="step4" id="step4_14_2" disabled="disabled"><label for="step4_14_2" style="cursor:default;">15:30</label><input type="radio" name="step4" id="step4_14_3" disabled="disabled"><label for="step4_14_3" style="cursor:default;">21:20</label><input type="radio" name="step4" id="step4_14_4" disabled="disabled"><label for="step4_14_4" style="cursor:default;">24:40</label></div></li><li><div class="tit"><span class="screen">04관(SCREENX)</span><a href="#" onclick="mstView('movie','20247198')">마담 웹(ScreenX)</a></div><div class="times"><input type="radio" name="step4" id="step4_15_1" disabled="disabled"><label for="step4_15_1" style="cursor:default;">18:50</label></div></li><li><div class="tit"><span class="screen">05관</span><a href="#" onclick="mstView('movie','20234675')">파묘(디지털)</a></div><div class="times"><input type="radio" name="step4" id="step4_16_1" disabled="disabled"><label for="step4_16_1" style="cursor:default;">10:30</label><input type="radio" name="step4" id="step4_16_2" disabled="disabled"><label for="step4_16_2" style="cursor:default;">13:20</label><input type="radio" name="step4" id="step4_16_3" disabled="disabled"><label for="step4_16_3" style="cursor:default;">16:10</label><input type="radio" name="step4" id="step4_16_4" disabled="disabled"><label for="step4_16_4" style="cursor:default;">19:00</label><input type="radio" name="step4" id="step4_16_5" disabled="disabled"><label for="step4_16_5" style="cursor:default;">21:45</label><input type="radio" name="step4" id="step4_16_6" disabled="disabled"><label for="step4_16_6" style="cursor:default;">24:30</label></div></li><li><div class="tit"><span class="screen">06관</span><a href="#" onclick="mstView('movie','20236295')">듄: 파트2(디지털)</a></div><div class="times"><input type="radio" name="step4" id="step4_17_1" disabled="disabled"><label for="step4_17_1" style="cursor:default;">12:00</label><input type="radio" name="step4" id="step4_17_2" disabled="disabled"><label for="step4_17_2" style="cursor:default;">22:10</label><input type="radio" name="step4" id="step4_17_3" disabled="disabled"><label for="step4_17_3" style="cursor:default;">25:25</label></div></li><li><div class="tit"><span class="screen">06관</span><a href="#" onclick="mstView('movie','20236488')">밥 말리: 원 러브(디지털)</a></div><div class="times"><input type="radio" name="step4" id="step4_18_1" disabled="disabled"><label for="step4_18_1" style="cursor:default;">09:40</label><input type="radio" name="step4" id="step4_18_2" disabled="disabled"><label for="step4_18_2" style="cursor:default;">15:20</label><input type="radio" name="step4" id="step4_18_3" disabled="disabled"><label for="step4_18_3" style="cursor:default;">19:50</label></div></li><li><div class="tit"><span class="screen">06관</span><a href="#" onclick="mstView('movie','20247076')">귀멸의 칼날: 인연의 기적, 그리고 합동 강화 훈련으로(디지털)</a></div><div class="times"><input type="radio" name="step4" id="step4_19_1" disabled="disabled"><label for="step4_19_1" style="cursor:default;">17:40</label></div></li></ul>
                </div>
           
            </div>
	
      // container
	

Global site tag (gtag.js) - Google Analytics
<script async src="/kobis/web/comm/commjs/gtag.js?id=UA-127072686-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'UA-127072686-1');
</script>

AceCounter Log Gathering Script V.8.0.AMZ2019080601
 <script language='javascript'>
	var _AceGID=(function(){var Inf=['gtt6.acecounter.com','8080','AB2A31560820885','AW','0','NaPm,Ncisy','ALL','0']; var _CI=(!_AceGID)?[]:_AceGID.val;var _N=0;var _T=new Image(0,0);if(_CI.join('.').indexOf(Inf[3])<0){ _T.src ="https://"+ Inf[0] +'/?cookie'; _CI.push(Inf);  _N=_CI.length; } return {o: _N,val:_CI}; })();
	var _AceCounter=(function(){var G=_AceGID;var _sc=document.createElement('script');var _sm=document.getElementsByTagName('script')[0];if(G.o!=0){var _A=G.val[G.o-1];var _G=(_A[0]).substr(0,_A[0].indexOf('.'));var _C=(_A[7]!='0')?(_A[2]):_A[3];var _U=(_A[5]).replace(/\,/g,'_');_sc.src='https:'+'//cr.acecounter.com/Web/AceCounter_'+_C+'.js?gc='+_A[2]+'&py='+_A[4]+'&gd='+_G+'&gp='+_A[1]+'&up='+_U+'&rd='+(new Date().getTime());_sm.parentNode.insertBefore(_sc,_sm);return _sc.src;}})();
</script>
<noscript><img src='//gtt6.acecounter.com:8080/?uid=AB2A31560820885&je=n&' border='0' width='0' height='0' alt=''></noscript>	
AceCounter Log Gathering Script End

<script language='javascript'>
function familySite(){
   if (document.getElementById("familySite").value == "a2") {
	   window.open ("https://www.kofic.or.kr");
   } else if (document.getElementById("familySite").value == "a3") {
	   window.open ("https://www.kobis.or.kr/kobisopenapi/homepg/main/main.do");
   }
} -->
</script>
<!-- AceCounter Log Gathering Script End -->
	
              
              
                
       
          
    



<%@ include file="../common/foot.jspf"%>