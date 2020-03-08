<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="icon" href="icon.png">
        <link rel="stylesheet" type="text/css" href="index.css" >
        <title>Home Page</title>
        <style>
            #div1 {background-color: pink;width:33cm;height:40px;}
            #p1 {font-size:30px;font-family:arial;text-align:center;font-style:italic;}
            #link { color: #FF0000; } /* CSS link color */
        </style>
    </head>
    <body>
        <div id="div1">
            <p id="p1">Kaar Feedback Application</p>
        </div><br><br><br>
        <div class="background-wrap">
            <video id="video-bg-elem" preload="auto" autoplay="true" loop="loop" muted="false"> 
                <source src="videoplayback.mp4" type="video/mp4">
            </video>          
        </div>
        <div id="link" style="position:absolute;left:38%;top:38%;border-color: black;border-width: 3px;border-style: solid;width:5cm;border-color: yellow;height:4cm;">
            <center>
                <br><br>
                <h3><font color="yellow"><a color="yellow" href="companyzone.jsp">Company Zone</a><br><br>
                    <a color="yellow" href="myfeedback.jsp">User Zone</a></font></h3>
            </center>
        </div>
    </body>
</html>
