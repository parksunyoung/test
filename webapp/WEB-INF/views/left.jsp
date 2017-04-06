<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<Link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css" type="text/css">
</head>
<body topmargin="0" leftmargin="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td align="center" valign="top"><table width="170" height="300" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="9"><img src="assets/image/left_top.gif" width="170" height="9"></td>
        </tr>
        <tr> 
          <td align="center" valign="top" background="assets/image/left_bg.gif">
		  <!----------------------  네비게이션 ----------------------------->
		  <table width="150" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="17" height="20"><img src="assets/image/left_icon.gif" width="11" height="11" align="absmiddle"></td>
                <td width="133"><a href="main" target="mainFrame">기본정보</a></td>
              </tr>
              <tr> 
                <td height="20">&nbsp;</td>
                <td>- <a href="join" target="mainFrame">등록</a></td>
              </tr>
              <tr> 
                <td height="20"><img src="assets/image/left_icon.gif" width="11" height="11" align="absmiddle"></td>
                <td>직원명부</td>
              </tr>
              <tr> 
                <td height="20"><img src="assets/image/left_icon.gif" width="11" height="11" align="absmiddle"></td>
                <td>퇴직자현황</td>
              </tr>
              <tr> 
                <td height="20"><img src="assets/image/left_icon.gif" width="11" height="11" align="absmiddle"></td>
                <td>예비인력정보</td>
              </tr>
              <tr> 
                <td height="20"><img src="assets/image/left_icon.gif" width="11" height="11" align="absmiddle"></td>
                <td>거래처정보</td>
              </tr>
              <tr> 
                <td height="20">&nbsp;</td>
                <td>- 등록</td>
              </tr>
            </table>
		  <!----------------------  �޴��� ----------------------------->
			</td>
        </tr>
        <tr> 
          <td height="9"><img src="assets/image/left_bottom.gif" width="170" height="9"></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td align="center"><table width="170" height="49" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td align="center" background="assets/image/left_box.gif">
		  <!------------------------------ 경력검색 ---------------------------------->
		  <table width="155" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="17"><img src="assets/image/left_icon.gif" width="11" height="11" align="absmiddle"></td>
                <td width="143" height="20"><strong>경력검색</strong></td>
              </tr>
              <tr align="right"> 
                <td colspan="2"><input name="textfield" type="text" class="flat" size="15" maxlength="14"> 
                  <img src="assets/image/search.gif" width="49" height="18" align="absmiddle"></td>
              </tr>
            </table>
		  <!------------------------------ ��°˻� ---------------------------------->
			</td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
