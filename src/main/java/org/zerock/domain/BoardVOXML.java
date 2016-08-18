package org.zerock.domain;

import java.io.Serializable;
import java.util.Date;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "board")
@XmlAccessorType(XmlAccessType.NONE)
public class BoardVOXML implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@XmlAttribute private Integer bno;
	@XmlAttribute private String title;
	@XmlAttribute private String content;
	@XmlAttribute private String writer;
	@XmlAttribute private Date regdate;
	@XmlAttribute private int viewcnt;
	@XmlAttribute private int likecnt;
	
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public int getLikecnt() {
		return likecnt;
	}
	public void setLikecnt(int likecnt) {
		this.likecnt = likecnt;
	}
	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", title=" + title + ", content="
				+ content + ", writer=" + writer + ", regdate=" + regdate
				+ ", viewcnt=" + viewcnt + ", likecnt=" + likecnt + "]";
	}

}
