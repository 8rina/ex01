<!--
/////////////////////////////////////////
//Title   : top 상단
//Date    : 2016.7.27
//Author  : 고항석
//comment : 실습규칙2
//
///////////////////////////////////////////
-->

<!DOCTYPE html>
<html>
	<head>
		<title> 팬션홈페이지</title>
<style type='text/css'>
<style type="text/css">
td { font-size:12; text-align:center; }
a:link {text-decoration:none; }
a:visited {text-decoration:none;}
a:hover {text-decoration:none; }
a:acvite {text-decoration:none;}
</style>	
<script language="javascript" type="text/javascript">
//<![CDATA[
var muCnt   = 5;


function fncShow( pos )
{
    var i   = 0;
    for( i; i<muCnt; i++ )
    {
        var obj = document.getElementById("menu"+i);
		var obj2 = document.getElementById("m"+i);

        if( i == pos )
        {
            obj.style.display   = '';
			obj2.style.color="#ff0000";
        }
        else
        {
            obj.style.display   = 'none';
			obj2.style.color="#FFFFFF";
        }
    }
}


function fncHide( pos )
{
    var obj             = document.getElementById("menu"+pos);
    obj.style.display   = 'none';
}


//]]>
</script>
</head>
<body bgcolor="#333333">
<center>
<table width="750" border="0" cellspacing="1" cellpadding="0">
<tbody><tr><td width="150"> 	<a href="main.htm" target="main"><img width="175" height="67" src="resources/logo.jpg" border="0"></a>
</td>
<td>
<table width="600" height="60" border="0" cellspacing="1" cellpadding="0">
    <tbody><tr height="30">
        <td width="100" id="m0" style="color: rgb(255, 255, 255);" onmouseover="fncShow(0);"><b> 팬션소개  </b></td>
        <td width="100" id="m1" style="color: rgb(255, 255, 255);" onmouseover="fncShow(1);"><b> 찾아오기  </b></td>
        <td width="100" id="m2" style="color: rgb(255, 255, 255);" onmouseover="fncShow(2);"><b> 즐길거리  </b></td>
        <td width="100" id="m3" style="color: rgb(255, 255, 255);" onmouseover="fncShow(3);"><b> 예약하기  </b></td>
        <td width="100" id="m4" style="color: rgb(255, 255, 255);" onmouseover="fncShow(4);"><b> 팬션소식 </b></td>
		<td width="100"></td>
    </tr>
    <tr height="30">
        <td colspan="6">


            <table width="600" height="30" id="menu0" style="display: none;" border="0" cellspacing="0" cellpadding="0">
                <tbody><tr>
				    <td width="0"></td>
                    <td width="600" style="text-align: left;">
						<a href="resources/main.htm" target="main">
						<span style="color: rgb(255, 255, 255);" onmouseover="this.style.color='#FFFFFF'" onmouseout="this.style.color='#997000'">| 고양이팬션 </span>
						</a>
                        <a href="resources/a_01.htm" target="main">
						<span onmouseover="this.style.color='#FFFFFF'" onmouseout="this.style.color='#997000'">| 토끼방 </span>
						</a>
                        <a href="resources/a_02.htm" target="main">
						<span onmouseover="this.style.color='#FFFFFF'" onmouseout="this.style.color='#997000'">| 사슴방 </span>
						</a>
                        <a href="resources/a_03.htm" target="main">
						<span onmouseover="this.style.color='#FFFFFF'" onmouseout="this.style.color='#997000'">| 곰방 |</span>
						</a>
                    </td>
                </tr>
            </tbody></table>


             <table width="600" height="30" id="menu1" style="display: none;" cellspacing="0" cellpadding="0">
                <tbody><tr>
				    <td width="100"></td>
					<td width="500" style="text-align: left;">
						<a href="resources/b_01.htm" target="main">
						<span style="color: rgb(255, 255, 255);" onmouseover="this.style.color='#FFFFFF'" onmouseout="this.style.color='#997000'">| 찾아오는길 </span>
						</a>
                        <a href="resources/b_02.htm" target="main">
						<span style="color: rgb(255, 255, 255);" onmouseover="this.style.color='#FFFFFF'" onmouseout="this.style.color='#997000'">| 대중교통이용 </span>
						</a>
                        <a href="resources/b_03.htm" target="main">
						<span style="color: rgb(255, 255, 255);" onmouseover="this.style.color='#FFFFFF'" onmouseout="this.style.color='#997000'">| 자가용이용 |</span>
						</a>
                    </td>           
				</tr>
            </tbody></table>
 

            <table width="600" height="30" id="menu2" style="display: none;" border="0" cellspacing="0" cellpadding="0">
                <tbody><tr>
				    <td width="200"></td>
					<td width="400" style="text-align: left;">
						<a href="resources/c_01.htm" target="main">
						<span style="color: rgb(255, 255, 255);" onmouseover="this.style.color='#FFFFFF'" onmouseout="this.style.color='#997000'">| 다이닝 </span>
						</a>
                        <a href="resources/c_02.htm" target="main">
						<span style="color: rgb(255, 255, 255);" onmouseover="this.style.color='#FFFFFF'" onmouseout="this.style.color='#997000'">| 오아시스 </span>
						</a>
                        <a href="resources/c_03.htm" target="main">
						<span style="color: rgb(255, 255, 255);" onmouseover="this.style.color='#FFFFFF'" onmouseout="this.style.color='#997000'">| 연회장 |</span>
						</a>
                    </td>           
				</tr>
            </tbody></table>
 
            <table width="600" height="30" id="menu3" border="0" cellspacing="0" cellpadding="0">
                <tbody><tr>
				    <td width="300"></td>
					<td width="300" style="text-align: left;">
						<a href="resources/d_01.jsp" target="main">
						<span style="color: rgb(255, 255, 255);" onmouseover="this.style.color='#FFFFFF'" onmouseout="this.style.color='#997000'">| 예약상황 </span>
						</a>
                        <a href="resources/d_02.jsp" target="main">
						<span style="color: rgb(255, 255, 255);" onmouseover="this.style.color='#FFFFFF'" onmouseout="this.style.color='#997000'">| 예약하기 | </span>
						</a>
                    </td>           
                </tr>
            </tbody></table>

            <table width="600" height="30" id="menu4" style="display: none;" border="0" cellspacing="0" cellpadding="0">
                <tbody><tr>
				    <td width="350"></td>
					<td width="250" style="text-align: left;">
						<a href="resources/ss/list.jsp" target="main">
						<span style="color: rgb(255, 255, 255);" onmouseover="this.style.color='#FFFFFF'" onmouseout="this.style.color='#997000'">| 팬션소식  </span>
						</a>
						<a href="resources/ss2/list.jsp" target="main">
						<span style="color: rgb(255, 255, 255);" onmouseover="this.style.color='#FFFFFF'" onmouseout="this.style.color='#997000'">| 이용후기 | </span>
						</a>
                    </td>           
                </tr>
            </tbody></table>


        </td>
    </tr>
</tbody></table>
<td>
</tr></tbody></table>
</center>

</body>
</html>
