<%-- 
    Document   : reg
    Created on : Nov 10, 2020, 11:53:48 AM
    Author     : ASUS
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            .side{
                text-align: left;
              
                
            }
        .icard {
           
      position: absolute;
                left: 600px;
                top:150px;
                background-color:#ffff66;
                text-align: center;
                padding: 10px;
                height: 450px;
                width: 350px;

}
.txt1{
    height:110px;
    width:100px;
   margin-left: -20px;
   margin-top: -50px;
}
</style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%! String s1,s2;%>
        <%
          try {
            /* TODO output your page here. You may use following sample code. */
               String s1=request.getParameter("email");
        String s2=request.getParameter("pass");
      
          Class.forName("com.mysql.jdbc.Driver");
          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db1","root","root" );
          PreparedStatement ps= con.prepareStatement("select * from registration where  Email=? and Password=?");
      
          ps.setString(1,s1);
           ps.setString(2,s2);
         
            ResultSet rs = ps.executeQuery();
               
            if(rs.next())
            {
                %>
    <center><h1>Login Successful</h1></center>

    <center>
     <form class="icard">
         
         <h1> Identity Card</h1><br><br>
         <input type="text" class="txt1" placeholder="Photo"><br><br>
         <div class="side">   Name :-&nbsp;&nbsp;&nbsp;&nbsp;<%= rs.getString("First_name")%>&nbsp;<%=rs.getString("Last_name")%><br><br></div>
         <div class="side"> Email :-&nbsp;&nbsp;&nbsp;&nbsp;<%= rs.getString("Email")%><br><br></div> 
         <div class="side">   Address :-&nbsp;&nbsp;&nbsp;&nbsp; <%= rs.getString("Address")%><br><br></div> 
         <div class="side"> City :-&nbsp;&nbsp;&nbsp;&nbsp;<%= rs.getString("City")%><br><br></div> 
         <div class="side"> State :- &nbsp;&nbsp;&nbsp;&nbsp; <%= rs.getString("State")%><br><br></div>
         <div class=side>Sex :-&nbsp;&nbsp;&nbsp;&nbsp; <%= rs.getString("Sex")%></div>
     </form>
    </center>
                <%
                    
            }
          }
          catch(Exception ae)
          {
              out.print(ae);
          }
    
%><br><br>
    
    <center> <a href="admin.html">Go To Admin Panel</a></center>

          
    </body>
</html>
