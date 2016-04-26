<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<link rel="stylesheet" type="text/css" href="resources/css/orderReceive.css">
<script type="text/javascript" src="resources/js/validateDistributorRequest.js"></script>
<title>Request Process Error</title>
	<script type="text/javascript">
		alert("WorkRequest is not available or Drug is not available or  or Request is already processed");
	</script>
</head>
<body>
	<div id="request">
		<table class="orderReceive">
		<tr> <td colspan="5">Welcome : ${user.getUserName()}</td> </tr>
		<tr> <td colspan="5">Received Orders</td> </tr>
		<tr>
			<th> Work Request ID </th>
			<th> Drug Name</th> 
			<th> Drug Quantity </th> 
			<th> From Dispenser </th> 
			<th> Request Status </th>
		</tr>  
		
		<c:set var="index" value="${1}"/>  
		<c:forEach var="request" items="${senderList}">
	
			<tr id="${drug.requestId}">
				<td><c:out value="${request.requestId}" />
				<td><c:out value="${request.drugName}" />
				<td><c:out value="${request.quantity}" />
				<td><c:out value="${request.enterpriseSender.enterpriseName}" />
				<td id="status${request.requestId}"><c:out value="${request.status}" />
			</tr>
			
			<input type="hidden" id="rowNo${index}" value="${request.requestId}">				
			<c:set var="index" value="${index+1}"/>
				
		</c:forEach>
	</table>
</div>
<div align="right">
	<form id="requestProcess" action="distributorProcess.htm" method="get">	
		<h5> Enter Work Request ID:<input type="number" min="1" max="100" name="distWorkID" value="1" id="workRequestID"/></h5>
		<input type="submit" id="button" onclick="return validateForm()" value="Process"/>
	</form>
</div>
</body>
</html>