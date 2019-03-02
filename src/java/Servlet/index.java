/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Bean.News;
import Dao.Newsdao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lenovo
 */
public class index extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String count=request.getParameter("count");
                
                Newsdao nd=new Newsdao();
                List<News> shizheng=new ArrayList<>();
                shizheng=nd.getNews("type","时政");
                List<News> shehui=new ArrayList<>();
                shehui=nd.getNews("type","社会");
                List<News> jinrong=new ArrayList<>();
                jinrong=nd.getNews("type","金融");
                List<News> yule=new ArrayList<>();
                yule=nd.getNews("type","娱乐");
                List<News> tiyu=new ArrayList<>();
                tiyu=nd.getNews("type","体育");
                List<News> guoji=new ArrayList<>();
                guoji=nd.getNews("province","国际");
                List<News> jingxuan=new ArrayList<>();
                jingxuan=nd.getNews("star","1");
                List<News> zuixin=new ArrayList<>();
                zuixin=nd.latestNews();
                

                request.getSession().setAttribute("shizheng",shizheng);
                request.getSession().setAttribute("shehui",shehui);
                request.getSession().setAttribute("jinrong",jinrong);
                request.getSession().setAttribute("yule",yule);
                request.getSession().setAttribute("tiyu",tiyu);
                request.getSession().setAttribute("guoji",guoji);
                request.getSession().setAttribute("jingxuan",jingxuan);
                request.getSession().setAttribute("zuixin",zuixin);
                request.getRequestDispatcher("index.jsp").forward(request, response);        
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
