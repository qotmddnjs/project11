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

<div class="movie poster" style="position: relative; overflow-x: auto;">
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
</div>
<script>
        

 

        const poster = document.querySelector('.movie.poste

        const poster = document.querySelector('.mov

        const poster = document.querySelector('.movie.poster');
        const leftButton = document.querySelector('.scroll-butto

        const poster = document.querySelector('.movie.poster');
        const leftButton = document.querySelector('.scr

        const poster = document.querySelector('.movie.poster');
        const leftButton = document.querySelector('.scroll-button.left');
        const rightButton = document.querySelector('.scroll-button

        const poster = document.querySelector('.movie.poster');
        const leftButton = document.querySelector('.scroll-button.left');
        const rightButton = document.querySelector('.scro

        const poster = document.querySelector('.movie.poster');
        const leftButton = document.querySelector('.scroll-button.left');
        const rightButton = document.querySelector('.scroll-button.right');

        leftButton.addEventListener('click', () => {
            poster.scrollBy({
                left: -100,
                behavior: 'sm

        const poster = document.querySelector('.movie.poster');
        const leftButton = document.querySelector('.scroll-button.left');
        const rightButton = document.querySelector('.scroll-button.right');

        leftButton.addEventListener('click', () => {
            poster.scrollBy({
                left: -100,
                behavior: 'smooth'
            });
        });

        rightButton.addEventListener('click', () => {
            poster.scrollBy({
                left: 100,
                behavior: 's

        const poster = document.querySelector('.movie.poster');
        const leftButton = document.querySelector('.scroll-button.left');
        const rightButton = document.querySelector('.scroll-button.right');

        leftButton.addEventListener('click', () => {
            poster.scrollBy({
                left: -100,
                behavior: 'smooth'
            });
        });

        rightButton.addEventListener('click', () => {
            poster.scrollBy({
                left: 100,
                behavior: 'smooth'
            });
        });
    </script>
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
                <p class="author">작성자: bae  내용</p>
            </div>
        </div>
    </div>
    <div class="map-container">
        <div class="map-box">
            <img src="https://play-lh.googleusercontent.com/pPTTNz433EYFurg2j__bFU5ONdMoU_bs_-yS2JLZriua3iHrksGP6XBPF5VtDPlpGcW4=w600-h300-pc0xffffff-pd" alt="">
        </div>
    </div>
</div>

<%@ include file="../common/foot.jspf"%>