package com.example.casestudymodule3.controller;

import com.example.casestudymodule3.service.IUserDAO;
import com.example.casestudymodule3.service.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CartController", value = "/cart")
public class CartController extends HttpServlet {
    private IUserDAO iUserDAO;

    @Override
    public void init() throws ServletException {
        iUserDAO = new UserDAO();
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/cart.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
        super.doPost(request, response);
    }
}
