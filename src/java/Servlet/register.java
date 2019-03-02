/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Bean.User;
import Dao.Userdao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author lenovo
 */
@WebServlet(name = "register", urlPatterns = {"/register"})
public class register extends HttpServlet {

    @Override  
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)  
            throws ServletException, IOException {  
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        String username = req.getParameter("usernamer"); 
        String password = req.getParameter("passwordr");  
        PrintWriter out = resp.getWriter();
        Userdao ud = new Userdao();
        User us=new User();
        us.setUsername(username);
        us.setPwd(password);
        int re=ud.add(us);
        if (re==-1) {  
            out.print("用户名已存在");  
        } else {
            re=ud.find(username, password);
            HttpSession mySession=req.getSession();
            mySession.setAttribute("username",username);
            mySession.setAttribute("userid",re);
            out.print("注册成功");
            out.print("<br/>");
            out.print("<a href=\"index.jsp\">返回首页</a>");
        }  
    }  
  
    @Override  
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)  
            throws ServletException, IOException {  
        this.doGet(req, resp);  
    }  
}
