package com.example.casestudymodule3.controller;

import com.example.casestudymodule3.model.Gear;
import com.example.casestudymodule3.service.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "AdminServlet", value = "/admin")
public class AdminServlet extends HttpServlet {
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

        try {
            switch (action) {
                case "create":
                    showNewForm(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    deleteGear(request, response);
                    break;
                case "findByCloseName":
                    findGearByName(request, response);
                    break;
                case "findGearByManufacturer":
                    findGearByManufacturer(request, response);
                    break;
                case "findGearByType":
                    findGearByType(request, response);
                    break;
                case "sortByNameASC":
                    sortGearByNameASC(request, response);
                    break;
                case "sortByNameDESC":
                    sortGearByNameDESC(request, response);
                    break;
                default:
                    listGear(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void findGearByType(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("findType");
        List<Gear> gearsFindedByType = userDAO.findGearByType(type);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("admin/list.jsp");
        request.setAttribute("listGear",gearsFindedByType);
        requestDispatcher.forward(request, response);
    }

    private void findGearByManufacturer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String manufacturer = request.getParameter("findManufacturer");
        List<Gear> gearsFindedByManufacturer = userDAO.findGearByManufacturer(manufacturer);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("admin/list.jsp");
        request.setAttribute("listGear",gearsFindedByManufacturer);
        requestDispatcher.forward(request, response);
    }

    private void sortGearByNameDESC(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Gear> gearListSortedByNameASC = userDAO.sortGearByNameASC();
        request.setAttribute("listGear", gearListSortedByNameASC);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("admin/list.jsp");
        requestDispatcher.forward(request, response);
    }

    private void sortGearByNameASC(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Gear> gearListSortedByNameDESC = userDAO.sortGearByNameDESC();
        request.setAttribute("listGear", gearListSortedByNameDESC);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("admin/list.jsp");
        requestDispatcher.forward(request, response);
    }

    private void findGearByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String closeName = request.getParameter("findName");
        List<Gear> gearsFindedByCloseName = userDAO.findCloseName(closeName);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("admin/list.jsp");
        request.setAttribute("listGear",gearsFindedByCloseName);
        requestDispatcher.forward(request, response);
    }

    private void deleteGear(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        userDAO.deleteGear(id);
        request.setAttribute("messageDelete", "abc");
        List<Gear> listGear = userDAO.selectAllGears();
        request.setAttribute("listGear", listGear);
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin/list.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Gear existingGear = userDAO.selectGear(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin/edit.jsp");
        request.setAttribute("gear", existingGear);
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin/create.jsp");
        dispatcher.forward(request, response);
    }

    private void listGear(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Gear> listGear = userDAO.selectAllGears();
        request.setAttribute("listGear", listGear);
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin/list.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    insertGear(request, response);
                    break;
                case "edit":
                    updateGear(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void insertGear(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String name = request.getParameter("name");
        String manufacturer = request.getParameter("manufacturer");
        String type = request.getParameter("type");
        long price = Long.parseLong(request.getParameter("price"));
        String description = request.getParameter("description");
        String image = request.getParameter("image");
        Gear newGear = new Gear(name, manufacturer, type, price, description, image);
        userDAO.insertGear(newGear);
        request.setAttribute("message","abc");
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin/create.jsp");
        dispatcher.forward(request, response);
    }

    private void updateGear(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String manufacturer = request.getParameter("manufacturer");
        String type = request.getParameter("type");
        long price = Long.parseLong(request.getParameter("price"));
        String description = request.getParameter("description");
        String image = request.getParameter("image");

        Gear gear = new Gear(id, name, manufacturer, type, price, description, image);
        userDAO.updateGear(gear);
        request.setAttribute("message","abc");
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin/edit.jsp");
        dispatcher.forward(request, response);
    }
}
