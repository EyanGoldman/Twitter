<!doctype html>
<html lang="en">
<%@ page language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.*" %>

<%
      int followers = 0;
      int following = 0;  
      int tweets = 0;
      String un = ""; 
     // int hashtag = Integer.parseInt(request.getParameter("hash_id"));
    int user_id = Integer.parseInt((String)session.getAttribute("SesKey"));
      
      

      //out.println(hashtag);
      try {
	
         java.sql.Connection con = null;
         String url = "jdbc:mysql://127.0.0.1/egoldman";

	// String username = request.getParameter("name");
	 //String password = request.getParameter("password");
	// int user_id = Integer.parseInt(request.getParameter("key"));
	
	//out.println(hashtag_id);

		//out.println("debug: " + username);

//SELECT COUNT(*) FROM follower_t
//WHERE user_id = 2;
	// String query = "select COUNT(*) from egoldman.follower_t where user_id = " + user_id;
	// query.setString (1,username);
	 //query.setString (2,password);
	 //open sql:
         Class.forName("com.mysql.jdbc.Driver").newInstance();
         url = "jdbc:mysql://localhost:3306/egoldman";
         con = DriverManager.getConnection(url, "egoldman", "Opensesme1");
         java.sql.Statement stmt = con.createStatement();
         out.println("hello1");

         
	 //executes the query:
	// java.sql.PreparedStatement ps = con.prepareStatement("select * from egoldman.user_t where email = ? and password = ?");

	 
	
//	 status = ps.executeUpdate(); 
	// java.sql.ResultSet rs =conn.prepareStatement("select * from egoldman.user_t where username = '" + username + "' and password = '" + password + "'";
	// java.sql.ResultSet rs = stmt.executeQuery(query);
	
	// out.println("hello");

	 //loop through result set until there is no more data
     //      while(rs.next())
// 	  {
// 	 	out.println(followers);
// 		followers = rs.getInt(1);//followers_from_table?
// 		
// 	  } //end while
// 	 query = "select username from egoldman.user_t where user_id = " + user_id;
// 	 rs = stmt.executeQuery(query);
// 	  while(rs.next())
// 	  {
// 	 	out.println(followers);
// 		un = rs.getString("username");//followers_from_table?
// 	  } //end while
// 	  query = "select COUNT(*) from egoldman.follower_t where follower_id = " + user_id;
// 	  rs = stmt.executeQuery(query);
// 	         while(rs.next())
// 	  {
// 	 	out.println(followers);
//  		following = rs.getInt(1); //followers_from_table?
//  	  }
//  	  query = "select COUNT(*) from egoldman.tweet_t where user_id = " + user_id;
//  	  rs = stmt.executeQuery(query);
//  	     while(rs.next())
// 	  {
// 	 	out.println(followers);
// 		tweets = rs.getInt(1);//tweets_from_table?
// 		
// 	  }
      } catch (Exception e) {
         out.println(e);
      }
%>
// <%
// String un = ""; 
//       try {
// 
//          java.sql.Connection con = null;
//          String url = "jdbc:mysql://127.0.0.1/egoldman";
// 
// 	 String username = request.getParameter("name");
// 	 String password = request.getParameter("password");
// 	 int user_id = Integer.parseInt(request.getParameter("key"));
// 
// 		//out.println("debug: " + username);
// 
// //SELECT COUNT(*) FROM follower_t
// //WHERE user_id = 2;
// 	 String query = "select username from egoldman.user_t where user_id = " + user_id;
// 	// query.setString (1,username);
// 	 //query.setString (2,password);
// 	 //open sql:
//          Class.forName("com.mysql.jdbc.Driver").newInstance();
//          url = "jdbc:mysql://localhost:3306/egoldman";
//          con = DriverManager.getConnection(url, "egoldman", "Opensesme1");
//          java.sql.Statement stmt = con.createStatement();
//          
// 	 //executes the query:
// 	// java.sql.PreparedStatement ps = con.prepareStatement("select * from egoldman.user_t where email = ? and password = ?");
// 
// 	 
// 	
// //	 status = ps.executeUpdate(); 
// 	// java.sql.ResultSet rs =conn.prepareStatement("select * from egoldman.user_t where username = '" + username + "' and password = '" + password + "'";
// 	 java.sql.ResultSet rs = stmt.executeQuery(query);
// 	
// 	// out.println("hello");
// 
// 	 //loop through result set until there is no more data
//           while(rs.next())
// 	  {
// 	 	out.println(followers);
// 		un = rs.getString("username");//followers_from_table?
// 		
// 	  } //end while
// 	 
//       } catch (Exception e) {
//          out.println(e);
//       }
// %>
// <%
//       int following = 0; 
//       try {
// 
//          java.sql.Connection con = null;
//          String url = "jdbc:mysql://127.0.0.1/egoldman";
// 
// 	 String username = request.getParameter("name");
// 	 String password = request.getParameter("password");
// 	 int user_id = Integer.parseInt(request.getParameter("key"));
// 
// 		//out.println("debug: " + username);
// 
// //SELECT COUNT(*) FROM follower_t
// //WHERE user_id = 2;
// //SELECT COUNT(*) FROM follower_t
// //WHERE follower_id = 2;
// 
// 	 String query = "select COUNT(*) from egoldman.follower_t where follower_id = " + user_id;
// 	// query.setString (1,username);
// 	 //query.setString (2,password);
// 	 //open sql:
//          Class.forName("com.mysql.jdbc.Driver").newInstance();
//          url = "jdbc:mysql://localhost:3306/egoldman";
//          con = DriverManager.getConnection(url, "egoldman", "Opensesme1");
//          java.sql.Statement stmt = con.createStatement();
//          
// 	 //executes the query:
// 	// java.sql.PreparedStatement ps = con.prepareStatement("select * from egoldman.user_t where email = ? and password = ?");
// 
// 	 
// 	
// //	 status = ps.executeUpdate(); 
// 	// java.sql.ResultSet rs =conn.prepareStatement("select * from egoldman.user_t where username = '" + username + "' and password = '" + password + "'";
// 	 java.sql.ResultSet rs = stmt.executeQuery(query);
// 	
// 	// out.println("hello");
// 
// 	 //loop through result set until there is no more data
//           while(rs.next())
// 	  {
// 	 	out.println(followers);
// 		following = rs.getInt(1);//followers_from_table?
// 		
// 	  } //end while
// 	 
//       } catch (Exception e) {
//          out.println(e);
//       }
// %>
// <%
//       int tweets = 0; 
//       try {
// 
//          java.sql.Connection con = null;
//          String url = "jdbc:mysql://127.0.0.1/egoldman";
// 
// 	 String username = request.getParameter("name");
// 	 String password = request.getParameter("password");
// 	 int user_id = Integer.parseInt(request.getParameter("key"));
// 
// 		//out.println("debug: " + username);
// 
// 
// //SELECT COUNT(*) FROM tweet_t
// //WHERE tweet_t.user_id = 1;
// 	 String query = "select COUNT(*) from egoldman.tweet_t where user_id = " + user_id;
// 	// query.setString (1,username);
// 	 //query.setString (2,password);
// 	 //open sql:
//          Class.forName("com.mysql.jdbc.Driver").newInstance();
//          url = "jdbc:mysql://localhost:3306/egoldman";
//          con = DriverManager.getConnection(url, "egoldman", "Opensesme1");
//          java.sql.Statement stmt = con.createStatement();
//          
// 	 //executes the query:
// 	// java.sql.PreparedStatement ps = con.prepareStatement("select * from egoldman.user_t where email = ? and password = ?");
// 
// 	 
// 	
// //	 status = ps.executeUpdate(); 
// 	// java.sql.ResultSet rs =conn.prepareStatement("select * from egoldman.user_t where username = '" + username + "' and password = '" + password + "'";
// 	 java.sql.ResultSet rs = stmt.executeQuery(query);
// 	
// 	// out.println("hello");
// 
// 	 //loop through result set until there is no more data
//           while(rs.next())
// 	  {
// 	 	out.println(followers);
// 		tweets = rs.getInt(1);//tweets_from_table?
// 		
// 	  } //end while
// 	 
//       } catch (Exception e) {
//          out.println(e);
//       }
// %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <meta name="description" content="">
    <meta name="author" content="">
    <style type="text/css">
    	body {
    		padding-top: 60px;
    		padding-bottom: 40px;
    	}
    	.sidebar-nav {
    		padding: 9px 0;
    	}
    </style>    
    <link rel="stylesheet" href="css/gordy_bootstrap.min.css">
</head>
<body class="user-style-theme1">
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
                <i class="nav-home"></i> <a href="#" class="brand">!Twitter</a>
				<div class="nav-collapse collapse">
					<p class="navbar-text pull-right">Logged in as <a href="#" class="navbar-link"><%=un%></a>
					</p>
					<ul class="nav">
						<li class="active"><a href=<%="twitter-home.jsp?key="+user_id%>>Home</a></li>
						<li><a href="queries.html">Test Queries</a></li>
						<li><a href="twitter-signin.html">Main sign-in</a></li>
					</ul>
				</div><!--/ .nav-collapse -->
			</div>
		</div>
	</div>

    <div class="container wrap">
        <div class="row">

            <!-- left column -->
            <p>
            <div class="span4" id="secondary">

				


	
                
            </div>

            <!-- right column -->
            
            <div class="span8 content-main">
                <div class="module">
                    <div class="content-header">
                        <div class="header-inner">
                            <h2 class="js-timeline-title">Tweets</h2>
                        </div>
                    </div>

                    <!-- new tweets alert -->
                    <div class="stream-item hidden">
                        <div class="new-tweets-bar js-new-tweets-bar well">
                            2 new Tweets
                        </div>
                    </div>

                    <!-- all tweets -->
                    <div class="stream home-stream">
					<%

      String usern = ""; 
      String tweet = "";
      String fn = "";
      try {

         java.sql.Connection con = null;
         String url = "jdbc:mysql://127.0.0.1/egoldman";

	 //String username = request.getParameter("name");
	



		//out.println("debug: " + username);

//SELECT COUNT(*) FROM follower_t
//WHERE user_id = 2;


	 String query = "SELECT follower_id FROM follower_t WHERE (user_id = " + user_id + " AND ( follower_id <> " + user_id + " ) )";
	

	// String query = "select COUNT(*) from egoldman.follower_t where user_id = " + user_id;
	// query.setString (1,username);
	 //query.setString (2,password);
	 //open sql:
         Class.forName("com.mysql.jdbc.Driver").newInstance();
         url = "jdbc:mysql://localhost:3306/egoldman";
         con = DriverManager.getConnection(url, "egoldman", "Opensesme1");
         java.sql.Statement stmt = con.createStatement();
         java.sql.Statement stmt1 = con.createStatement();
         
	 //executes the query:
	// java.sql.PreparedStatement ps = con.prepareStatement("select * from egoldman.user_t where email = ? and password = ?");

	 
	
//	 status = ps.executeUpdate(); 
	// java.sql.ResultSet rs =conn.prepareStatement("select * from egoldman.user_t where username = '" + username + "' and password = '" + password + "'";
	 java.sql.ResultSet rs = stmt.executeQuery(query);
	
	// out.println("hello");

	 //loop through result set until there is no more data
          while(rs.next())
	  {
	 // 	fn = rs.getString("name");
	 //	Timestamp time = rs.getTimestamp("tweet_time_stamp");
	  //	tweet = rs.getString("tweet");
	  	int userid = rs.getInt("follower_id");
	  	 String query1 = "SELECT username, name FROM user_t WHERE user_id =" + userid;
	
	  	  java.sql.ResultSet rs1 = stmt1.executeQuery(query1);
	  	 while(rs1.next())
	  	 {
	  	 	//int hashtagid = 0;
	  	 	//String tweetredo = "";
		usern = rs1.getString("username");
		String usersname = rs1.getString("name");
	//  	String[] arr = tweet.split(" ");
	//	for(int i = 0; i<arr.length; i++)
		// {
// 		if (arr[i].contains("#"))
// 		{
// 			String query2 = "select hashtag_id from egoldman.hashtag_t where hashtag_content = '" + arr[i] + "'";
// 		
// 			java.sql.Statement stmt3 = con.createStatement();
// 			java.sql.ResultSet rs2 = stmt3.executeQuery(query2);
// 			while(rs2.next())
// 			{
// 				hashtagid = rs2.getInt("hashtag_id");
// 			}
// 			arr[i] = "<body>\n<a href='hash_list.jsp?hash_id=" + hashtagid + "'>" + arr[i]+"</a>\n</body>";
// 		}
// 		}
		// for(int i = 0; i<arr.length; i++)
// 		{
// 			
// 			tweetredo = tweetredo + arr[i]+" ";
// 			
// 		}
// 	  		tweetredo = tweetredo.trim();
	  	
	  %>
	
	         <!-- start tweet -->
                        <div class="js-stream-item stream-item expanding-string-item">
                            <div class="tweet original-tweet">
                                <div class="content">
                                    <div class="stream-item-header">
                                        <small class="time">
                                            <a href="#" class="tweet-timestamp" title="10:15am - 16 Nov 12">
                                                <span class="_timestamp"><%%></span>
                                            </a>
                                        </small>
                                        <a class="account-group">
                                            <img class="avatar" src="images/obama.png" alt="Barak Obama">
                                            <strong class="fullname"><%=rs1.getString("name")%></strong>
                                            <span>&rlm;</span>
                                            <span class="username">
                                                <s>@</s>
                                                <b><%=rs1.getString("username")%></b>
                                            </span>
                                        </a>
                                    </div>
                                    <p class="js-tweet-text">
                                        "<%%>"
                                            <span class="invisible"></span>
                                            <span class="tco-ellipsis">
                                                <span class="invisible">&nbsp;</span>
                                            </span>
                                        </a>
                                    </p>
                                </div>
                            </a>
                                <div class="expanded-content js-tweet-details-dropdown"></div>
                            </div>
                        </div>
	
		<%
	  } //end while
	 }
      } catch (Exception e) {
         out.println(e);
      }
%>

                        <!-- start tweet -->
               
                    </div>
                    <div class="stream-footer"></div>
                    <div class="hidden-replies-container"></div>
                    <div class="stream-autoplay-marker"></div>
                </div>
                </div>
               
            </div>
        </div>
    </div>
     <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
     <script type="text/javascript" src="js/main-ck.js"></script>
  </body>
</html>