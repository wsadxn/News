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
public class News {
    private int id;
    private String title;
    private String content;
    private String main;
    private String time;
    private int userid;
    private String type;
    private String province;
    private int state;
    private int star;
    
    public int getId(){
        return this.id;
    }
    public void setId(int id){
        this.id=id;
    }
    
    public String getTitle(){
        return this.title;
    }
    public void setTitle(String title){
        this.title=title;
    }
    
    public String getContent(){
        return this.content;
    }
    public void setContent(String content){
        this.content=content;
    }
    
    public String getMain(){
        return this.main;
    }
    public void setMain(String main){
        this.main=main;
    }
    
    public String getTime(){
        return this.time;
    }
    public void setTime(String time){
        this.time=time;
    }
       
    public int getUserid(){
        return this.userid;
    }
    public void setUserid(int userid){
        this.userid=userid;
    }
    
    public String getType(){
        return this.type;
    }
    public void setType(String type){
        this.type=type;
    }
    
    public String getProvince(){
        return this.province;
    }
    public void setProvince(String province){
        this.province=province;
    }
       
    public int getState(){
        return this.state;
    }
    public void setState(int state){
        this.state=state;
    }

    public int getStar(){
        return this.star;
    }
    public void setStar(int star){
        this.star=star;
    }
}
