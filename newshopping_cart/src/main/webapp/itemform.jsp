<%@page import="com.jsp.shoppingcart.dto.Product"%>
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
	Product p = (Product) request.getAttribute("prodobj");
	%>
	
	<form action="additemtocart">
	    <input type="hidden" name="id" value=<%= p.getId() %> readonly="true">       <br>
	    Brand : <input type="text" name="brand" value=<%= p.getBrand() %> readonly="true">   <br>
	    Model : <input type="text" name="model" value=<%=p.getModel() %> readonly="true">     <br>
	 Category : <input type="text" name="category" value=<%= p.getCategory() %> readonly=true>  <br>
	    Price : <input type="number" name="price" value=<%= p.getPrice() %> readonly=true>     <br>
	 Quantity : <input type="number" name="quantity"  >   <br>
	<input type="submit" value="Add To Cart">
	</form>
	
	

	
</body>
</html>