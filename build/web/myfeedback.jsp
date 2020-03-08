<%-- 
    Document   : myfeedback
    Created on : 12 Jul, 2019, 1:58:19 PM
    Author     : Laptop
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Feedback Form</title>
        <link rel="icon" href="icon.png">
         <style type ="text/css">
                #div1 {background-color: pink;width:33cm;height:40px;}
                #p1 {font-size:30px;font-family:arial;text-align:center;font-style:italic;}
                body{background-color:lightyellow;}
        </style>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body bgcolor="lightyellow">
         <%!
           private Connection cn = null; 
           %>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kaar","root",""); 
            Statement stmt = cn.createStatement();
            %>
        <div id="div1">
                <p id="p1">User Feedback Form</p>
            </div><br><br><br>
        <div>
            <center>
            <fieldset>
                <legend><b>Feedback Form<br></legend>
                <br><br>
            <form action="feedbackservlet">
                <b>Employee Name :</b><input type="text" name="ename" ></input><br></br>
                <b>Employee ID :</b><input type="text" name="eid" ></input><br></br>
                <b>Company Name :</b>
                <select>
                <% String query1 ="select * from companydetails"; 
              String cname="null";
              ResultSet rs = stmt.executeQuery(query1);
              while(rs.next())
              {
                    cname =  rs.getString("cname");
                    System.out.println(cname);
                 %>
                 <option value="<%= cname %>"><%= cname %></option>             
              <%
              }
              %>
                </select><br><br>
                <b>Company ID :</b><input type="text" name="cid"><br></br>
                <b>Rating(1-10):</b>1
               <input type="range" min="1" max="100" value="50" name="rating">100<br></br>
               <b>Service Points :</b><input type="number" name="point" step="3" start="0"><br><br>
               <u>Suggestions<u><br><br>
               <textarea cols="50" rows="4" name="myfeedback"></textarea><br><br>
                <input type="submit" value="RATE EMPLOYEE">
            </form>
            </fieldset>
            </center>
        </div>
    </body>
</html>

