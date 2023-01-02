package com.example.USER;

import javax.print.attribute.standard.NumberUp;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "UserSearchServlet", value = "/UserSearchServlet")
public class UserSearchServlet extends HttpServlet {
    private static final long serialVersionUID=1L;

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        String userName=request.getParameter("주동호");
        response.getWriter().write(getJson(userName));
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException , IOException{
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=UTF-8");
        String userName=request.getParameter("userName");
        response.getWriter().write(getJson(userName));
    }
    public String getJson(String userName){

        if(userName==null) userName="";
        StringBuilder result=new StringBuilder("");
        result.append("{\"result\":[");
        UserDao userDao=new UserDao();
        ArrayList<User> userArrayList = userDao.search(userName);
        for (int i=0; i<userArrayList.size(); i++){
            result.append("[{\"value\":\"" + userArrayList.get(i).getUserName()+"\"},");
            result.append("{\"value\":\"" + userArrayList.get(i).getUserAge()+"\"},");
            result.append("{\"value\":\"" + userArrayList.get(i).getUserGender()+"\"},");
            result.append("{\"value\":\"" + userArrayList.get(i).getUserEmail()+"\"}],");
        }
        result.append("]}");

        return result.toString();

    }
}
