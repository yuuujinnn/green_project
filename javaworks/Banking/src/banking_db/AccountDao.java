package banking_db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import banking_db.common.JDBCUtil;

public class AccountDao {
	//JDBC ���� ����
		private Connection conn = null;
		private PreparedStatement pstmt = null;
		private ResultSet rs = null;
		private Scanner scanner = new Scanner(System.in);
		
		//���� ����
		public void createAccount() {
			System.out.println("--------------------------");
			System.out.println("���� ����");
			System.out.println("--------------------------");
			
			while(true) {
				System.out.println("���� ��ȣ: ");
				String ano = scanner.next();
				if(findAccount(ano) != null) {
					System.out.println("�ߺ��� �����Դϴ�. �ٽ� �Է��ϼ���");
				}else {
					System.out.println("������: ");
					String owner = scanner.next();
					while(true) {
						System.out.println("�ʱ� �Աݾ�: ");
						int balance = scanner.nextInt();
						if(balance < 100) {
							System.out.println("�ʱ� �Աݾ��� 100�� �̻��Դϴ�.");
						}else {
							//���� ��ü ����
							conn = JDBCUtil.getConnention();
							String sql = "INSERT INTO account(ano, owner, balance) VALUES (?, ?, ?)";
							try {
								pstmt = conn.prepareStatement(sql);
								pstmt.setString(1, ano);
								pstmt.setString(2, owner);
								pstmt.setInt(3, balance);
								pstmt.executeUpdate();
								System.out.println("��� : ���°� �����Ǿ����ϴ�.");
							} catch (SQLException e) {
								e.printStackTrace();
							} finally {
								JDBCUtil.close(conn, pstmt);
							}
							break;
						}
					}//while �ݱ�
					break;
				}
			}//while �ݱ�
		}
		
		//���� ��� ����
		public List<Account> getAccountList(){
			System.out.println("-----------------------------------------------------");
		    System.out.println("2. ���� ���");
		    System.out.println("-----------------------------------------------------");
		    
			List<Account> accountList = new ArrayList<>();
			conn = JDBCUtil.getConnention();
			String sql = "SELECT * FROM account";
			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {             //�ڷᰡ �ִٸ� ��� �ݺ�
					String ano = rs.getString("ano");
					String owner = rs.getString("owner");
					int balance = rs.getInt("balance");
					
					Account account = new Account(ano, owner, balance);
					accountList.add(account);
				}
				
				for(int i = 0; i < accountList.size(); i++) {
			    	Account account = accountList.get(i);
			    	System.out.print("���¹�ȣ : " + account.getAno() + "\t");
		    		System.out.print("������ : " + account.getOwner() + "\t");
		    		System.out.println("�ܾ� : " + account.getBalance());
			    }
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(conn, pstmt, rs);
			}
			return accountList;
		}
		
		//����
		public void deposit() {
			System.out.println("--------------------------");
			System.out.println("����");
			System.out.println("--------------------------");
			
			while(true) {
				System.out.println("���� ��ȣ: ");
				String ano = scanner.next();
				//�Է��� ���°� ������ ó��
				if(findAccount(ano) == null) {
					System.out.println("���°� �����ϴ�. �ٽ� �Է��ϼ���");
				}else {
					Account account = findAccount(ano);  //�˻��� ���� ��ȯ
					while(true) {
						System.out.println("�Աݾ�: ");
						int money = scanner.nextInt();
						String owner = account.getOwner();
						int balance = account.getBalance() + money;  //�ܾ� = �ܾ� + �Աݾ�
						if(money < 0) {
							System.out.println("�߸��� �Է��Դϴ�. �ٽ� �Է��ϼ���");
						}else {
							conn = JDBCUtil.getConnention();
							String sql = "UPDATE account SET owner = ?, balance = ?  WHERE ano = ? ";
							try {
								pstmt = conn.prepareStatement(sql);
								pstmt.setString(1, owner);
								pstmt.setInt(2, balance);
								pstmt.setString(3, ano);
								pstmt.executeUpdate();
								System.out.printf("%,d�� ���� �ԱݵǾ����ϴ�.\n", money);
							} catch (SQLException e) {
								e.printStackTrace();
							} finally {
								JDBCUtil.close(conn, pstmt);
							}
							break;
						}
					}
					break;
				}
			}
		}
		
		//���
		public void withdraw() {
			System.out.println("--------------------------");
			System.out.println("���");
			System.out.println("--------------------------");
			
			while(true) {
				System.out.println("���� ��ȣ: ");
				String ano = scanner.next();
				
				//�Է��� ���°� ������ ó��
				if(findAccount(ano) == null) {
					System.out.println("���°� �����ϴ�. �ٽ� �Է��ϼ���");
				}else {
					Account account = findAccount(ano);
					while(true) {
						System.out.println("��ݾ�: ");
						int money = scanner.nextInt();
						String owner = account.getOwner();
						int balance = account.getBalance() - money;  //�ܾ� = �ܾ� - �Աݾ�
						if(money > account.getBalance()) {
							System.out.println("�ܾ��� �����մϴ�. �ٽ� �Է��ϼ���");
						}else if(money < 0) {
							System.out.println("�߸��� �Է��Դϴ�. �ٽ� �Է��ϼ���");
						}else {
							conn = JDBCUtil.getConnention();
							String sql = "UPDATE account SET owner = ?, balance = ?  WHERE ano = ? ";
							try {
								pstmt = conn.prepareStatement(sql);
								pstmt.setString(1, owner);
								pstmt.setInt(2, balance);
								pstmt.setString(3, ano);
								pstmt.executeUpdate();
								System.out.printf("%,d�� ���� ��ݵǾ����ϴ�.\n", money);
							} catch (SQLException e) {
								e.printStackTrace();
							} finally {
								JDBCUtil.close(conn, pstmt);
							}
							break;
						}
					}
					break;
				}
			}
		}
		
		//���� �󼼺���
		public void viewAccount() {
			System.out.println("--------------------------");
			System.out.println("���� �˻�");
			System.out.println("--------------------------");
			
			while(true) {
				System.out.println("���� ��ȣ: ");
				String ano = scanner.next();
				
				//�Է��� ���°� ������ ó��
				if(findAccount(ano) == null) {
					System.out.println("���°� �����ϴ�. �ٽ� �Է��ϼ���");
				}else {
					Account account = findAccount(ano);
					
					System.out.print("���¹�ȣ: " + account.getAno() + "\t");
					System.out.print("������: " + account.getOwner() + "\t");
					System.out.println("�ܾ�: " + account.getBalance());
					break;
				}
			}
		}
		
		//���� ����
		public void deleteAccount() {
			System.out.println("--------------------------");
			System.out.println("���� ����");
			System.out.println("--------------------------");
			
			while(true) {
				System.out.println("���� ��ȣ: ");
				String ano = scanner.next();
				
				//�Է��� ���°� ������ ó��
				if(findAccount(ano) == null) {
					System.out.println("���°� �����ϴ�. �ٽ� �Է��ϼ���");
				}else {
					conn = JDBCUtil.getConnention();
					String sql = "DELETE FROM account WHERE ano = ?";
					try {
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, ano);
						pstmt.executeUpdate();
						System.out.println("��� : ���°� �����Ǿ����ϴ�.");
					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						JDBCUtil.close(conn, pstmt, rs);
					}		
					break;
				}
			}
		}
		
		//���� ã�� �޼���(��ü �޼��忡�� ����)
		public Account findAccount(String ano) {
			Account account = null;
			conn = JDBCUtil.getConnention();
			String sql = "SELECT * FROM account WHERE ano = ?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, ano);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					ano = rs.getString("ano");
					String owner = rs.getString("owner");
					int balance = rs.getInt("balance");
					
					account = new Account(ano, owner, balance);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(conn, pstmt, rs);
			}
			return account;
		}
}
