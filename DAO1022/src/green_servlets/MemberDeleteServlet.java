package green_servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import green_vo.Member;

@SuppressWarnings("serial")
@WebServlet("/member/delete")
public class MemberDeleteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			ServletContext sc = this.getServletContext();
			conn = (Connection)sc.getAttribute("conn");
			stmt = conn.createStatement();
			System.out.println(request.getParameter("no"));
			rs = stmt.executeQuery(
					"select mno, mname, email, cre_date from members " + " where mno =" + request.getParameter("no"));
			if (rs.next()) { // DB로부터 가져온 데이터 ResultSet에서 하나씩 가져옴
				request.setAttribute("member", new Member()
						.setNo(rs.getInt("mno"))
						.setName(rs.getString("mname"))
						.setEmail(rs.getString("email"))
						.setCreatedDate(rs.getDate("cre_date"))
						);
			} else {
				throw new Exception("해당 번호의 회원을 찾을 수 없습니다.");
			}
			RequestDispatcher rd = request.getRequestDispatcher(
					"/NewMember/MemberDeleteForm.jsp"
					);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e);
			RequestDispatcher rd = request.getRequestDispatcher("/Error.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("포스트 잘 들어오나 업데이트 시 ");
		request.setCharacterEncoding("utf-8");
		Connection conn = null;
		PreparedStatement stmt = null;
		PreparedStatement stmt2 = null;
		PreparedStatement stmt3 = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");// 드라이버 로딩
			conn = DriverManager.getConnection("jdbc:mysql://localhost/studydb?", // JDBC URL
					"root", // DBMS 사용자 아이디
					"1234"); // DBMS 사용자 암호
			System.out.println("업데이트DB 접속 성공 " + conn);
			stmt = conn.prepareStatement("delete from members where mno=?");
			stmt.setString(1, request.getParameter("no"));
			stmt.executeUpdate();
			stmt2 = conn.prepareStatement("set @count = 0");
			stmt2.execute();
			stmt3 = conn.prepareStatement("update members set members.mno = @count:=@count+1");
			stmt3.executeUpdate();
			response.sendRedirect("list");

		} catch (Exception e) {
			System.out.println("딜리트 실패");
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (Exception e) {
			}
			try {
				if (stmt2 != null)
					stmt2.close();
			} catch (Exception e) {
			}
			try {
				if (stmt3 != null)
					stmt3.close();
			} catch (Exception e) {
			}
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
	}

}
