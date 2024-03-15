// CgvVO.java

package com.example.demo.vo;

import org.jsoup.nodes.Document;

@SuppressWarnings("unused")
public class CgvVO {
    private String title;
    private String image;
    private String genre;
    private int bookcnt;
	private String detail;

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getBookcnt() {
        return bookcnt;
    }

    public void setBookcnt(int bookcnt) {
        this.bookcnt = bookcnt;
    }

    public String getdetail() {
        return detail;
    }

	public void setdetail(String detail) {
		this.detail = detail;
		
	}
}
