<%@ page language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.*" %>

<%

	String name = request.getParameter("name"); //suck in html ; store in java var
	String email = request.getParameter("email"); //suck in html ; store in java var
	String pass = request.getParameter("password"); //suck in html ; store in java var
	int status = 0;  //capture status after insertion attempt

	//out.println("p1 is: " + p1);

	//connect to db
	java.sql.Connection conn = null;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        String url = "jdbc:mysql://127.0.0.1/egoldman";   //location and name of database
        String userid = "egoldman";
        String password = "Opensesme1";
        conn = DriverManager.getConnection(url, userid, password);      //connect to database
        // if it already exists (need)
	String query = "select user_id from egoldman.Dalton_User_T where email = '" + email +"'";
	java.sql.Statement stmt = conn.createStatement();
	java.sql.ResultSet rs2 = stmt.executeQuery(query);
	
	

	if(rs2.next())
	{
		status = 0;
	}
	else{
	java.sql.PreparedStatement ps = conn.prepareStatement("insert into egoldman.Dalton_User_T (email,password) values(?,?)");
	
	ps.setString (1,email);
	ps.setString (2,pass);
    status = ps.executeUpdate(); 
    }
	//success
	if(status > 0)
	{
		java.sql.Statement stmt1 = conn.createStatement();
		java.sql.ResultSet rs3 = stmt1.executeQuery("select user_id from Dalton_User_T where email = '" + email + "'");
		int p_key = 0;
		while(rs3.next())
		{
		p_key = rs3.getInt("user_id");
		//java.sql.PreparedStatement ps = conn.prepareStatement("insert into egoldman.follower_t (user_id,follower_id) values(?,?)");
  	//	ps.setInt (1,p_key);
	//	ps.setInt (2,p_key);
	//	status = ps.executeUpdate(); 
	//	ps = conn.prepareStatement("insert into egoldman.follower_t (user_id,follower_id) values(?,?)");
  	//	ps.setInt (1,1000);
	//	ps.setInt (2,p_key);
	//	status = ps.executeUpdate(); 
		session.setAttribute("SesKey",Integer.toString(p_key));
		
   		
		}
	//	response.sendRedirect("twitter-home.jsp?key=" + p_key);
	}
	//fail
	else
		response.sendRedirect("Dalton_Login.jsp?msg=fail");
		//fail and go back to login page	

%>

<input type="hidden" name="key" value="99">
<h1> its a beautiful day in the neighborhood! </h1>



