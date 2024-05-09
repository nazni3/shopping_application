<%@page import="com.jsp.shoppingcart.dto.Item"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>BILL</h1>
    <%
	List<Item> items = (List<Item>) request.getAttribute("itemslist");
	//double totalprice = (Double) request.getAttribute("totalprice");
	%>

	<table cellPadding="20px" border="1">
		<th>Brand</th>
		<th>Model</th>
		<th>Category</th>
		<th>Price</th>
		<th>Quantity</th>

		<%
		for (Item i : items) {
		%>
		<tr>
			<td><%=i.getBrand()%></td>
			<td><%=i.getModel()%></td>
			<td><%=i.getCategory()%></td>
			<td><%=i.getPrice()%></td>
			<td><%=i.getQuantity()%></td>
		</tr>
		<%
		}
		%>

	</table>
	<h2>TotalPrice :<%=//totalprice%> </h2>
	<br>
</body>
</html>