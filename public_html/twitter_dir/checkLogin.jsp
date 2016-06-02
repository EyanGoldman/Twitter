<%@page language="java" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@page import="com.mysql.jdbc.*" %>

<%
     
      try {

         java.sql.Connection con = null;
         String url = "jdbc:mysql://127.0.0.1/egoldman";

	 String username = request.getParameter("name");
	 String password = request.getParameter("password");

		out.println("debug: " + username);


	 String query = "select * from egoldman.user_t where ( email = '" + username + "' or username = '"+ username +"' ) and password = '" + password + "'"  ;
	// query.setString (1,username);
	 //query.setString (2,password);
	 //open sql:
         Class.forName("com.mysql.jdbc.Driver").newInstance();
         url = "jdbc:mysql://localhost:3306/egoldman";
         con = DriverManager.getConnection(url, "egoldman", "Opensesme1");
         java.sql.Statement stmt = con.createStatement();
         
	 //executes the query:
	// java.sql.PreparedStatement ps = con.prepareStatement("select * from egoldman.user_t where email = ? and password = ?");

	 
	
//	 status = ps.executeUpdate(); 
	// java.sql.ResultSet rs =conn.prepareStatement("select * from egoldman.user_t where username = '" + username + "' and password = '" + password + "'";
	 java.sql.ResultSet rs = stmt.executeQuery(query);
	 int p_key = 0; 
	 out.println("hello");

	 //loop through result set until there is no more data
          while(rs.next())
	  {
	 	
		p_key = rs.getInt("user_id");//p_key_from_table?
		session.setAttribute("SesKey",Integer.toString(p_key));
		
		out.println(p_key);
		
	  } //end while
	  if(p_key != 0)
		response.sendRedirect("twitter-home.jsp?key="+p_key);
	//fail
	else
		response.sendRedirect("Login.jsp?msg=fail");
		out.println("FAIL");
				//fail and go back to login page	
		
      } catch (Exception e) {
         out.println(e);
      }
%>


