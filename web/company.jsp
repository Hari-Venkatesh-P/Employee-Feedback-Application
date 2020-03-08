<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Company Site</title>
        <style>
            #emp {background-color: lightcyan;position :absolute;top:13cm;left:5%}
        </style>
        <link rel="icon" href="icon.png">
    </head>
    <%!
        private Connection cn = null;
        String eid = "";
        String ename = "";
        String eid1 = "";
        String ename1 = "";
        String maxirating = "";
    %>
    <%
        Class.forName("com.mysql.jdbc.Driver");
        cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kaar", "root", "");
        String pid = (String) request.getAttribute("adno");
        Statement stmt = cn.createStatement();
        String cname = "", cid = "", ccategory = "", ctype = "";
    %>
    <%
        String query = "select * from companydetails where cid='" + pid + "'";
        ResultSet rs = stmt.executeQuery(query);
        while (rs.next()) {
            cname = rs.getString("cname");
            cid = rs.getString("cid");
            ccategory = rs.getString("ccategory");
            ctype = rs.getString("ctype");
        }
    %>
    <%
        int maximum;
        String query1 = "SELECT * FROM myfeedback WHERE rating =  ( SELECT MAX(rating) FROM myfeedback ) and cid = '"+pid+"'";
        ResultSet rs1 = stmt.executeQuery(query1);
        while (rs1.next()) {
            eid = rs1.getString("eid");
            ename = rs1.getString("ename");
        }
    %>
    <%
        int minimum;
        String query2 = "SELECT * FROM myfeedback WHERE rating =  ( SELECT MIN(rating) FROM myfeedback ) and cid = '"+pid+"'";
        ResultSet rs2 = stmt.executeQuery(query2);
        while (rs2.next()) {
            eid1 = rs2.getString("eid");
            ename1 = rs2.getString("ename");
        }
    %>
    <div style="position:absolute;left:2cm;top:3cm;" >
        Employee with maximum positive feedbacks from customers is  <%= ename%>,<%= eid%>
        <br>
        Employee with minimum positive feedbacks from customers is  <%= ename1%>,<%= eid1%>
        <br><br>
        <a href="addEmployee.html">Add Employees</a><br>
        <h1><i>Company Profile :</i></h1>
        <table cellpadding="10" cellspacing="3"  >
            <tr bgcolor="lightblue">
                <td>Company Name :</td>
                <td><%= cname%></td>
            </tr>
            <tr bgcolor="lightyellow">
                <td>Company ID :</td>
                <td><%= cid%></td>
            </tr>
            <tr bgcolor="lightblue">
                <td> Company Category:</td>
                <td><%= ccategory%></td>
            </tr>
            <tr bgcolor="lightyellow">
                <td>Company Type :</td>
                <td><%= ctype%></td>
            </tr>
        </table>
    </div>	
    <div style="position:absolute;left:2cm;top:11cm;" >
        <h1><i>Company Employees :</i></h1>
    </div>
    <div id="emp">

        <table cellspacing="5" cellspading="5">
            <tr bgcolor="lightyellow">
                <td>Employee ID</td>
                <td>Employee Name</td>
                <td>Company ID </td>
                <td>Employee Designation</td>
                <td>Last Worked</td>
            </tr>
            <%
                String query4 = "select * from employeedetails where cid='" + pid + "'";
                rs = stmt.executeQuery(query4);
                while (rs.next()) {
                    String eid = rs.getString("eid");
                    String pname = rs.getString("cid");
                    String ename = rs.getString("ename");
                    String designation = rs.getString("edesignation");
                    String lastworked = rs.getString("lastworked");


            %>
            <tr bgcolor="lightblue">
                <td><%= eid%></td>
                <td><%= pname%></td>
                <td><%= ename%></td>
                <td><%= designation%></td>
                <td><%= lastworked%></td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
</body>
</html>
