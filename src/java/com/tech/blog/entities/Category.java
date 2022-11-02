
package com.tech.blog.entities;

public class Category {
    
    private int cid;
    private String name;
    private String desc;

    public Category(int cid, String name, String desc) {
        this.cid = cid;
        this.name = name;
        this.desc = desc;
    }

    public Category() {
    }

    public Category(String name, String desc) {
        this.name = name;
        this.desc = desc;
    }
    
    //getter 

    public int getCid() {
        return cid;
    }

    public String getName() {
        return name;
    }

    public String getDesc() {
        return desc;
    }
    
    //setter

    public void setCid(int cid) {
        this.cid = cid;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
    
    
    
     
}
