/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

/**
 *
 * @author lenovo
 */
public class Comment {
    private int id;
    private int newsid;
    private int userid;
    private String comment;
    private String time;
    
    public int getId(){
        return this.id;
    }
    public void setId(int id){
        this.id=id;
    }
    
    public int getNewsid(){
        return this.newsid;
    }
    public void setNewsid(int newsid){
        this.newsid=newsid;
    }
    
    public int getUserid(){
        return this.userid;
    }
    public void setUserid(int userid){
        this.userid=userid;
    }
    
    public String getComment(){
        return this.comment;
    }
    public void setComment(String comment){
        this.comment=comment;
    }
    
    public String getTime(){
        return this.time;
    }
    public void setTime(String time){
        this.time=time;
    }
}
