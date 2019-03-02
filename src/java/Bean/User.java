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
public class User {
    private int id;
    private String username;
    private String pwd;
    private int limit;
    
    public int getId(){
        return this.id;
    }
    public void setId(int id){
        this.id=id;
    }
    
    public String getUsername(){
        return this.username;
    }
    public void setUsername(String username){
        this.username=username;
    }
    
    public String getPwd(){
        return this.pwd;
    }
    public void setPwd(String pwd){
        this.pwd=pwd;
    }
    
    public int getLimit(){
        return this.limit;
    }
    public void setLimit(int limit){
        this.limit=limit;
    }
}
