package com.iu.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iu.util.DBConnector;

public class NoticeDAO {
	
	//rownum추가해서 조회하는 sql문 작성 메서드명은 getCountNum
	public int getCountNum(String kind, String search) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql="select count(no) from notice where "+kind+" like ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		ResultSet rs = st.executeQuery();
		rs.next();
		int result = Integer.parseInt(rs.getString(1));
		DBConnector.disConnect(con, st, rs);
		return result;
	}
	
	/*public static void main(String[] args) {
		NoticeDAO noticeDAO = new NoticeDAO();
		NoticeDTO noticeDTO = new NoticeDTO();
		for(int i=0;i<100;i++) {
		noticeDTO.setTitle("a"+i);
		noticeDTO.setContents("aa"+i);
		noticeDTO.setWriter("abc"+i);
		try {
			noticeDAO.insert(noticeDTO);
			Thread.sleep(100);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
	}*/

	//selectList() r: ar
	public ArrayList<NoticeDTO> selectList(String kind, String search, int startRow, int lastRow)throws Exception{
		ArrayList<NoticeDTO> ar = new ArrayList<NoticeDTO>();
		Connection con = DBConnector.getConnect();
		String sql = " select * from "
				+ "(select rownum r, n.* from "
				+ "(select no, title, writer, reg_date, hit from notice where "+kind+" like ? order by no desc) n) "
				+ "where r between ? and ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		st.setInt(2, startRow);
		st.setInt(3, lastRow);
		ResultSet rs = st.executeQuery();
		while(rs.next()) {
			NoticeDTO noticeDTO = new NoticeDTO();
			noticeDTO.setNo(rs.getInt("no"));
			noticeDTO.setTitle(rs.getString("title"));
			noticeDTO.setWriter(rs.getString("writer"));
			noticeDTO.setReg_date(rs.getString("reg_date"));
			noticeDTO.setHit(rs.getInt("hit"));
			ar.add(noticeDTO);
		}
		DBConnector.disConnect(con, st, rs);
		return ar;
	}
	
	//selectOne() r:noticeDTO 매개:int num
	public NoticeDTO seletOne(int num) throws Exception {
		NoticeDTO noticeDTO = null;
		Connection con = DBConnector.getConnect();
		String sql ="select * from notice where no=? order by no desc";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs = st.executeQuery();
		if(rs.next()) {
			noticeDTO = new NoticeDTO();
			noticeDTO.setNo(rs.getInt("no"));
			noticeDTO.setTitle(rs.getString("title"));
			noticeDTO.setContents(rs.getString("contents"));
			noticeDTO.setWriter(rs.getString("writer"));
			noticeDTO.setReg_date(rs.getString("reg_date"));
			noticeDTO.setHit(rs.getInt("hit"));
		}
		DBConnector.disConnect(con, st, rs);
		return noticeDTO;
	}
	
	//insert() r:int  매개 : noticeDTO
	public int insert(NoticeDTO noticeDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "insert into notice (no, title, contents, writer) values(notice_seq.nextval, ?, ?, ?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, noticeDTO.getTitle());
		st.setString(2, noticeDTO.getContents());
		st.setString(3, noticeDTO.getWriter());
		int result = st.executeUpdate();
		DBConnector.disConnect(con, st);
		return result;
	}
	
	//update() r:int 매개 : noticeDTO
	public int update(NoticeDTO noticeDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "update notice set title=?, contents=? where no=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, noticeDTO.getTitle());
		st.setString(2, noticeDTO.getContents());
		st.setInt(3, noticeDTO.getNo());
		int result = st.executeUpdate();
		DBConnector.disConnect(con, st);
		return result;
	}
	
	//delete() r:int 매개: int num
	public int delete(int num) throws Exception {
		Connection con =DBConnector.getConnect();
		String sql  = "delete notice where no=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		int result = st.executeUpdate();
		DBConnector.disConnect(con, st);
		return result;
	}
	
}
