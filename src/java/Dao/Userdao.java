/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Bean.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Userdao {

    Jdbcdao jdbc = new Jdbcdao();

    public int add(User user) {
        Connection conn = jdbc.getCon();
        String sql = "insert into users (username,pwd) values (?,?)";
        String ssql = "select * from users where username=?";
        PreparedStatement pstmt = null;
        int i = 0;
        try {
            pstmt = (PreparedStatement) conn.prepareStatement(ssql);
            pstmt.setString(1, user.getUsername());
            ResultSet rs = pstmt.executeQuery();
            if (!rs.next()) {
                pstmt = (PreparedStatement) conn.prepareStatement(sql);
                pstmt.setString(1, user.getUsername());
                pstmt.setString(2, user.getPwd());
                i = pstmt.executeUpdate();
            }
            pstmt.close();
            conn.close();
            return i;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public int find(String username, String pwd) {
        Connection conn = jdbc.getCon();
        String sql = "select * from users where username = ? and pwd=?";
        PreparedStatement pstmt = null;
        try {
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, pwd);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("id");
            }
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public User find(int id) {
        Connection conn = jdbc.getCon();
        String sql = "select * from users where id = ?";
        PreparedStatement pstmt = null;
        User user = new User();
        try {
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPwd(rs.getString("pwd"));
                user.setLimit(rs.getInt("limit"));
            }
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
    
    public int updatePwd(int id,String pwd){
        Connection conn = jdbc.getCon();
        String sql="update users set pwd=? where id="+id;
        PreparedStatement pstmt = null;
        int i = 0;
        try {
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
            pstmt.setString(1, pwd);
            i = pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            return i;
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
}