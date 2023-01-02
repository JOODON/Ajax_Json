package com.example.Test;

import com.example.USER.User;
import com.example.USER.UserDao;
import com.example.USER.UserSearchServlet;

import java.util.ArrayList;

public class test {
    public static void main(String[] args) {
        UserSearchServlet userSearchServlet=new UserSearchServlet();
        String name=userSearchServlet.getJson("주동호");
        System.out.println(name);
    }
}
