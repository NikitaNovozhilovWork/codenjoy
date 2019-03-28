<%--
  #%L
  Codenjoy - it's a dojo-like platform from developers to developers.
  %%
  Copyright (C) 2018 Codenjoy
  %%
  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as
  published by the Free Software Foundation, either version 3 of the
  License, or (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public
  License along with this program.  If not, see
  <http://www.gnu.org/licenses/gpl-3.0.html>.
  #L%
  --%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<html>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<head>
    <meta http-equiv="Content-Type" content="text/html;">
    <title>Codenjoy login</title>

    <link href="${ctx}/resources/css/all.min.css" rel="stylesheet">
    <link href="${ctx}/resources/css/custom.css" rel="stylesheet">
    <jsp:include page="common-inclusion.jsp" />
</head>
<body>
<div id="settings" page="register" contextPath="${ctx}" gameName="${gameName}" waitApprove="${wait_approve}"></div>

<%@include file="forkMe.jsp"%>

<div class="page-header">
    <h1 id="title">Login</h1>
</div>

<form action="${ctx}/process_login" method="POST">
    <table>
        <tr>
            <td>Email<form:errors path="email"/></td>
        </tr>
        <tr>
            <td>
                <input name="email"/>
                <span class="error">
                        <c:if test="${email_busy}">Already used</c:if>
                        <c:if test="${bad_email}">${bad_email_message}</c:if>
                        <c:if test="${wait_approve}">Please check your email</c:if>
                    </span>
            </td>
        </tr>
        <tr>
            <td>Password<errors path="password"/></td>
        </tr>
        <tr>
            <td>
                <input name="password" type="password"/>
                <span class="error">
                        <c:if test="${bad_pass}">Bad password</c:if>
                    </span>
            </td>
        </tr>
        <c:if test="${not adminLogin}">
            <tr>
                <td>Your game</td>
            </tr>
            <tr>
                <td>
                    <select name="gameName">
                        <c:forEach items="${gameNames}" var="g" >
                            <option value="${g}">${g}</option>
                        </c:forEach>
                    </select>
                    <span class="error">
                            <c:if test="${bad_game}">${bad_game_message}</c:if>
                        </span>
                </td>
            </tr>
        </c:if>
        <tr>
            <td colspan="3">
                <input type="submit" id="submit" value="Login" />
            </td>
            <td colspan="3">
                <c:choose>
                    <c:when test="${opened}">
                        <a href="${ctx}/register">Not registered yet</a>
                    </c:when>
                    <c:otherwise>
                        Registration was closed, please try again tomorrow.
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
    </table>
</form>

</body>
</html>