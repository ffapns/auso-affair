/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import dbconnection.myDb;
import service.LoginService;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.pojo.UserProjectInfo;
import service.ProjectService;

/**
 *
 * @author fifap
 */
@WebServlet("/Login")
public class Login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String userName = request.getParameter("uname");
        String password = request.getParameter("upass");
        LoginService loginService = new LoginService();
        ProjectService projectService = new ProjectService();
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            myDb db = new myDb();
            Connection con = db.getCon();
            System.out.print(userName + ":" + password);

            ResultSet rs = loginService.RequestLogin(userName.trim(), password.trim());
            List<UserProjectInfo> upi = projectService.GetProjectByUsername(userName);
            System.out.print(upi.size());
            if (rs.next()) {
                HttpSession session = request.getSession(true);
                session.setAttribute("username", userName);
                request.setAttribute("user_projects", upi);
                con.close();

                request.getRequestDispatcher("/documentlist.jsp").forward(request, response);
                //response.sendRedirect("documentlist.jsp");

            } else {
                con.close();
                response.sendRedirect("login.jsp");
            }

        } catch (SQLException ex) {
            System.out.print(ex.toString());
        }
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
