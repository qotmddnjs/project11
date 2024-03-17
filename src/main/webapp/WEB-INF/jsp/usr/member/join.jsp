<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="JOIN"></c:set>
<%@ include file="../common/head.jspf"%>


<!-- <section class="mt-8 text-xl px-4">
	<div class="mx-auto">
		<form action="../member/doJoin" method="POST">
			<table class="join-box table-box-1" border="1">
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
						<th>이름</th>
						<td><input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
							placeholder="이름을 입력해주세요" name="name" /></td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td><input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
							placeholder="닉네임을 입력해주세요" name="nickname" /></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
							placeholder="전화번호를 입력해주세요" name="cellphoneNum" /></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
							placeholder="이메일을 입력해주세요" name="email" /></td>
					</tr>

					<tr>
						<th></th>
						<td><input class="btn btn-outline btn-info" type="submit" value="가입" /></td>
					</tr>
				</tbody>
			</table>
		</form>
		<div class="btns">
			<button class="btn btn-outline" class="" type="button" onclick="history.back();">뒤로가기</button>
		</div>
	</div>
</section> -->
<div class="join-container">
    <div class="joinimg"></div> <!-- 배경 이미지가 적용될 요소 -->
    <div class="join-form-container">
    <form action="../member/doJoin" method="POST">
        <form class="joinform">
            <h1><span>회원가입</span></h1>
            <input placeholder="Username" type="text"name="loginId"/>
            <input placeholder="Password" type="password""loginPw"/>
            <input placeholder="Confirm Password" type="password" name="loginPw"/>
            <input placeholder="Name" type="text"name="name"/>
            <input placeholder="생년월일 ex)98/12/30" type="text"name="cellphoneNum"/>
            <input placeholder="닉네임" type="text"name="nickname"/>
            <input placeholder="Email" type="text" name="email"/>
            <input class="btn btn-outline btn-info" type="submit" value="가입" />
        </form>
    </div>
</div>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<link rel="stylesheet" href="styles.css"> <!-- CSS 파일을 연결합니다 -->


<%@ include file="../common/foot.jspf"%>