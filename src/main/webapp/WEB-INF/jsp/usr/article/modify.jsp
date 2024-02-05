<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ARTICLE DETAIL"></c:set>
<%@ include file="../common/head.jspf"%>


<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
		<table class="table-box-1" border="1">
			<tbody>
				<tr>
					<th>아이디</th>
					<td><input autocomplete="off" type="text" placeholder="제목,," name="title" /></td>


					<th>비밀번호</th>
					<td><input autocomplete="off" type="text" placeholder="내용" name="body" /></td>
				</tr>

			</tbody>
		</table>
		<div class="btns">
			<button class="hover:underline" type="button" onclick="history.back();">뒤로가기</button>
			<c:if test="${article.userCanModify }">
				<a onclick="if(confirm('정말 수정하시겠습니까?') == false) return false;" href="../article/modify?id=${article.id } }">수정</a>
			</c:if>

		</div>
	</div>
</section>

<%@ include file="../common/foot.jspf"%>