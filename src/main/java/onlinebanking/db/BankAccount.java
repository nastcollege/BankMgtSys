package onlinebanking.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BankAccount {
	public static boolean isAcountActive(Long userId) {
		boolean isActive=false;
		try {
			Connection conn = DbConnection.connect();
			String sql="SELECT * FROM tbl_bank_accounts WHERE user_id=? AND status=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setLong(1, userId);
			stmt.setInt(2, 1);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				isActive=true;
			}

		}catch(Exception e) {
			isActive=false;
		}
		return isActive;
	}

	public static boolean isAcountRequested(Long userId) {
		boolean requested=false;
		try {
			Connection conn = DbConnection.connect();
			String sql="SELECT * FROM tbl_bank_accounts WHERE user_id=? AND status=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setLong(1, userId);
			stmt.setInt(2, 0);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				requested=true;
			}

		}catch(Exception e) {
			requested=false;
		}
		return requested;
	}
}
