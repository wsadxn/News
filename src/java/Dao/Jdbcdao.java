/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Administrator
 */
public class Jdbcdao {

    Connection con = null;

    public Connection getCon() {
        String JDriver = "com.mysql.jdbc.Driver";
        String connectDB = "jdbc:mysql://localhost:3306/newsrelease?characterEncoding=utf8&useSSL=true&serverTimezone=GMT";
        String user = "root";
        String password = "gxn970408";
        try {
            Class.forName(JDriver);
            con = DriverManager.getConnection(connectDB, user, password);
            System.out.println("success");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }

    public void closeCon() {
        try {
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Jdbcdao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
