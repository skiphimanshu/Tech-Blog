
package com.tech.blog.entities;

import java.sql.Timestamp;

public class Post {
    private int pid;
    private String pTitle;
    private String pContent;
    private String pCode;
    private String pImg;
    private Timestamp pdate;
    private int catId;
    private int userId;

    public Post(int pid, String pTitle, String pContent, String pCode, String pImg, Timestamp pdate, int catId,int userId) {
        this.pid = pid;
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
        this.pImg = pImg;
        this.pdate = pdate;
        this.catId = catId;
        this.userId = userId;
    }

    public Post(String pTitle, String pContent, String pCode, String pImg, Timestamp pdate, int catId,int userId) {
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
        this.pImg = pImg;
        this.pdate = pdate;
        this.catId = catId;
        this.userId = userId;
    }
    
    //getter and setter
    
    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getpTitle() {
        return pTitle;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public String getpContent() {
        return pContent;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent;
    }

    public String getpCode() {
        return pCode;
    }

    public void setpCode(String pCode) {
        this.pCode = pCode;
    }

    public String getpImg() {
        return pImg;
    }

    public void setpImg(String pImg) {
        this.pImg = pImg;
    }

    public Timestamp getPdate() {
        return pdate;
    }

    public void setPdate(Timestamp pdate) {
        this.pdate = pdate;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    
    
    
}
