package com.example.casestudymodule3.controller;

import com.example.casestudymodule3.model.Gear;
import com.example.casestudymodule3.service.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/user")
public class UserServlet extends HttpServlet {
    private static UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "viewDetails":
                viewGearDetails(request, response);
                break;
            case "findByCloseName":
                findGearCloseName(request, response);
                break;
            default:
                viewGearsList(request, response);
                break;
        }
    }

    private void findGearCloseName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String closeName = request.getParameter("findName");
        List<Gear> gearListFindedByCloseName = userDAO.findCloseName(closeName);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/user/list.jsp");
        request.setAttribute("listGear", gearListFindedByCloseName);
        requestDispatcher.forward(request, response);
    }

    private void viewGearDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String image = request.getParameter("image");
        Gear existingGear = userDAO.selectGear(image);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/product-details.jsp");
        request.setAttribute("gear", existingGear);
        dispatcher.forward(request, response);
    }

    private void viewGearsList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Gear> listGear = userDAO.selectAllGears();
        request.setAttribute("listGear", listGear);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/list.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
