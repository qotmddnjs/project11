<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MYPAGE"></c:set>
<%@ include file="../common/head.jspf"%>

<%-- <div>${loginedMember }</div>
<div>${loginedMember.loginId }</div>
<div>${rq.loginedMember }</div>
<div>${rq.loginedMember.loginId }</div>
<div>${rq.loginedMember.getLoginId() }</div> --%>
<%-- <section class="mt-8 text-xl px-4 ">
	<div class="">
		<table class="table-box-1 " border="1">
			<colgroup>
				<col width="200" />
			</colgroup>

			<tbody>
				<tr>
					<th>가입일</th>
					<td>${loginedMember.regDate }</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>${loginedMember.loginId }</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${loginedMember.name }</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>${loginedMember.nickname }</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>${loginedMember.cellphoneNum }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${loginedMember.email }</td>
				</tr>
				<tr>
					<th></th>
					<td>
						<a href="../member/checkPw" class="btn btn-active btn-ghost">회원정보 수정</a>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="btns">
		<button class="btn-text-link btn btn-active btn-ghost" type="button" onclick="history.back();">뒤로가기</button>


	</div>
</section> --%>

<hr style="border-top: 3px solid white;" />
<div class="mupageba">
  <div class="mupageba1"></div>
  <div class="mupageba2">	
    <a href="">계정관리</a>
    <a href="">내정보</a>
    <a href="">보안</a>
    <a href=""></a>
    <div class ="mupageba3"></div>
  </div> 
  <!-- <div class="information">
    여기에 정보를 추가해주세요.
    <div>
      <p class="info-item">이름: [이름]</p>
      <p class="info-item">아이디: [아이디]</p>
      <p class="info-item">생년월일: [생년월일]</p>
      <p class="info-item">이메일: [이메일]</p>
    </div>
  </div>
</div> --> -->


  
    <header>
      <div class="content header-content">
        <img class="udacity-logo" src="https://cameronwp.github.io/cpcom/static/udacity_logo.svg" alt="Udacity Logo">
        <h1>Front-End Apprentice</h1>
      </div>
    </header>
    <section class="hero">
      <div class="content">
        <img class="my-picture" src="https://pp.vk.me/c630031/v630031808/117cb/Q0Nb-Xg3uwc.jpg" alt="This is a picture of me">
        <p class="iama">My name is...</p>
        <p class="my-name my-info">Mikhail</p>
        <p class="iama">I want to be...</p>
        <p class="my-info">a front-end master</p>
      </div>
    </section>
    <section class="about-me content">
      <p class="iama">I live in...</p>
      <p class="my-info">Kiev</p>
      <p class="iama">My favorite way to work is...</p>
      <p class="my-info">over the Paton bridge across Dnieper</p>
      <p class="iama">In my free time, I like to...</p>
      <p class="my-info">work on my nanodegree</p>
    </section>
  
 

<%@ include file="../common/foot.jspf"%>