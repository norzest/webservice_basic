package kr.or.kpc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.or.kpc.dto.MemberDto;
import kr.or.kpc.util.ConnLocator;

public class MemberDao {
	private MemberDao() {
	}
	private static class Holder {
		private static final MemberDao single = new MemberDao();
	}
	public static MemberDao getInstance() {
		return Holder.single;
	}
	
	// select
	public ArrayList<MemberDto> select(int start, int len) {
		ArrayList<MemberDto> list = new ArrayList<MemberDto>();		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			// DB와 연결하는 Connection 객체 생성
			con = ConnLocator.getConnect();
			
			// SQL 문을 전송할 수 있는 prepared statement 객체 생성
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT * FROM member ");
			sql.append("ORDER BY num LIMIT ?, ?");
			
			// 바인딩 변수 설정
			pstmt = con.prepareStatement(sql.toString());			
			int index = 1;
			pstmt.setInt(index++, start);
			pstmt.setInt(index++, len);
			
			// SQL문 전송
			rs = pstmt.executeQuery();
			while (rs.next()) {
				index = 1;
				int num = rs.getInt(index++);
				String name = rs.getString(index++);
				String addr = rs.getString(index++);
				list.add(new MemberDto(num, name, addr));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally { 
			try {
				if(con != null) con.close(); // Connection 자원을 반납
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} // finally
		
		return list;
	}
}
