<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="LOGIN"></c:set>
<%@ include file="../common/head.jspf"%>


<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
		<form action="../member/doLogin" method="POST">
			<table class="login-box table-box-1" border="1">
				<tbody>
					<tr>
						<th>아이디</th>
						<td><input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
							placeholder="아이디를 입력해주세요" name="loginId" /></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
							placeholder="비밀번호를 입력해주세요" name="loginPw" /></td>
					</tr>
					<tr>
						<th></th>
						<td><input class="btn btn-outline btn-info" type="submit" value="로그인" /></td>
					</tr>
				</tbody>
			</table>
		</form>
		<div class="btns">
			<button class="btn btn-outline" type="button" onclick="history.back();">뒤로가기</button>
		</div>
	</div>
</section>



<%@ include file="../common/foot.jspf"%>

<div class="🤚">
	<div class="👉"></div>
	<div class="👉"></div>
	<div class="👉"></div>
	<div class="👉"></div>
	<div class="🌴"></div>		
	<div class="👍"></div>
</div>
<label class="bb8-toggle">
      <input class="bb8-toggle__checkbox" type="checkbox">
      <div class="bb8-toggle__container">
        <div class="bb8-toggle__scenery">
          <div class="bb8-toggle__star"></div>
          <div class="bb8-toggle__star"></div>
          <div class="bb8-toggle__star"></div>
          <div class="bb8-toggle__star"></div>
          <div class="bb8-toggle__star"></div>
          <div class="bb8-toggle__star"></div>
          <div class="bb8-toggle__star"></div>
          <div class="tatto-1"></div>
          <div class="tatto-2"></div>
          <div class="gomrassen"></div>
          <div class="hermes"></div>
          <div class="chenini"></div>
          <div class="bb8-toggle__cloud"></div>
          <div class="bb8-toggle__cloud"></div>
          <div class="bb8-toggle__cloud"></div>
        </div>
        <div class="bb8">
          <div class="bb8__head-container">
            <div class="bb8__antenna"></div>
            <div class="bb8__antenna"></div>
            <div class="bb8__head"></div>
          </div>
          <div class="bb8__body"></div>
        </div>
        <div class="artificial__hidden">
          <div class="bb8__shadow"></div>
        </div>
      </div>
    </label>
