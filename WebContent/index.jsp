<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- <%@ page import="java.util.*" %>
<%@ page import="javax.sql.*;" %> --%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<style type="text/css">
		  <%@include file="css/style.css" %>
		</style>
		<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script> 
		<script type="text/javascript">
			$(document).ready(function(){
			   mainFunction();
			});
			function mainFunction(){
								
				<%@ page import="java.util.*" %>
				<%@ page import="javax.sql.*;" %>
				<% 
				
				java.sql.Connection con;
				java.sql.Statement s;
				java.sql.ResultSet rs;
				java.sql.PreparedStatement pst;
				
				con=null;
				s=null;
				pst=null;
				rs=null;
				
				// Remember to change the next line with your own environment 
				String url= 
				"jdbc:mysql://localhost:3306/feedback";
				String id= "root";
				String pass = "taniya@123";
				try{
				
					Class.forName("com.mysql.jdbc.Driver");  
					con = java.sql.DriverManager.getConnection(url, id, pass);
					System.out.println("connection okkk");
					
				
				}catch(ClassNotFoundException cnfex){
					cnfex.printStackTrace();
				
				}
				String sql = "select * from question_info";
				try{
					s = con.createStatement();
					rs = s.executeQuery(sql);
				%>
				
				<%
				while( rs.next() ){
				%><%-- <tr>
				<td><%= rs.getString("cust_id") %></td>
				<td><%= rs.getString("rdate") %></td>
				<td><%= rs.getString("email") %></td>
				</tr> --%>
				/* var newDiv="<div class="blockDiv"></div>"; */
				<% if(rs.getInt("sectionNumber")==1){%>
				var normalDiv='<div class="section-block">step <%=rs.getInt("sectionNumber")%>: <%=rs.getString("sectionHeading")%></div>';
				$('.mainDiv').append(normalDiv);
				<%
				}
			
				}
				}
				catch(Exception e){e.printStackTrace();}
				finally{
				if(rs!=null) rs.close();
				if(s!=null) s.close();
				if(con!=null) con.close();
				}
				
				%>
			}
							
		
		</script>
		<title>Think Excellence</title>
	</head>
	<body>
		<div class="logoDiv" style=" background-image: url('image/logo.png');">
		</div>
		<div>
			<form class="form-group formSetting" >
				<div class="freebirdAccentBackground"></div>
				<div>
					<h2 class="textSetting">
						Think Excellence 2.0 Feedback
					</h2>
					<div class="textSetting">Think Excellence 2.0 Feedback.</div>
					<div class="textSetting" style="color:#db4437">*Required</div>
					<div id="mainDiv">
					</div>
					<!-- <div class="row">
						<div class="col-sm-9 col-md-9 section-block">
							<div>STEP 1: DETAILS OF REVIEWER AND REVIEWEE</div>
							
						</div>
						<div class="col-md-1 col-sm-1">
							<polygon class="freebirdSolidFill" points="0,0 10,0 0,10"></polygon>
						</div>
					</div> -->
					
				</div>
			</form>
		</div>
			
	</body>
</html>