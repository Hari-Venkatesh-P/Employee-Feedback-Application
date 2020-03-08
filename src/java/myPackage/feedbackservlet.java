/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myPackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Laptop
 */
public class feedbackservlet extends HttpServlet {

    private Connection cn = null;

    public void init(ServletConfig sc) throws ServletException {

        try {
            super.init(sc);
            Class.forName("com.mysql.jdbc.Driver");
            cn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/kaar", "root", "");
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            Statement stmt = cn.createStatement();
            try {
                String eid = request.getParameter("eid");
                String ename = request.getParameter("ename");
                String cid = request.getParameter("cid");
                String cname = request.getParameter("cname");
                String suggestions = request.getParameter("myfeedback");
                int rating = Integer.parseInt(request.getParameter("rating"));
                String servicepoints = request.getParameter("point");
                String query = "insert into myfeedback values('" + eid + "','" + ename + "','" + cid + "','" + cname + "'," + rating + ",'" + servicepoints + "','" + suggestions + "')";
                stmt.executeUpdate(query);
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet feedbackservlet</title>");
                out.println("</head>");
                out.println("<body bgcolor='lightyellow'>");
                out.println("<h1>Successfuly submitted the Feedback..!!</h1>");
                out.print("<center><a href='" + getServletContext().getContextPath() + "/index.jsp'>Home</a><br><br></center>");
                out.println("</body>");
                out.println("</html>");
            } catch (Exception ex) {
                out.println("<h1>Error occured in submitting feedback</h1>");
                System.out.println(ex);
            }
        } catch (SQLException ex) {
            Logger.getLogger(feedbackservlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
