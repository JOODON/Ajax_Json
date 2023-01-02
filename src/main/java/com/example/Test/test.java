package com.example.Test;

import com.example.USER.User;
import com.example.USER.UserDao;

import java.util.ArrayList;

public class test {
    public static void main(String[] args) {
        UserDao userDao=new UserDao();

        ArrayList<User> list=userDao.search("이선영");
        for (int i=0; i<list.size(); i++){
            System.out.println(list.get(i).getUserAge());
        }

    }
}
