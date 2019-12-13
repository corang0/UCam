package User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.io.PrintWriter;

import DatabaseUtil.DatabaseUtil;

public class UserDAO {
	//�α��� ������ ����
	public int login(String id,String password,String userDivision) {
		String SQL;
		if (userDivision.equals("student"))
		{
			System.out.println("1");
			SQL="select spw from "+ userDivision +" where sid=?";
		}
		else
		{			
			System.out.println("2");
			SQL="select pw from "+ userDivision +" where prid=?";
		}
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(password)) {
					return 1;//�α��μ���
				}else {
					return 0;//�α��� ����
				}
			}
			return -2;//������ ����
		}catch(Exception e) {			
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null)conn.close();
				if(pstmt!=null)pstmt.close();
				if(rs!=null)rs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return -2; //�����ͺ��̽� ����		
	}
	//�л� or ������ �ڽ��� �����ϴ� or �����ϴ� ��� �ҷ�����
	
	
}
