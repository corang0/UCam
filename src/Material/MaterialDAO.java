package Material;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DatabaseUtil.DatabaseUtil;

public class MaterialDAO {
	private Connection conn;
	private ResultSet rs;

	public MaterialDAO() {	
		try {		
			Class.forName("com.mysql.jdbc.Driver");
			conn=DatabaseUtil.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getDate() { 
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; //데이터베이스 오류
	}
	
	public int getNext() { 
		String SQL = "SELECT pid FROM materialpost ORDER BY pid*1 DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int write(String ptitle, String pcontent, String cid, String file1, String file2) { 
		String SQL = "INSERT INTO materialpost VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, Integer.toString(getNext()));
			pstmt.setString(2, ptitle);
			pstmt.setString(3, pcontent);
			pstmt.setInt(4, 0);
			pstmt.setString(5, getDate());
			pstmt.setString(6, cid);
			pstmt.setString(7, file1);
			pstmt.setString(8, file2);
			
			return pstmt.executeUpdate();			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
}
