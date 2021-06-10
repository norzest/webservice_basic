package kr.or.kpc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.or.kpc.dto.NoticeDto;
import kr.or.kpc.util.ConnLocator;

public class NoticeDao {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	
	private NoticeDao() {
	}

	private static class Holder {
		private static final NoticeDao single = new NoticeDao();
	}

	public static NoticeDao getInstance() {
		return Holder.single;
	}
	
	private void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		try {
			if(con != null) con.close();
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// insert
	public boolean insert(NoticeDto dto) {
		boolean success = false;
		
		try {
			con = ConnLocator.getConnect();
			
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO notice(n_num, n_writer, n_title, n_content, n_regdate) ");
			sql.append("VALUES (?, ?, ?, ?, NOW()) ");
			
			pstmt = con.prepareStatement(sql.toString());
			int index = 1;
			pstmt.setInt(index++, dto.getNum());
			pstmt.setString(index++, dto.getWriter());
			pstmt.setString(index++, dto.getTitle());
			pstmt.setString(index++, dto.getContent());
			
			pstmt.executeUpdate();
			success = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt, null);
		}
		
		return success;
	}

	// update
	public boolean update(NoticeDto dto) {
		boolean success = false;

		try {
			con = ConnLocator.getConnect();

			StringBuilder sql = new StringBuilder();
			sql.append("UPDATE notice ");
			sql.append("SET n_writer = ?, n_title= ?, n_content= ? ");
			sql.append("WHERE n_num = ? ");

			pstmt = con.prepareStatement(sql.toString());
			int index = 1;
			pstmt.setString(index++, dto.getWriter());
			pstmt.setString(index++, dto.getTitle());
			pstmt.setString(index++, dto.getContent());
			pstmt.setInt(index++, dto.getNum());

			pstmt.executeUpdate();
			success = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt, null);
		}

		return success;
	}
	
	// delete
	public boolean delete(int num) {
		boolean success = false;

		try {
			con = ConnLocator.getConnect();

			StringBuilder sql = new StringBuilder();
			sql.append("DELETE FROM notice ");
			sql.append("WHERE n_num = ? ");

			pstmt = con.prepareStatement(sql.toString());
			int index = 1;
			pstmt.setInt(index++, num);

			pstmt.executeUpdate();
			success = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt, null);
		}

		return success;
	}
		
	// select
	public ArrayList<NoticeDto> select(int start, int len) {
		ArrayList<NoticeDto> list = new ArrayList<NoticeDto>();		
		ResultSet rs = null;

		try {
			// DB�� �����ϴ� Connection ��ü ����
			con = ConnLocator.getConnect();
			
			// SQL ���� ������ �� �ִ� prepared statement ��ü ����
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT n_num, n_writer, n_title, n_content, n_regdate FROM notice ");
			sql.append("ORDER BY n_num desc LIMIT ?, ?");
			
			// ���ε� ���� ����
			pstmt = con.prepareStatement(sql.toString());			
			int index = 1;
			pstmt.setInt(index++, start);
			pstmt.setInt(index++, len);
			
			// SQL�� ����
			rs = pstmt.executeQuery();
			while (rs.next()) {
				index = 1;
				int num = rs.getInt(index++);
				String writer = rs.getString(index++);
				String title = rs.getString(index++);
				String content = rs.getString(index++);
				String regdate = rs.getString(index++);
				list.add(new NoticeDto(num, writer, title, content, regdate));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally { 
			close(con, pstmt, rs);
		} // finally
		
		return list;
	}
}
