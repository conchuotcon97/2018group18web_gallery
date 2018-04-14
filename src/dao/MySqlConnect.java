package dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class MySqlConnect {
	public static Connection conn = null;
	public static Statement stmt = null;

	public static Connection getMySQLConnection() throws ClassNotFoundException, SQLException {
		// Chú ý: Thay đổi các thông số kết nối cho phù hợp.
		String hostName = "localhost";
		String dbName = "webgallerydb";
		String userName = "root";
		String password = "Yeudoibecon524@";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String connectionURL = "jdbc:mysql://" + hostName + ":3306/" + dbName;
			conn = DriverManager.getConnection(connectionURL, userName, password);

		} catch (Exception e) {
			System.out.println("Error: " + e.getClass().getName() + ":" + e.getMessage());

		}
		return conn;
	}

	public static void createChildMenu(String parentID, PrintWriter out) {
		try {
			Statement st = getMySQLConnection().createStatement();
			ResultSet rsl = st.executeQuery("select * from menu");

			List<String> idChildMenu = new ArrayList<>();
			List<String> nameChildMenu = new ArrayList<>();
			List<String> pathChildMenu = new ArrayList<>();
			try {
				while (rsl.next()) {
					// tìm tất cả id và name của các dòng nếu có parent_id
					if (rsl.getString("parent_id").equals(parentID)) {
						// add data vào 3 lít, các id và name của cùng parent sẽ được lưu tương ứng
						// trong 3 list
						idChildMenu.add(rsl.getString("menu_id"));
						nameChildMenu.add(rsl.getString("menu_name"));
						pathChildMenu.add(rsl.getString("path"));

					}
				}
				if (idChildMenu.size() > 0)// nếu tồn tại menu con với parent_id
				{
					out.println("<ul>");// bắt đầu 1 phân cấp với thẻ<ul>
					for (int i = 0; i < idChildMenu.size(); i++) {
						out.print("<li>");// bắt đầu dòng menu con"
						out.println("<a href='index.jsp?menu_id=" + pathChildMenu.get(i) + " '>" + nameChildMenu.get(i)
								+ "</a>");
						createChildMenu(idChildMenu.get(i), out);

					}
					out.println("</ul>");// kết thúc 1 phân cấp menu
				} else {
					out.println("</li>");
				}
			} catch (Exception e) {
			}

		} catch (Exception e) {
		}
	}

	public static void createMenu(PrintWriter out1) {
		try {
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("select* from menu");
			try {
				// Bắt đầu tạo menu với thẻ điều hướng <nav>
				out1.println("<nav>");
				out1.println("<ul>");

				// Phương thức next() kiểm tra dòng dữ liệu tiếp theo có tồn tại hay không
				while (rs.next()) // Sử dụng tương đương như vòng lặp for duyệt qua hết các bộ giá trị trong
									// ResultSet
				{
					// Nếu parent_id=0, tức là tất cả menu cha (cấp 0)
					if (rs.getString("parent_id").equals("0")) {
						out1.println("<li>");

						// In tất cả menu cha cấp 0 (parent_id=0)
						out1.println("<a href='index.jsp?menu_id=" + rs.getString("path") + "'>"
								+ rs.getString("menu_name") + "</a>");

						// Với mỗi menu cha, kiểm tra sự tồn tại của menu con và tạo ra chúng
						// bằng hàm CreateChildMenu với tham số là id menu hiện tại.
						createChildMenu(rs.getString("id"), out1);
					}
				}
				out1.println("</ul>");
				out1.println("</nav>");
			} catch (Exception ex) {
			}
		} catch (SQLException e) {
		}
	}
}
