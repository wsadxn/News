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
public class Newsdao {
    Jdbcdao jdbc = new Jdbcdao();

    public int add(News news) {
        Connection conn = jdbc.getCon();
        String sql = "insert into news (title,content,main,time,userid,type,province,state,star) values (?,?,?,?,?,?,?,?,?)";
        PreparedStatement pstmt = null;
        int i = 0;
        try {
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
            pstmt.setString(1, news.getTitle());
            pstmt.setString(2, news.getContent());
            pstmt.setString(3, news.getMain());
            pstmt.setString(4, news.getTime());
            pstmt.setInt(5, news.getUserid());
            pstmt.setString(6, news.getType());
            pstmt.setString(7, news.getProvince());
            pstmt.setInt(8, news.getState());
            pstmt.setInt(9, news.getStar());
            i = pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            return i;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public List<Integer> search(String search) {
        Connection conn = jdbc.getCon();
        List<Integer> list=new ArrayList<>();
        String sql = "select * from news where title like ? and state=1";
        PreparedStatement pstmt = null;
        try {            
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
            pstmt.setString(1,"%"+search+"%");
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
                list.add(rs.getInt("id"));
            }
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<Integer> find(String searchtype,String search) {
        Connection conn = jdbc.getCon();
        List<Integer> list=new ArrayList<>();
        String sql = "select * from news where "+searchtype+" = ? and state = 1";
        PreparedStatement pstmt;
        try {            
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
            pstmt.setString(1,search);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
                list.add(rs.getInt("id"));
            }
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<Integer> findWait(String searchtype,String search) {
        Connection conn = jdbc.getCon();
        List<Integer> list=new ArrayList<>();
        String sql = "select * from news where "+searchtype+" = ?";
        PreparedStatement pstmt;
        try {            
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
            pstmt.setString(1,search);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
                list.add(rs.getInt("id"));
            }
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<News> getNews(String searchtype,String search)
    {
        Connection conn = jdbc.getCon();
        List<News> list=new ArrayList<>();
        String sql = "select * from news where "+searchtype+" = ? and state=1 limit 5";
        PreparedStatement pstmt;
        try{
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
            pstmt.setString(1,search);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
                News news = new News();
                news.setId(rs.getInt("id"));
                news.setTitle(rs.getString("title"));
                news.setContent(rs.getString("content"));
                news.setMain(rs.getString("main"));
                news.setTime(rs.getString("time"));
                news.setUserid(rs.getInt("userid"));
                news.setType(rs.getString("type"));
                news.setProvince(rs.getString("province"));
                news.setState(rs.getInt("state"));
                news.setStar(rs.getInt("star"));
                list.add(news);
            }
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<News> latestNews()
    {
        Connection conn = jdbc.getCon();
        List<News> list=new ArrayList<>();
        String sql = "select * from news where state=1 order by time limit 5";
        PreparedStatement pstmt;
        try {            
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
                News news = new News();
                news.setId(rs.getInt("id"));
                news.setTitle(rs.getString("title"));
                news.setContent(rs.getString("content"));
                news.setMain(rs.getString("main"));
                news.setTime(rs.getString("time"));
                news.setUserid(rs.getInt("userid"));
                news.setType(rs.getString("type"));
                news.setProvince(rs.getString("province"));
                news.setState(rs.getInt("state"));
                news.setStar(rs.getInt("star"));
                list.add(news);
            }
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<News> AllNews()
    {
        Connection conn = jdbc.getCon();
        List<News> list=new ArrayList<>();
        String sql = "select * from news where state=1 order by time";
        PreparedStatement pstmt;
        try {            
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
                News news = new News();
                news.setId(rs.getInt("id"));
                news.setTitle(rs.getString("title"));
                news.setContent(rs.getString("content"));
                news.setMain(rs.getString("main"));
                news.setTime(rs.getString("time"));
                news.setUserid(rs.getInt("userid"));
                news.setType(rs.getString("type"));
                news.setProvince(rs.getString("province"));
                news.setState(rs.getInt("state"));
                news.setStar(rs.getInt("star"));
                list.add(news);
            }
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<News> findByUid(int uid) {
        Connection conn = jdbc.getCon();
        List<News> list=new ArrayList<>();
        String sql = "select * from news where userid = ?";
        PreparedStatement pstmt = null;        
        try {
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
            pstmt.setInt(1, uid);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {  
                News news = new News();
                news.setId(rs.getInt("id"));
                news.setTitle(rs.getString("title"));
                news.setContent(rs.getString("content"));
                news.setMain(rs.getString("main"));
                news.setTime(rs.getString("time"));
                news.setUserid(rs.getInt("userid"));
                news.setType(rs.getString("type"));
                news.setProvince(rs.getString("province"));
                news.setState(rs.getInt("state"));
                news.setStar(rs.getInt("star"));
                list.add(news);
            }
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public News find(int id) {
        Connection conn = jdbc.getCon();
        String sql = "select * from news where id = ?";
        News news = new News();
        PreparedStatement pstmt = null;        
        try {
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {    
                news.setId(rs.getInt("id"));
                news.setTitle(rs.getString("title"));
                news.setContent(rs.getString("content"));
                news.setMain(rs.getString("main"));
                news.setTime(rs.getString("time"));
                news.setUserid(rs.getInt("userid"));
                news.setType(rs.getString("type"));
                news.setProvince(rs.getString("province"));
                news.setState(rs.getInt("state"));
                news.setStar(rs.getInt("star"));
            }
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return news;
    }
    
    public int delete(int id) {
        Connection conn = jdbc.getCon();
        String sql = "delete from comments where newsid=?";
        String ssql = "delete from news where id=?";
        PreparedStatement pstmt = null;
        int i = 0;
        try {
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            i = pstmt.executeUpdate();
            pstmt = (PreparedStatement) conn.prepareStatement(ssql);
            pstmt.setInt(1, id);
            i = pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            return i;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
    
    public int update(News news) {
        Connection conn = jdbc.getCon();
        String sql = "update news set title=?,content=?,main=?,time=?,type=?,province=?,state=?,star=? where id=?";
        PreparedStatement pstmt = null;
        int i = 0;
        try {
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
            pstmt.setString(1, news.getTitle());
            pstmt.setString(2, news.getContent());
            pstmt.setString(3, news.getMain());
            pstmt.setString(4, news.getTime());
            pstmt.setString(5, news.getType());
            pstmt.setString(6, news.getProvince());
            pstmt.setInt(7, news.getState());
            pstmt.setInt(8, news.getStar());
            pstmt.setInt(9, news.getId());
            i = pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            return i;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
}
