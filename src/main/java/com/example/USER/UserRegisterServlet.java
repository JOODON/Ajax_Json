package com.example.USER;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UserRegisterServlet", value = "/UserRegisterServlet")
public class UserRegisterServlet extends HttpServlet {
    private static final long serialVersionUID=1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=UTF-8");
        String userName=request.getParameter("userName");
        String userAge=request.getParameter("userAge");
        String userGender=request.getParameter("userGender");
        String userEmail=request.getParameter("userEmail");

        response.getWriter().write(register(userName,userAge,userGender,userEmail)+" ");
    }
    public int register(String userName,String userAge,String userGender,String userEmail){
        User user=new User();
        try {
            user.setUserName(userName);
            user.setUserAge(Integer.parseInt(userAge));
            user.setUserGender(userGender);
            user.setUserEmail(userEmail);
        } catch (Exception e){
            return 0;
        }
        return new UserDao().register(user);
    }
}
