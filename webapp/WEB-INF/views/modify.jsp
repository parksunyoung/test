<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<link href="assets/css/style.css" rel="stylesheet" type="text/css">
</head>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
 
<script>
$.fn.setPreview = function(opt){
    "use strict"
    var defaultOpt = {
        inputFile: $(this),
        img: null,
        w: 144,
        h: 110
    };
    $.extend(defaultOpt, opt);
 
    var previewImage = function(){
        if (!defaultOpt.inputFile || !defaultOpt.img) return;
 
        var inputFile = defaultOpt.inputFile.get(0);
        var img       = defaultOpt.img.get(0);
 
        // FileReader
        if (window.FileReader) {
            // image 파일만
            if (!inputFile.files[0].type.match(/image\//)) return;
 
            // preview
            try {
                var reader = new FileReader();
                reader.onload = function(e){
                    img.src = e.target.result;
                    img.style.width  = defaultOpt.w+'px';
                    img.style.height = defaultOpt.h+'px';
                    img.style.display = '';
                }
                reader.readAsDataURL(inputFile.files[0]);
            } catch (e) {
                // exception...
            }
        // img.filters (MSIE)
        } else if (img.filters) {
            inputFile.select();
            inputFile.blur();
            var imgSrc = document.selection.createRange().text;
 
            img.style.width  = defaultOpt.w+'px';
            img.style.height = defaultOpt.h+'px';
            img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";           
            img.style.display = '';
        // no support
        } else {
            // Safari5, ...
        }
    };
 
    // onchange
    $(this).change(function(){
        previewImage();
    });
};
 
 
$(document).ready(function(){
    var opt = {
        img: $('#img_preview'),
        w: 110,
        h: 110
    };
 
    $('#input_file').setPreview(opt);
});

</script>
<body topmargin="0" leftmargin="0">
<table width="640" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="640">&nbsp;</td>
  </tr>
  <tr> 
    <td height="25"><img src="assets/image/icon.gif" width="9" height="9" align="absmiddle"> 
      <strong>사원 기본 정보 등록</strong></td>
  </tr>
  <tr> 
    <td> 
     <form class="emp-form" ENCTYPE="multipart/form-data" method="post" action="upload">
      <table width="640" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="15" align="left"><table width="640" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><table width="640" border="0" cellspacing="1" cellpadding="0">
                    <tr> 
                      <td height="2" background="assets/image/bar_bg1.gif"></td>
                    </tr>
                    <tr align="center" bgcolor="F8F8F8"> 
                      <td height="26" align="center" bgcolor="#E4EBF1" style="padding-right:10"><table width="600" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td align="center"><strong>교육정보 | 자격증, 보유기술정보 | 프로젝트 정보 | 경력정보| 근무정보 </strong></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr align="center" bgcolor="F8F8F8"> 
                      <td height="3" align="right" background="assets/image/bar_bg1.gif"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
       

        <tr> 
          <td height="6" align="center" valign="top">&nbsp;</td>
        </tr>
        <tr>
          <td height="7" align="center" valign="top"><table width="600" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td bgcolor="#CCCCCC"><table width="600" border="0" cellspacing="1" cellpadding="0">
                    <tr> 
                      <td height="135" align="center" bgcolor="#E4EBF1"><table width="600" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="144" height="119" align="center"><table width="100" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td height="112" bgcolor="#CCCCCC"><table width="100" border="0" cellspacing="1" cellpadding="0">
                                  <tr>
                                    <td height="110" bgcolor="#FFFFFF"><img width ="110" height="112" src="${pageContext.request.contextPath}/images/${isMasterVo.image }" id="img_preview" value=${isMasterVo.image } />


                                  </tr>
                              </table></td>
                            </tr>
                          </table></td>
                          <td width="456"><table width="423" border="0" cellspacing="2" cellpadding="0">
                            <tr>
                              <td height="2" colspan="2"></td>
                              </tr>
                            <tr>
                              <td width="107" height="26" align="right"><strong>한글이름 :</strong>&nbsp;</td>
                              <td width="310" height="26">
                                <input type="text" name="korName" value="${isMasterVo.korName }"><input type="hidden"name="no" value=${isMasterVo.no }>
                              </td>
                            </tr>
                            <tr>
                              <td height="26" align="right"><strong>영문이름 :&nbsp;</strong></td>
                              <td height="26"><input type="text" name="engName" value="${isMasterVo.engName }"></td>
                            </tr>
                            <tr>
                              <td height="26" align="right"><strong>한자:</strong>&nbsp;</td>
                              <td height="26"><input type="text" name="hanName" value="${isMasterVo.hanName }"></td>
                            </tr>
                            <tr>
                              <td height="26" align="right"><strong>주민등록번호 :</strong>&nbsp;</td>
                              <td height="26"><input name="textjumin1" type="text" size="15" value="${isMasterVo.textjumin1 }">
      -
        <input name="textjumin2" type="text" size="15" value="${isMasterVo.textjumin2 }"></td>
                            </tr>
                          </table></td>
                        </tr>
                      </table></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td height="7" align="center" valign="top">&nbsp;</td>
        </tr>
        <tr> 
          <td height="13" align="center"><table width="600" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td bgcolor="#CCCCCC"><table width="600" border="0" cellspacing="1" cellpadding="0">
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="526" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="96" align="right"><strong>사진파일 :&nbsp;</strong></td>
                
                            <td width="391" ><font color="#FF0000">
							<input type="file" onfocus=image(); id="input_file" name="file" value="${isMasterVo.image }"/>
						</font></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="102" align="right"><strong>생년월일 :&nbsp;</strong></td>
                            <td width="391"><input name="birthyear" type="text" size="10" value="${isMasterVo.birthyear }">
                              년 
                              <input name="birthmonth" type="text" size="7" value="${isMasterVo.birthmonth }">
                              월 
                              <input name="birthday" type="text" size="7" value="${isMasterVo.birthday }">
                              일( 
                            <c:choose> 
	                            <c:when test="${'양력' == isMasterVo.marry }">
                              <input type="radio" name="birth02" value="양력" checked="checked"> 양력 
                              <input type="radio" name="birth02" value="음력" > 음력    
	                            </c:when>
	                            <c:otherwise>
                              <input type="radio" name="birth02" value="양력"> 양력 
                              <input type="radio" name="birth02" value="음력" checked="checked"> 음력                            
	                            </c:otherwise>
	              
	                         </c:choose>

                              
                              )</td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="102" align="right"><strong>성별 :&nbsp; </strong></td>
                            <td width="391">
                            <c:choose> 
	                            <c:when test="${'남자' == isMasterVo.sex }">
		                            <input type="radio" name="sex" value="남자" checked="checked"> 남자 
		                            <input type="radio" name="sex" value="여자" >여자
	                            </c:when>
	                            <c:otherwise>
		                            <input type="radio" name="sex" value="남자" > 남자 
		                            <input type="radio" name="sex" value="여자" checked="checked">여자
	                            </c:otherwise>
                            </c:choose>
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="102" align="right"><strong>결혼유무 :&nbsp;</strong></td>
                            <td width="391"> 
                             <c:choose> 
	                            <c:when test="${'유' == isMasterVo.marry }">
                            <input type="radio" name="marry" value="유" checked="checked"> 유
                            <input type="radio" name="marry" value="무" >무	
	                            </c:when>
	                            <c:otherwise>
                            <input type="radio" name="marry" value="유">유
                            <input type="radio" name="marry" value="무" checked="checked">무	                            
	                            </c:otherwise>
	              
	                         </c:choose>

                              </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>년차 :&nbsp;</strong></td>
                            <td width="392"><input name="empYear" type="text" size="10" value="${isMasterVo.empYear }"> 
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>급여 지급유형 :&nbsp;</strong></td>
                            <td width="392"> 
                              <select name="money">
                                <option value="월급">월급</option>
                                <option value="주급">주급</option>
                              </select> </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>희망직무 :&nbsp;</strong></td>
                            <td width="392"> 
                              <select name="state">
                                <option value="SI">SI</option>
                                <option value="SM">SM</option>
                              </select> </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>입사유형:&nbsp;</strong></td>
                            <td width="392"> 
                              <select name="empEtc">
                                <option value="정규직">정규직</option>
                                <option value="계약직">계약직</option>
                              </select> </td>
                          </tr>
                        </table></td>
                    </tr>
                   
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>주소:&nbsp;</strong></td>
                            <td width="392">
                              <input name="address" type="text" size="50" value="${isMasterVo.address }"> 
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>연락처:&nbsp;</strong></td>
                            <td width="392"><input name="textphone1" type="text" size="10" value="${isMasterVo.textphone1 }">
                              - 
                              <input name="textphone2" type="text" size="10" value="${isMasterVo.textphone2 }">
                              - 
                              <input name="textphone3" type="text" size="10" value="${isMasterVo.textphone3 }"></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>이메일:&nbsp;</strong></td>
                            <td width="392"><input name="email" type="text" size="20" value="${isMasterVo.email }"> 
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>기술등급:&nbsp;</strong></td>
                            <td width="392"><input name="techLev" type="text" size="20" value="${isMasterVo.techLev }"> 
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>주량:&nbsp;</strong></td>
                            <td width="392"><input name="drink" type="text" size="20" value="${isMasterVo.drink }"> 
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td height="3" align="center">&nbsp;</td>
        </tr>
        <tr>
          <td height="3" align="center"><table width="107" border="0" cellpadding="1" cellspacing="1">
            <tr>
              <td width="49">
              <input  TYPE="IMAGE" src="assets/image/bt_remove.gif" name="Submit" value="Submit"  align="absmiddle"></td>
              <td width="51"><a href="${pageContext.request.contextPath }/main"><img src="assets/image/bt_cancel.gif" width="49" height="18"></a></td>
            </tr>
          </table>            </td>
        </tr>
     
        <tr> 
          <td height="7" align="right">&nbsp;</td>
        </tr>
      </table>   </form></td>
  </tr>
</table>
</body>
</html>
