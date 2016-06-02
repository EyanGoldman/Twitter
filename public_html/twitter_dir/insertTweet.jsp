<%@ page language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.*" %>

<%

	 try {
	int user_id = Integer.parseInt((String)session.getAttribute("SesKey")); //suck in html ; store in java var
	String tweet = request.getParameter("tweet_text"); //suck in html ; store in java var
	int status = 0;  //capture status after insertion attempt
	int tweet_id = 0;
	int hashtag_id = 0;

	//out.println("p1 is: " + p1);

	//connect to db
	java.sql.Connection conn = null;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        String url = "jdbc:mysql://127.0.0.1/egoldman";   //location and name of database
        String userid = "egoldman";
        String password = "Opensesme1";
        conn = DriverManager.getConnection(url, userid, password);      //connect to database
        // if it already exists (need)
	java.sql.Statement stmt = conn.createStatement();
	
	java.sql.PreparedStatement ps = conn.prepareStatement("insert into egoldman.tweet_t (user_id,tweet,tweet_time_stamp) values(?,?,now())");
	ps.setInt (1,user_id);
	ps.setString (2,tweet);
    status = ps.executeUpdate(); 
    
    String query = "select tweet_id from egoldman.tweet_t where user_id =" + user_id + " AND tweet ='" + tweet + "'";

	java.sql.ResultSet rs2 = stmt.executeQuery(query);
	  while(rs2.next())
	  {
	 	tweet_id =rs2.getInt("tweet_id");
	  }
	String[] arr = tweet.split(" ");
	for(int i = 0; i<arr.length; i++)
	{
		if (arr[i].contains("#"))
		{
		query = "select hashtag_id from egoldman.hashtag_t where hashtag_content = '" + arr[i] + "'";
		stmt = conn.createStatement();
		rs2 = stmt.executeQuery(query);
		if(rs2.next())
			{
	 			hashtag_id =rs2.getInt("hashtag_id");
	 			ps = conn.prepareStatement("insert into egoldman.hashtag_relation (hashtag_id,tweet_id) values(?,?)");
				ps.setInt (1,hashtag_id);
				ps.setInt (2,tweet_id);
    			status = ps.executeUpdate(); 
	  		}	
			
			else
			{
				ps = conn.prepareStatement("insert into egoldman.hashtag_t (hashtag_content) values(?)");
				ps.setString (1, arr[i]);
				status = ps.executeUpdate(); 
				query = "select hashtag_id from egoldman.hashtag_t where hashtag_content = '" + arr[i] + "'";
				stmt = conn.createStatement();
				rs2 = stmt.executeQuery(query);
				while(rs2.next())
				{
				hashtag_id =rs2.getInt("hashtag_id");
				}
				java.sql.PreparedStatement ps1 = conn.prepareStatement("insert into egoldman.hashtag_relation (hashtag_id,tweet_id) values(?,?)");
				ps1.setInt (1,hashtag_id);
				ps1.setInt (2,tweet_id);
    			status = ps1.executeUpdate(); 
			}
			arr[i] = "dsafd";
		}
		
	}
	response.sendRedirect("twitter-home.jsp?key=" + user_id);
	 } catch (Exception e) {
         out.println(e);
      }
/*
	if(rs2.next())
	{
		status = 0;
	}
	else{
	java.sql.PreparedStatement ps = conn.prepareStatement("insert into egoldman.user_t (name,email,password) values(?,?,?)");

	ps.setString (1,name);
	ps.setString (2,email);
	ps.setString (3,pass);
    status = ps.executeUpdate(); 
    }
    */
	//success
// 	if(status > 0)
// 	{
// 		java.sql.Statement stmt1 = conn.createStatement();
// 		java.sql.ResultSet rs3 = stmt1.executeQuery("select user_id from user_t where email = '" + email + "'");
// 		int p_key = 0;
// 		while(rs3.next())
// 		{
// 		p_key = rs3.getInt("user_id");
// 		}
// 		response.sendRedirect("twitter-home.jsp?key=" + p_key);
// 	}
// 	//fail
// 	else
// 		response.sendRedirect("Login.jsp?msg=fail");
// 		//fail and go back to login page	

%>

<input type="hidden" name="key" value="99">