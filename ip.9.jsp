<%-- 
    Document   : ip.9
    Created on : 20 Mar, 2023, 10:15:24 AM
    Author     : Vishnu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% String n=request.getParameter("t1");
        Connection c=DriverManager.getConnection("jdbc:derby://localhost:1527/cse");
        Statement st=c.createStatement();
       ResultSet rs1=st.executeQuery("select * from employee");
        ResultSetMetaData r=rs1.getMetaData();
        out.println("<h1>Employee details</h1>");
        out.println("<table border=2>");
        out.println("<th>"+r.getColumnName(1)+"</th>");
        out.println("<th>"+r.getColumnName(2)+"</th>");
        out.println("<th>"+r.getColumnName(3)+"</th>");
        out.println("<th>"+r.getColumnName(4)+"</th>");
       
        while(rs1.next())
        {
            out.println("<tr><td>"+rs1.getInt(1)+"</td>");
            out.println("<td>"+rs1.getString(2)+"</td>");
            out.println("<td>"+rs1.getString(3)+"</td>");
            out.println("<td>"+rs1.getDouble(4)+"</td>");
           
        }
        out.println("</table>");
          out.println("<table>");
         ResultSet rs =st.executeQuery("select count(*) from employee");
       int c1=0;
        while(rs.next())
        {
            c1=rs.getInt(1);
            out.println("<tr><td>Total no of employess</td><td>"+c1+"</td></tr><br>");
        }
        ResultSet r2=st.executeQuery("select avg(salary) from employee");
        double s=0;
        while(r2.next())
        {
            s=r2.getDouble(1);
            out.println("<tr><td>average salary of all employees</td><td>"+s+"</td></tr><br>");
        }
        double ms=0;
         ResultSet r1=st.executeQuery("select max(salary) from employee");
         while(r1.next())
         {
             ms=r1.getDouble(1);
             out.println("<tr><td>maximum salary of a employee</td><td>"+ms+"</td></tr>");
         }
        
        %>
    </body>
</html>
