package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UserDAO {
	
	private Connection con;
	private PreparedStatement pstm;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/AJAX";
			String db ="lsh";
			String dbpw ="1234";
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,db,dbpw);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<User> search(String userName){
		String sql = "select * from user where username like ?";
		ArrayList<User> userList= new ArrayList<>();
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1,"%" + userName+ "%");
			rs=pstm.executeQuery();
			while(rs.next()) {
				User user = new User();
				user.setUserName(rs.getString(1));
				user.setUserAge(rs.getInt(2));
				user.setUserGender(rs.getString(3));
				user.setUserEmail(rs.getString(4));
				userList.add(user);
			}
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return userList;
	}
}
