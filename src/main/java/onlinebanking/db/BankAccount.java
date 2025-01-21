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

	public static int getAcountStatus(Long userId) {
		int requested=-1;
		try {
			Connection conn = DbConnection.connect();
			String sql="SELECT status FROM tbl_bank_accounts WHERE user_id=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setLong(1, userId);		
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				requested=rs.getInt("status");
			}

		}catch(Exception e) {
			requested=-1;
		}
		return requested;
	}
	public static int getBankAccountIdByAccountNumber(String accountNumber) {

		try {
			Connection conn = DbConnection.connect();
			String sql="SELECT id FROM tbl_bank_accounts WHERE account_number=? AND status=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, accountNumber);
			stmt.setInt(2, 1);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				return rs.getInt("id");
			}

		}catch(Exception e) {
			return 0;
		}
		return 0;
	}


	public static boolean updateBalance(int accountId, double balance){
		boolean success=false;
		try {
			Connection conn = DbConnection.connect();
			String sql="UPDATE tbl_bank_accounts SET balance=balance+? WHERE id=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setDouble(1, balance);
			stmt.setInt(2, accountId);
			success=stmt.executeUpdate()>0;

		}catch(Exception e) {
			success=false;
		}
		return success;
	}
}
