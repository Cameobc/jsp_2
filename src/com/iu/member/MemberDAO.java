package com.iu.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.iu.util.DBConnector;

public class MemberDAO {
	//memberJoin(memberDTO) / return int 
	public int memberJoin(MemberDTO memberDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "Insert into member values(?, ?, ?, ?, ?, ?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, memberDTO.getId());
		st.setString(2, memberDTO.getPw());
		st.setString(3, memberDTO.getName());
		st.setString(4, memberDTO.getPhone());
		st.setString(5, memberDTO.getEmail());
		st.setInt(6, memberDTO.getAge());
		int result = st.executeUpdate();
		DBConnector.disConnect(con, st);
		return result;
	}
	//memberLogIn(String id) / return memberDTO
	public MemberDTO memberLogIn(MemberDTO memberDTO) throws Exception {
		MemberDTO m = null;
		Connection con = DBConnector.getConnect();
		String sql = "select * from member where id=? and pw=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, memberDTO.getId());
		st.setString(2, memberDTO.getPw());
		ResultSet rs = st.executeQuery();
		if(rs.next()) {
			m = new MemberDTO();
			m.setId(rs.getString("id"));
			m.setPw(rs.getString("pw"));
			m.setName(rs.getString("name"));
			m.setPhone(rs.getString("phone"));
			m.setEmail(rs.getString("email"));
			m.setAge(rs.getInt("age"));
		}
		DBConnector.disConnect(con, st, rs);
		return m;
	}
	
	//memberUpdate(memberDTO) / return int
	public int memberUpdate(MemberDTO memberDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "update member set pw=?, phone=?, email=?, age=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, memberDTO.getPw());
		st.setString(2, memberDTO.getPhone());
		st.setString(3, memberDTO.getEmail());
		st.setInt(4, memberDTO.getAge());
		int result = st.executeUpdate();
		DBConnector.disConnect(con, st);
		return result;
	}
	
	//memberDelete(String id) / return int
	public int memberDelete(String id) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "delete member where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		int result = st.executeUpdate();
		DBConnector.disConnect(con, st);
		return result;
	}
		
}
