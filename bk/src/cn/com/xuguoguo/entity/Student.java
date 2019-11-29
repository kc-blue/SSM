package cn.com.xuguoguo.entity;

public class Student {
	/*CREATE TABLE `student` (
	  `sno` int(11) NOT NULL AUTO_INCREMENT,
	  `sname` varchar(255) DEFAULT NULL,
	  `sex` varchar(255) DEFAULT NULL,
	  `major` varchar(255) DEFAULT NULL,
	  PRIMARY KEY (`sno`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;*/
	
	 private Integer sno;
     private String sname;
     private String sex;
     private String major;
	public Integer getSno() {
		return sno;
	}
	public void setSno(Integer sno) {
		this.sno = sno;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Student [sno=" + sno + ", sname=" + sname + ", sex=" + sex + ", major=" + major + "]";
	}

     
     

}
