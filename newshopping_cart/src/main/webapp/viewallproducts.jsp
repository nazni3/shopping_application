<%@page import="com.jsp.shoppingcart.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.jsp.shoppingcart.dto.Merchant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	Merchant merchant = (Merchant) session.getAttribute("merchantinfo");
	List<Product> products = merchant.getProducts();
	%>
	<table cellPadding="20px" border="1">
		<th>id</th>
		<th>brand</th>
		<th>model</th>
		<th>category</th>
		<th>price</th>
		<th>stock</th>
        <th>update</th>
        <th>delete</th>
		<%
		for (Product p : products) {
		%>
		<tr>
            <td> <%= p.getId() %> </td>
            <td> <%= p.getBrand() %> </td>
            <td> <%= p.getModel() %> </td>
            <td> <%= p.getCategory() %> </td>
            <td> <%= p.getPrice() %> </td>
            <td> <%= p.getStock() %> </td>
            <td>  <a href="updateproduct?id=<%=p.getId()%>">update</a> </td>
            <td>  <a href="deleteproduct?id=<%=p.getId()%>">delete</a> </td>
		</tr>
		<%
		}
		%>
	</table>

</body>
</html>