package cy.test;

public class DataBean {
private int id;
private String userName;
private String addr;
public DataBean(){	
}
public DataBean(int _id,String _userName,String _addr){
	this.id=_id;
	this.userName=_userName;
	this.addr=_addr;
}
public DataBean[] GetData(){
	DataBean[] dbList={
			new DataBean(1,"�Ž���","����"),
			new DataBean(2,"�Ž���","�Ϻ�"),
			new DataBean(3,"�Ž���","����"),
			new DataBean(4,"�Ž���","����"),
			new DataBean(5,"�Ž���","��ݸ")
	};
	return dbList;
	}
public void setId(int id) {
	this.id = id;
}
public int getId() {
	return id;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public String getUserName() {
	return userName;
}
public void setAddr(String addr) {
	this.addr = addr;
}
public String getAddr() {
	return addr;
}

}
