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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author lenovo
 */
public class Commentdao {
    Jdbcdao jdbc = new Jdbcdao();

    public int add(Comment comment) {
        Connection conn = jdbc.getCon();
        String sql ="insert into comments (newsid,userid,comment,time) values (?,?,?,?)";
        PreparedStatement pstmt = null;
        int i = 0;
        try {
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
            pstmt.setInt(1,comment.getNewsid());
            pstmt.setInt(2,comment.getUserid());
            pstmt.setString(3,comment.getComment());
            pstmt.setString(4,comment.getTime());
            i = pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            return i;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public List<Comment> find(int newsid) {
        Connection conn = jdbc.getCon();
        List<Comment> list=new ArrayList<>();
        String sql = "select * from comments where newsid = ?";
        PreparedStatement pstmt = null;
        try {
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
            pstmt.setInt(1, newsid);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Comment comment = new Comment();
                comment.setId(rs.getInt("id"));
                comment.setNewsid(rs.getInt("newsid"));
                comment.setUserid(rs.getInt("userid"));
                comment.setComment(rs.getString("comment"));
                comment.setTime(rs.getString("Time"));
                list.add(comment);
            }
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<Comment> findByUid(int uid) {
        Connection conn = jdbc.getCon();
        List<Comment> list=new ArrayList<>();
        String sql = "select * from comments where userid = ?";
        PreparedStatement pstmt = null;
        try {
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
            pstmt.setInt(1, uid);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Comment comment = new Comment();
                comment.setId(rs.getInt("id"));
                comment.setNewsid(rs.getInt("newsid"));
                comment.setUserid(rs.getInt("userid"));
                comment.setComment(rs.getString("comment"));
                comment.setTime(rs.getString("Time"));
                list.add(comment);
            }
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public int delete(int id) {
        Connection conn = jdbc.getCon();
        String sql = "delete from comments where id=?";
        PreparedStatement pstmt = null;
        int i = 0;
        try {
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
            pstmt.setInt(1,id);
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
