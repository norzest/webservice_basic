package kr.or.kpc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.or.kpc.dto.CustomerDto;
import kr.or.kpc.util.ConnLocator;

public class CustomerDao {
	private CustomerDao() {
	}

	private static class Holder {
		private static final CustomerDao single = new CustomerDao();
	}

	public static CustomerDao getInstance() {
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
	
	

	public boolean insert(CustomerDto dto) {
		boolean success = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ConnLocator.getConnect();
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO customer(c_num, c_email,c_pwd,c_name, ");
			sql.append("c_status, c_regdate) VALUES(?,?, ");
			sql.append("PASSWORD(?),?,?,NOW()) ");

			pstmt = con.prepareStatement(sql.toString());
			int index = 1;
			pstmt.setInt(index++, dto.getNum());
			pstmt.setString(index++, dto.getEmail());
			pstmt.setString(index++, dto.getPwd());
			pstmt.setString(index++, dto.getName());
			pstmt.setString(index++, dto.getStatus());

			pstmt.executeUpdate();
			success = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return success;
	}
	public boolean update(CustomerDto dto) {
		boolean success = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ConnLocator.getConnect();
			StringBuilder sql = new StringBuilder();
			sql.append("UPDATE customer ");
			sql.append("SET c_name =?,  ");
			if(dto.getPwd() != null && dto.getPwd().length() >0) {
				sql.append("c_pwd = PASSWORD(?), ");
			}
			sql.append("c_status=? ");
			sql.append("WHERE c_num = ? ");//

			pstmt = con.prepareStatement(sql.toString());
			int index = 1;
			pstmt.setString(index++, dto.getName());
			if(dto.getPwd() != null && dto.getPwd().length() >0) {
				pstmt.setString(index++, dto.getPwd());
			}
			pstmt.setString(index++, dto.getStatus());
			pstmt.setInt(index++, dto.getNum());

			pstmt.executeUpdate();
			success = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return success;
	}
	public ArrayList<CustomerDto> select(int start, int len){
		ArrayList<CustomerDto> list = 
				new ArrayList<CustomerDto>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ConnLocator.getConnect();

			StringBuilder sql = new StringBuilder();
			sql.append("SELECT c_num, c_email, c_pwd, c_name, ");
			sql.append("c_status, date_format(c_regdate,'%Y/%m/%d') ");
			sql.append("FROM customer ");
			sql.append("ORDER BY c_regdate DESC ");
			sql.append("LIMIT ?,? ");

			pstmt = con.prepareStatement(sql.toString());

			int index = 1;
			pstmt.setInt(index++, start);
			pstmt.setInt(index++, len);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				index = 1;
				int num = rs.getInt(index++);
				String email = rs.getString(index++);
				String pwd = rs.getString(index++);
				String name = rs.getString(index++);
				String status = rs.getString(index++);
				String regdate = rs.getString(index++);
				list.add(new CustomerDto(num, email, pwd,
						name, status, regdate));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(con, pstmt, rs);
		}

		return list;
	}
	
	public CustomerDto select(int num) {
		CustomerDto dto = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ConnLocator.getConnect();

			StringBuilder sql = new StringBuilder();
			sql.append("SELECT c_num, c_email, c_pwd, c_name, ");
			sql.append("c_status, date_format(c_regdate,'%Y/%m/%d') ");
			sql.append("FROM customer ");
			sql.append("WHERE c_num = ?");

			pstmt = con.prepareStatement(sql.toString());

			int index = 1;
			pstmt.setInt(index++, num);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				index = 1;
				num = rs.getInt(index++);
				String email = rs.getString(index++);
				String pwd = rs.getString(index++);
				String name = rs.getString(index++);
				String status = rs.getString(index++);
				String regdate = rs.getString(index++);
				dto =  new CustomerDto(num, email, pwd, 
						name,status, regdate);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(con, pstmt, rs);
		}

		return dto;
	}
	
	public int getRows() {
		int resultCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ConnLocator.getConnect();

			StringBuilder sql = new StringBuilder();
			sql.append("select count(c_num) from customer");
			sql.append("");

			pstmt = con.prepareStatement(sql.toString());

			int index = 1;
			rs = pstmt.executeQuery();
			if (rs.next()) {
				index = 1;
				resultCount = rs.getInt(index++);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(con, pstmt, rs);
		}

		return resultCount;
	}
	
	public boolean isExisted(String email) {
		boolean existed = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ConnLocator.getConnect();

			StringBuilder sql = new StringBuilder();
			sql.append("SELECT c_email ");
			sql.append("FROM customer ");
			sql.append("WHERE c_email = ?");

			pstmt = con.prepareStatement(sql.toString());

			int index = 1;
			pstmt.setString(index++, email);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				existed = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(con, pstmt, rs);
		}

		return existed;
	}
	
	public int getMaxNum() {
		int resultCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ConnLocator.getConnect();

			StringBuilder sql = new StringBuilder();
			sql.append("SELECT ifnull(MAX(c_num)+1,1) ");
			sql.append("FROM customer");

			pstmt = con.prepareStatement(sql.toString());

			int index = 1;

			rs = pstmt.executeQuery();
			if (rs.next()) {
				index = 1;
				resultCount = rs.getInt(index++);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(con, pstmt, rs);
		}

		return resultCount;
	}
	public CustomerDto getLogin(String email, String pwd) {
		CustomerDto dto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ConnLocator.getConnect();

			StringBuilder sql = new StringBuilder();
			sql.append("SELECT c_num, c_email, c_pwd, c_name, ");
			sql.append("c_status, date_format(c_regdate,'%Y/%m/%d') ");
			sql.append("FROM customer ");
			sql.append("WHERE c_email = ? AND c_pwd = PASSWORD(?) ");

			pstmt = con.prepareStatement(sql.toString());

			int index = 1;
			pstmt.setString(index++, email);
			pstmt.setString(index++, pwd);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				index = 1;
				int num = rs.getInt(index++);
				email = rs.getString(index++);
				pwd = rs.getString(index++);
				String name = rs.getString(index++);
				String status = rs.getString(index++);
				String regdate = rs.getString(index++);
				dto = new CustomerDto(num, email, pwd,
						name, status, regdate);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(con, pstmt, rs);
		}

		return dto;
	}
}
