<!--
/////////////////////////////////////////
//Title   : 예약하기
//Date    : 2016.7.26
//Author  : 고항석
//comment : 실습규칙2
//
///////////////////////////////////////////
-->

<html>
	<head></head>
	
	<body>
	<center>
		<form method='post' action='d_02ok.jsp' >
			<table width="600" border="1" cellspacing="1">
				<tbody>
					<tr>
						<td width="100">
						<p align="center">성명</p>
						</td>
						<td width="500">
							<input name="name" type="text" size="20" value="" />
						</td>
						</tr>
						<tr>
							<td width="100">
								<p align="center">예약일자</p>
							</td>
							<td width="500">
								<input name="date" type="text" size="20" value="201608" />
							</td>	
						</tr>
						<tr>
							<td width="100">
								<p align="center">예약방</p>
							</td>
							<td width="500">
								<select name="roomtype">
									<option value="토끼방_">토끼방</option>
									<option value="사슴방_">사슴방</option>
									<option value="곰방_">곰방</option>
								</select>
							</td>
						</tr>		
						<tr>
							<td width="100">
								<p align="center">주소</p>
							</td>
							<td width="500">
								<input name="addr" type="text" size="65" value="주소까지 쓰라굽쇼?" />
							</td>
						</tr>
						<tr>
							<td width="100">
								<p align"center">전화번호</p>
							</td>
							<td width="500">
								<input name="tel" type="text" size="20" value="" />
							</td>
						</tr>	
						<tr>
							<td width="100">
								<p align="center">입금자명</p>
							</td>
							<td width="500">	
							<input name="accname" type="text" size="20" value="" />
							</td>
						</tr>
						<tr>
							<td width="100">
								<p align="center">남기실말</p>
							</td>
							<td width="500">	
							<input name="comment" type="text" size="65" value="" />
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<p align="center">
									<input type="submit" value"전송" />
								</p>
							</td>
						</tr>	
					</tbody>	
				</table>
			</form>	
		</center>
	</body>
</html>	