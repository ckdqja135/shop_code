<%@ page contentType="text/html; charset=EUC-KR" %> 
<% request.setCharacterEncoding("euc-kr"); %>
<%
try {
session=request.getSession();
 String id = request.getParameter("id"); 
 int qty = Integer.parseInt(request.getParameter("quantity"));
 int stock = Integer.parseInt(request.getParameter("stock"));
 if( stock < qty){
	 out.print("갯수 초과");
 }
 else{
	 String[] a = session.getValueNames();
	 
	 for (int i=0; i < a.length; i++) {
	  if (id.equals(a[i])) {
	   int old=((Integer)session.getValue(id)).intValue();
	   qty = qty+old;
	  }
	 }
	 
	 session.putValue(id, new Integer(qty));   
	 out.println("바구니에 넣었습니다.");
 }
 String ca="";
 String pn="";

 if (request.getParameter("cat") != null) 
  if( !(request.getParameter("cat").equals("")) )
   ca=request.getParameter("cat");

 if (request.getParameter("pname") != null) 
  if ( !(request.getParameter("pname").equals("")) ) 
   pn=request.getParameter("pname");
 
 out.print("[<A href=\"shop_list.jsp?go="+ request.getParameter("go"));
 out.print("&cat="+ ca +"&pname="+pn+"\">계속 쇼핑하기</A>]");
 out.print("[<A href=\"sale_list.jsp?go="+ request.getParameter("go"));
 out.print("&cat="+ ca +"&pname="+pn+"\">장바구니 보기</A>]");
 
} catch (Exception e) {
 out.println(e);
} 
%>