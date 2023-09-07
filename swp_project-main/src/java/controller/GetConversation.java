/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ConversationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Messages;

/**
 *
 * @author admin
 */
@WebServlet(name = "GetConversation", urlPatterns = {"/getconversation"})
public class GetConversation extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GetConversation</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GetConversation at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        
        String conversationId = request.getParameter("conversationid");
        ConversationDAO cb = new ConversationDAO();
        ArrayList<Messages> messages = cb.getMessagesConversation(Integer.parseInt(conversationId));
        String htmlResponse = "<div class=\"action-header clearfix\">\n"
                + "    <div class=\"visible-xs\" id=\"ms-menu-trigger\">\n"
                + "        <i class=\"fa fa-bars\"></i>\n"
                + "    </div>\n"
                + "    <div class=\"pull-left hidden-xs\">\n"
                + "        <img src=\"data:image/jpeg/png/jpg;base64," + messages.get(0).getCustomer().getEncodedImage() + "\" alt class=\"img-avatar m-r-10\" />\n"
                + "        <div class=\"lv-avatar pull-left\"></div>\n"
                + "        <span><strong>" + messages.get(0).getCustomer().getFirstname() + " " + messages.get(0).getCustomer().getLastname() + "</strong></span>\n"
                + "    </div>\n"
                + "</div>\n"
                + "<div class=\"message\">\n"
                + "    <div id=\"messageContainer\" data-conversationid=\"" + conversationId + "\">\n"
                + "    </div>\n"
                + "</div>"
                + "</div>";
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(htmlResponse);

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
