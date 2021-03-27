<%-- 
    Document   : search
    Created on : Nov 10, 2020, 12:32:02 PM
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
#table1 {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#table1 td, #table1 th {
  border: 1px solid #ddd;
  padding: 8px;
}

#table1 tr{background-color: #f2f2f2;}

#table1 tr:hover {background-color: #ddd;}

#table1 th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
</style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="1" id="table1"> 
           <tr>
               <th>First Name</th>
               <th>Last Name</th>
               <th>Password</th>
               <th>Email</th>
               <th>Address</th>
               <th>City</th>
               <th>State</th>
               <th>Sex</th>

           </tr>
           <tr>
        <%! String check;%>
        <%
            try{
             check=request.getParameter("email");
         Class.forName("com.mysql.jdbc.Driver");
          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db1","root","root" );
          PreparedStatement ps= con.prepareStatement("select * from registration where  Email=?");
      
          ps.setString(1,check);
         
            ResultSet rs = ps.executeQuery();
               
            if(rs.next())
            {
          
           
       
        
       %>
   
             <td><%=rs.getString("First_Name")%></td>
             <td><%=rs.getString("Last_Name")%></td>
             <td><%=rs.getString("Password")%></td>
             <td><%=rs.getString("Email")%></td>
             <td><%=rs.getString("Address")%></td>
             <td><%=rs.getString("City")%></td>
             <td><%=rs.getString("State")%></td>
             <td><%=rs.getString("Sex")%></td>
          
      
          <%
              }
}
catch(Exception ae)
{

}

%>
           </tr>
        </table><br>
            <a href="admin.html">Go To Admin Panel</a>
    </body>
</html>
