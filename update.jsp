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
        <h1>Your Old Data</h1>
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
            String check=request.getParameter("n1");
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
         </table>

<%
            String c1=request.getParameter("n1");
            String c2=request.getParameter("n2");
            String c3=request.getParameter("n3");
            String c4=request.getParameter("n4");
            String c5=request.getParameter("n5");
            String c6=request.getParameter("n6");
            String c7=request.getParameter("n7");
            String c8=request.getParameter("n8");
             String c9=request.getParameter("n9"); 
         Class.forName("com.mysql.jdbc.Driver");
          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db1","root","root" );
          PreparedStatement ps= con.prepareStatement("update registration set First_name=?,Last_name=?,Password=?,Email=?,Address=?,City=?,State=?,Sex=? where Email=?");
                  
      
          ps.setString(1,c2);
          ps.setString(2,c3);
          ps.setString(3,c4);
          ps.setString(4,c6);
          ps.setString(5,c7);
          ps.setString(6,c8);
          ps.setString(7,c9);
          ps.setString(8,c5);
          ps.setString(9,c1);
        
         
            ps.executeUpdate();
               
         
          %>
          
          <h1>Update Success</h1>
    <h1>Your New Data</h1>
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
        <%! String check1;%>
        <%
            try{
            String check1=request.getParameter("n6");
         Class.forName("com.mysql.jdbc.Driver");
          Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db1","root","root" );
          PreparedStatement ps1= conn.prepareStatement("select * from registration where  Email=?");
      
          ps1.setString(1,check1);
         
            ResultSet rs1 = ps1.executeQuery();
               
            if(rs1.next())
            {
          
           
       
        
       %>
   
             <td><%=rs1.getString("First_Name")%></td>
             <td><%=rs1.getString("Last_Name")%></td>
             <td><%=rs1.getString("Password")%></td>
             <td><%=rs1.getString("Email")%></td>
             <td><%=rs1.getString("Address")%></td>
             <td><%=rs1.getString("City")%></td>
             <td><%=rs1.getString("State")%></td>
             <td><%=rs1.getString("Sex")%></td>
          
      
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
