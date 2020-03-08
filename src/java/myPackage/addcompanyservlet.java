package myPackage;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import myPackage.*;
/**
 *
 * @author Laptop
 */
public class addcompanyservlet extends HttpServlet {

    private Connection cn = null;
    public void init(ServletConfig sc) throws ServletException
    {
        
        try
        {
            super.init(sc);
            Class.forName("com.mysql.jdbc.Driver");
            cn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/kaar","root","");
        }
        catch (Exception ex)
        {
            System.out.println(ex);
        } 
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String cname=" ";
        try{
            Statement stmt = cn.createStatement();
            Company c = new Company();
            cname = request.getParameter("cname");
            String cid = request.getParameter("cid");
            String ctype = request.getParameter("type");
            String ccategory = request.getParameter("ccategory");
            String password = request.getParameter("password");
            c.setName(cname);
            c.setId(cid);
            c.setCategory(ccategory);
            c.setType(ctype);
            String query ="insert into companydetails values ('"+cid+"','"+cname+"','"+ctype+"','"+ccategory+"')";
            stmt.executeUpdate(query);
            String query1="insert into companycredentials values('"+cid+"','"+password+"')";
            stmt.executeUpdate(query1);
            out.println("<p>Details of Company M/s."+cname+" has been succesfully created</p>");
            out.print("<center><a href='" + getServletContext().getContextPath() + "/addEmployee.html'>Add New Employee</a><br><br></center>");
            out.print("<center><a href='" + getServletContext().getContextPath() + "/index.jsp'Home</a><br><br></center>");
            }catch (SQLException ex) {
                out.println("<p>Error in registering the details of the company M/s."+cname+" ..!!</p>");
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
