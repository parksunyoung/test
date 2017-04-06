<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head>
<link href="assets/css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script> 
$(function(){
	var dialogupload = $("$dialogTable").dialog({
		autopOpen: false,
		modal:true,
		buttons:{
			"등록" :function(){
				$("#dialogTable").submit();
				$(this).dialog("close");
			},
			"취소" : function(){
				$(this).dialog("close");
			}
		},
		close:function(){
			$("#dialogTable").get(0).reset();
		}
	});
	$("#dialog-delete").click(function(event){
		event.preventDefault();
		dialogupload.dialog("open");
	})
})
 function submitdel(val){
	var subform = document.submint_del_modi;
	if(val == "delete"){
		subform.action="delete";
	}else if(val == "modify"){
		subform.action="modify";		
	}

} 
$(function(){ 
	//전체선택 체크박스 클릭 
	$("#checkboxAll").click(function(){ 
		//만약 전체 선택 체크박스가 체크된상태일경우 
		if($("#checkboxAll").prop("checked")) { 
			//해당화면에 전체 checkbox들을 체크해준다 
			$("input[type=checkbox]").prop("checked",true); 
			// 전체선택 체크박스가 해제된 경우 
			} else { 
				//해당화면에 모든 checkbox들의 체크를해제시킨다. 
				$("input[type=checkbox]").prop("checked",false); 
				} 
		}); 
})
 */ */ */ */
</script>


<body topmargin="0" leftmargin="0">

<table id="dialogTable" class = "table01" width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td height="25"><img src="assets/image/icon.gif" width="9" height="9" align="absmiddle"> 
      <strong>사원조회</strong></td>
  </tr>
  <tr> 
    <td><table class = "table01" width="640" border="0" cellspacing="0" cellpadding="0">
        <tr> 
               
         <td height="30" align="right">
  		<form id="search_form" method="get">
           <select name="filterCheck" action="${pageContext.request.contextPath }/main"class="INPUT">            	
              	<option value ="1">::::: 전체 :::::</option>
              	<option value ="2">::::: 이름 :::::</option>
              	<option value ="3">::::: 성별 :::::</option>
              	<option value ="4">:::: 기술등급  ::::</option>
           </select>
			<input name="kwd" type="text" value="${map.kwd }" id="kwd">
            <input type="submit" value="검색" >
  		 </form>
         </td>
        </tr>

        <tr> 
          <td>
          	<form id="submint_del_modi" name="submint_del_modi" method="post" >
          	 <table width="640" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="3" background="image/bar_bg1.gif"></td>
              </tr>
 	
             <!------------------------- 수정 ------------------------------>
              <tr align="center" bgcolor="F8F8F8"> 
                <td height="26" align="right" bgcolor="F8F8F8" style="padding-right:10"><img src="assets/image/all_icon.gif" width="11" height="11" style="vertical-align:middle"> 
                 <input type="submit"  value="수정" style="background-color:transparent;border=0;" onclick="submitdel('modify');"  > <img src="assets/image/all_icon.gif" width="11" height="11"style="vertical-align:middle"> 
                  <a href="#">인사기록카드</a> <img src="assets/image/all_icon.gif" width="11" height="11" style="vertical-align:middle"> 
                  <a href="#">경력정보</a> <img src="assets/image/all_icon.gif" width="11" height="11" style="vertical-align:middle"> 
                  <a href="#">근무정보</a> </td>
              </tr>
              <tr align="center" bgcolor="F8F8F8"> 
                <td height="1" align="right" bgcolor="B1B1B1"></td>
              </tr>
              <tr> 
                <td>
				<!-------------------------  데이터 리스트 출력 ------------------------------>
				<table  width="640" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <th><input type="checkbox" id="checkboxAll" name="checkboxAll" value=""></th>
                      <th width="35" height="20" align="center"></th>
                      <th width="85" align="center">이름</th>
                      <th width="153" align="center">주민번호</th>
                      <th width="91" align="center">성별</th>
                      <th width="91" align="center">기술등급</th>
                      <th width="91" align="center">상태</th>
                      <th width="94" align="center">근무</th>
                    </tr>

   					<c:forEach items="${map.list }" var="vo">
	                    <tr> 
	                      <td width="35" height="20" align="center">
	                      <input type="checkbox" name="chbox" value=${vo.no }></td>
	                      <td width="85" align="center">${vo.korName }</td>
	                      <td width="153" align="center">${vo.juminNo }</td>
	                      <td width="91" align="center">${vo.sex }</td>
	                      <td width="91" align="center">${vo.techLev }</td>
	                      <td width="94" align="center">${vo.empEtc }</td>	                      
	                      <td width="91" align="center">${vo.state }</td>

	                    </tr>
	                    <tr> 
	                      <td colspan="7" background="assets/image/line_bg.gif"></td>
	                    </tr>
                    </c:forEach>


 				<!-------------------------  페이징  ------------------------------>

                    <tr> 
                      <td height="35" colspan="7" align="center" style="padding-bottom:3">
                    <c:if test="${map.page != 1}" >                      
                        <a href="${pageContext.request.contextPath }/main?page=1&kwd=${map.kwd }">
                        	<img src="assets/image/prev.gif" width="22" height="15" border="0" align="absmiddle"></a>&nbsp;
                    </c:if>
                    <c:if test="${map.pre_page>map.count_page}" >
						<a href="${pageContext.request.contextPath }/main?page=${map.before_page}&kwd=${map.kwd }">
								<img src="assets/image/pre.gif" width="42" height="15" border="0" style="vertical-align:middle"></a>&nbsp; 
					</c:if>
					<c:forEach begin="${map.pre_page }" end="${map.after_page }" var="page">
						<c:choose>
						<c:when test="${page > map.last_page}">
						</c:when>
						<c:otherwise>
						<a href="${pageContext.request.contextPath }/main?page=${page}&kwd=${map.kwd }">${page}</a>
						</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${map.after_page<map.last_page }" >
						<a href="${pageContext.request.contextPath }/main?page=${map.next_page}&kwd=${map.kwd }"><img src="assets/image/next.gif" width="42" height="15" border="0" style="vertical-align:middle"></a>
					</c:if>
					  <c:if test="${map.page != map.last_page}" >    
					     <a href="${pageContext.request.contextPath }/main?page=${map.last_page}&kwd=${map.kwd }"><img src="assets/image/next_.gif" width="22" height="15" border="0" align="absmiddle"></a>
					     </c:if>
					     </td>
					  </td>
                    </tr>
                  </table>
                  
 				<!-------------------------  삭제 ------------------------------>
				  </td>
              </tr>
              <tr align="center" bgcolor="F8F8F8"> 
                <td height="1" align="right" bgcolor="B1B1B1"></td>
              </tr>
              <tr align="center" bgcolor="F8F8F8"> 
                <td height="26" align="right" bgcolor="F8F8F8" style="padding-right:10;vertical-align:middle"><img src="assets/image/all_icon.gif" width="11" height="11" >
                  <input type="submit" id="dialog-delete" value="삭제" style="background-color:transparent;border=0;" onclick="submitdel('delete');" > 
                  <img src="assets/image/all_icon.gif" width="11" height="11" style="vertical-align:middle"> 
                  <a href="#">인사기록카드</a> <img src="assets/image/all_icon.gif" width="11" height="11" style="vertical-align:middle"> 
                  <a href="#">경력정보</a> <img src="assets/image/all_icon.gif" width="11" height="11" style="vertical-align:middle"> 
                  <a href="#">근무정보</a> </td>
          
              </tr>
            </table> </form> </td>
        </tr>

        <tr> 
          <td height="3" background="image/bar_bg1.gif"></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
