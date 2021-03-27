<%-- 
    Document   : reg
    Created on : Nov 10, 2020, 11:53:48 AM
    Author     : ASUS
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%! String s1,s2,s3,s4,s5,s6,s7,s8;%>
        <%
          try {
            /* TODO output your page here. You may use following sample code. */
               String s1=request.getParameter("first_name");
        String s2=request.getParameter("last_name");
        String s3=request.getParameter("password");
        String s4=request.getParameter("email");
        String s5=request.getParameter("address");
        String s6=request.getParameter("city");
        String s7=request.getParameter("state");
        String s8=request.getParameter("gender");
          Class.forName("com.mysql.jdbc.Driver");
          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db1","root","root" );
          PreparedStatement pst= con.prepareStatement("insert into registration values(?,?,?,?,?,?,?,?)");
          pst.setString(1,s1);
          pst.setString(2,s2);
          pst.setString(3,s3);
          pst.setString(4,s4);
          pst.setString(5,s5);
          pst.setString(6,s6);
          pst.setString(7,s7);
          pst.setString(8,s8);
           pst.executeUpdate();
          out.print("Inserting Data success");
          }
          catch(Exception ae)
          {
              out.print(ae);
          }
        %><br>
         <a href="admin.html">Go to Admin Panel</a>
          

          
    </body>
</html>
