package com.example.USER;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UserDao {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public UserDao(){
        try {
           String dbURL= "jdbc:mysql://localhost:3307/ajax";
           String dbID="root";
           String dbPassWord="kkjjss103@";
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn= DriverManager.getConnection(dbURL,dbID,dbPassWord);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public ArrayList<User> search(String userName){
        String SQL="SELECT * FROM USER WHERE userName LIKE ?";
        ArrayList<User> userList=new ArrayList<User>();
        try {
            ps=conn.prepareStatement(SQL);
            ps.setString(1,userName);
            rs=ps.executeQuery();
            while (rs.next()){
                User user=new User();
                user.setUserName(rs.getString(1));
                user.setUserAge(rs.getInt(2));
                user.setUserGender(rs.getString(3));
                user.setUserEmail(rs.getString(4));
                userList.add(user);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return userList;
    }
}
