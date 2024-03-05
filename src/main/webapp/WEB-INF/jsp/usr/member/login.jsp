<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="LOGIN"></c:set>
<%@ include file="../common/head.jspf"%>


<%-- <section class="mt-8 text-xl px-4">
	<div class="mx-auto">
		<form action="../member/doLogin" method="POST">
			<input type="hidden" name="afterLoginUri" value="${param.afterLoginUri }" />
			<table class="login-box table-box-1" border="1">
				<tbody>
					<tr>
						<th>아이디</th>
						<td>
							<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="아이디를 입력해주세요" name="loginId" />
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="비밀번호를 입력해주세요" name="loginPw" />
						</td>
					</tr>
					<tr>
						<th></th>
						<td>
							<input class="btn btn-outline btn-info" type="submit" value="로그인" />
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<div class="btns">
			<button class="btn btn-outline" type="button" onclick="history.back();">뒤로가기</button>
		</div>
	</div> --%>
</section>
<body class = "loginbody">
	

<form action="../member/doLogin" method="POST" class="loginform">
  <h1><span>Movie</span> Time</h1>
  <input placeholder="Username" type="text" name="loginId"/>
  <input placeholder="Password" type="password" name="loginPw"/>
  <button class="btn btn-outline btn-info" type="submit"value="로그인">Log in</button>
  <h6>또는?</h6>
  <div class="social">
  <button class="tw btn">Kakao</button>
  <button class="fb btn">Naver</button>
  <button class="google fb btn">Google+</button>
  </div>
</form>

<footer >
  <h5>처음이신가요? <a target="_blank" href="../member/join">회원가입</a></h5>
</footer>

<script>
$(document).ready(function(e){
   $('h6').on('click',function(){
      $('.social').stop().slideToggle();
   });
})
</script>
</body>


<%@ include file="../common/foot.jspf"%>