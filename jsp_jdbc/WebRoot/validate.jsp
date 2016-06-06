<%@ page language="java" pageEncoding="gb2312" import="java.sql.*"%>
<jsp:useBean id="SqlSrvDB" scope="page" class="org.easybooks.test.jdbc.SqlSrvDBConn"/>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=gb2312">
	</head>
	<body>
		<%
			request.setCharacterEncoding("gb2312");
			String usr=request.getParameter("username");
			String pwd=request.getParameter("password");
			boolean validated=false;
			String sql="select*from userTable";
			ResultSet rs=SqlSrvDB.executeQuery(sql);
			while(rs.next())
			{
				if((rs.getString("username").trim().compareTo(usr)==0)
						&&(rs.getString("password").compareTo(pwd)==0))
				{
					validated=true;
				}
			}
			rs.close();
			SqlSrvDB.closeStmt();
			SqlSrvDB.closeConn();
			if(validated)
			{
		 %>
		 		<jsp:forward page="main.jsp"/>
		 <%
			}
			else
			{
		 %>	
		 		<jsp:forward page="error.jsp"/>
		 <%
		 	}
		  %>	 		 
	</body>
</html>


