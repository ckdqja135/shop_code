<%@ page contentType="text/html; charset=EUC-KR" %> 
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %> 
<% request.setCharacterEncoding("euc-kr"); %>

<%

Connection con= null;
Statement st =null;
ResultSet rs =null;
ResultSet rs2 =null;

try {
 Class.forName("org.gjt.mm.mysql.Driver");
} catch (ClassNotFoundException e ) {
 out.println(e);
}

try{
 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop?useUnicode=true&characterEncoding=euckr","root","1234");
} catch (SQLException e) {
 out.println(e);
}

%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게임 쇼핑몰</title>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<body>

<center>
<A href="main.jsp"><img border = 0 src = "main.PNG"></a>
<hr>
<A href="product_write.htm"><img border = 0 src = "button/itemsubmit.png"></a>
<A href="shop_list.jsp"><img border = 0 src = "button/buy.png"></a>
<A href="product_list.jsp"><img border = 0 src = "button/allitemview.png"></a>
<A href="order_list.jsp"><img border = 0 src = "button/orderlist.png"></a>
<hr>
<b>랜덤 추천 게임</b>

<%  
	st = con.createStatement();
	String sql = "select gameID from sell order by rand()";
	rs = st.executeQuery(sql);
	long id;
	
	String url = "C:/upload/";
	String url2 = null;
	Vector gameID=new Vector(); 
	Vector small=new Vector(); 
	
	 if (!(rs.next()))  
		   out.println("등록된 상품이 없습니다");
	 else {
		 gameID.addElement(new Long(rs.getLong("gameID")));
		 id = (long)gameID.elementAt(0);
		 sql = "select small from product where ";
		 sql = sql + "id="+id;
		 rs = st.executeQuery(sql);
		 
		url2 = "http://localhost:8088/JSPWork/shop/product_read.jsp?id=";
		url2 = url2 + id + "&go=1&cat=&pname=";
	 } 
		 
	if (!(rs.next()))  
		   out.println("등록된 상품이 없습니다");
	 else {
		 small.addElement(new String(rs.getString("small")));
		 String sid=(String)small.elementAt(0);	
		 url = url + sid;
	 } 


	  
	  out.print("<A href="+url2+"><br><img border = 0 src ="+url+" </a>");
	
%>
</center>
</body>
</html>