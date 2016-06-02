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
      int subject = 0;
      int house = 0;
      int advisor = 0;
      String un = ""; 
      try {

         java.sql.Connection con = null;
         String url = "jdbc:mysql://127.0.0.1/egoldman";

	 String username = request.getParameter("name");
	 String password = request.getParameter("password");
	 //String StrUser = session.getAttribute("SesKey");
	 int user_id = Integer.parseInt((String)session.getAttribute("SesKey"));

		//out.println("debug: " + username);

//SELECT COUNT(*) FROM follower_t
//WHERE user_id = 2;
	// String query = "select COUNT(*) from egoldman.follower_t where user_id = " + user_id;
	String query = "select subject, house, advisor from egoldman.Dalton_User_T where user_id = " + user_id;
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
	
	// out.println("hello");

	 //loop through result set until there is no more data
          while(rs.next())
	  {
	 	out.println(followers);
		subject = rs.getInt(1);//followers_from_table?
		house = rs.getInt(2);
		advisor = rs.getInt(3);
		
		
	  } //end while
	 query = "select username from egoldman.user_t where user_id = " + user_id;
	 rs = stmt.executeQuery(query);
	  while(rs.next())
	  {
	 	out.println(followers);
		un = rs.getString("username");//followers_from_table?
		session.setAttribute("SesUn", un);
	  } //end while
	  query = "select COUNT(*) from egoldman.follower_t where follower_id = " + user_id;
	  rs = stmt.executeQuery(query);
	         while(rs.next())
	  {
	 	out.println(followers);
 		following = rs.getInt(1); //followers_from_table?
 	  }
 	  query = "select COUNT(*) from egoldman.tweet_t where user_id = " + user_id;
 	  rs = stmt.executeQuery(query);
 	     while(rs.next())
	  {
	 	out.println(followers);
		tweets = rs.getInt(1);//tweets_from_table?
		
	  }
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
						<li class="active"><a href="index.html">Home</a></li>
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
            <div class="span4" id="secondary">
                <div class="module mini-profile">
                    <div class="content">
                        <div class="account-group">
                            <a href="#">
                                <img class="avatar size32" src="images/pirate_normal.jpg" alt="Gordy">
                                <b class="fullname"><%=un%></b>
                                <small class="metadata">View my profile page</small>
                            </a>
                        </div>
                    </div>
                    <div class="js-mini-profile-stats-container">
                        <ul class="stats">
                            <li><a href="#"><strong><%=tweets%></strong>Tweets</a></li>
                            <li><a href="following.jsp"><strong><%=following-2%></strong>Following</a></li>
                            <li><a href="#"><strong><%=followers-1%></strong>Followers</a></li>
                        </ul>
                    </div>
                     <form action="insertTweet.jsp" class="tweet" method="get">
                        <textarea class="tweet-box" tabindex="0" placeholder="Compose new Tweet..." id="tweet-box-mini-home-profile" name="tweet_text" maxlength="140"></textarea>
                        <input type="hidden" name="user_id" value=<%=session.getAttribute("SesKey")%> >
                        <td class="flex-table-secondary"><br><br>
                                        <button type="submit" class="submit btn btn-primary flex-table-btn">Tweet</button>
                                </td>
                    </form>

                </div>
				


	
                <div class="module other-side-content">
                    <div class="content"
                        <p>Some other content here</p>
                    </div>
                </div>
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
	 String password = request.getParameter("password");
	 int user_id = Integer.parseInt(request.getParameter("key"));

		//out.println("debug: " + username);

//SELECT COUNT(*) FROM follower_t
//WHERE user_id = 2;
if (advisor == 0)
{
	 String query = "SELECT user_id, class, subject, house FROM Dalton_Requests_T WHERE user_id = " + user_id;
	 

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
	  	out.println("hello");
	 // 	fn = rs.getString("name");
	 	//Timestamp time = rs.getTimestamp("tweet_time_stamp");
	  	//tweet = rs.getString("tweet");
	  
	  	int userid = rs.getInt("user_id");
	  	 String query1 = "SELECT email FROM Dalton_User_T WHERE user_id =" + userid;
	  	  java.sql.ResultSet rs1 = stmt1.executeQuery(query1);
	   	 while(rs1.next())
  	 {
  	 	
  	 	 %>
	
	         <!-- start tweet -->
                        <div class="js-stream-item stream-item expanding-string-item">
                            <div class="tweet original-tweet">
                           



                                <div class="content">
                                    <div class="stream-item-header">
                                        <a class="account-group">
                                            <img class="avatar" src="images/obama.png" alt="Barak Obama">
                                            <span>&rlm;</span>
                                            <span class="username">
                                                <s></s>
                                                <b><%=rs1.getString("email")%></b>
                                                 <b><%=rs.getString("class")%></b>
                                            </span>
                                        </a>
                                    </div>
                                    <p class="js-tweet-text">
                                       <form action="demo_form.asp" method="get">
 <input type="hidden" name="advisor" value="0"> advisor<br>
 <input type="checkbox" disabled readonly>
</form>
    <form action="demo_form.asp" method="get">
  <input type="hidden" name="chair" value="0"> chair<br>
  <input type="checkbox" disabled readonly>
 
</form>
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
  	 	
  	 
  	 
	  	
	  %>
	
	    
		<%
		
	  } //end while
	  }
}
else if (advisor != 0)
{
	 String query = "SELECT user_id, class, subject, house FROM Dalton_Requests_T WHERE subject = " + subject + " OR house = " + house;
	 

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
	 	//Timestamp time = rs.getTimestamp("tweet_time_stamp");
	  	//tweet = rs.getString("tweet");
	  
	  	int userid = rs.getInt("user_id");
	  	 String query1 = "SELECT email FROM Dalton_User_T WHERE user_id =" + userid;
	  	  java.sql.ResultSet rs1 = stmt1.executeQuery(query1);
	   	 while(rs1.next())
  	 {
  	 	if (rs.getInt("subject") == subject && rs.getInt("house") == house)
  	 	{
  	 	 %>
	
	         <!-- start tweet -->
                        <div class="js-stream-item stream-item expanding-string-item">
                            <div class="tweet original-tweet">
                           



                                <div class="content">
                                    <div class="stream-item-header">
                                        <a class="account-group">
                                            <img class="avatar" src="images/obama.png" alt="Barak Obama">
                                            <span>&rlm;</span>
                                            <span class="username">
                                                <s></s>
                                                <b><%=rs1.getString("email")%></b>
                                                 <b><%=rs.getString("class")%></b>
                                            </span>
                                        </a>
                                    </div>
                                    <p class="js-tweet-text">
                                       <form action="demo_form.asp" method="get">
  <input type="checkbox" name="advisor" value="Bike"> advisor<br>

</form>
    <form action="demo_form.asp" method="get">
  <input type="checkbox" name="char" value="Bike"> chair<br>
  <input type="submit" value="Submit">
</form>
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
  	 	}
  	 	else if (rs.getInt("subject") == subject)
  	 	{
  	 	 %>
	
	         <!-- start tweet -->
                        <div class="js-stream-item stream-item expanding-string-item">
                            <div class="tweet original-tweet">
                           



                                <div class="content">
                                    <div class="stream-item-header">
                                        <a class="account-group">
                                            <img class="avatar" src="images/obama.png" alt="Barak Obama">
                                            <span>&rlm;</span>
                                            <span class="username">
                                                <s>@</s>
                                                <b><%=rs1.getString("email")%></b>
                                            </span>
                                        </a>
                                    </div>
                                    <p class="js-tweet-text">
    <form action="demo_form.asp" method="get">
  <input type="checkbox" name="char" value="Bike"> chair<br>
  <input type="submit" value="Submit">
</form>
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
  	 	}
  	 	else 
  	 	{
  	 	 %>
	
	         <!-- start tweet -->
                        <div class="js-stream-item stream-item expanding-string-item">
                            <div class="tweet original-tweet">
                           



                                <div class="content">
                                    <div class="stream-item-header">
                                        <a class="account-group">
                                            <img class="avatar" src="images/obama.png" alt="Barak Obama">
                                            <span>&rlm;</span>
                                            <span class="username">
                                                <s>@</s>
                                                <b><%=rs1.getString("email")%></b>
                                            </span>
                                        </a>
                                    </div>
                                    <p class="js-tweet-text">
                                       <form action="demo_form.asp" method="get">
  <input type="checkbox" name="advisor" value="Bike"> advisor<br>
  <input type="submit" value="Submit">
</form>
  
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
  	 	}
	  	
	  %>
	
	    
		<%
		
	  } //end while
	  }
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