package com.example.casestudymodule3.controller;

import com.example.casestudymodule3.model.Gear;
import com.example.casestudymodule3.model.Item;
import com.example.casestudymodule3.model.Order;
import com.example.casestudymodule3.service.IUserDAO;
import com.example.casestudymodule3.service.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AddToCartController", value = "/addToCart")
public class AddToCartController extends HttpServlet {
    private IUserDAO iUserDAO;

    @Override
    public void init() throws ServletException {
        iUserDAO = new UserDAO();
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int quantity = 1;
        int id;
        long totalPrice = 0;
        if (request.getParameter("gearId") != null) {
            id = Integer.parseInt(request.getParameter("gearId"));
            Gear gear = iUserDAO.selectGear(id);
            if (gear != null) {
                if (request.getParameter("quantity") != null) {
                    quantity = Integer.parseInt(request.getParameter("quantity"));
                }
                HttpSession session = request.getSession();
                if (session.getAttribute("order") == null) {
                    Order order = new Order();
                    List<Item> listItems = new ArrayList<Item>();
                    Item item = new Item();
                    item.setQuantity(quantity);
                    item.setGear(gear);
                    item.setPrice(gear.getPrice());
                    listItems.add(item);
                    order.setItems(listItems);
                    for (Item i: listItems) {
                        totalPrice += i.getQuantity()*i.getPrice();
                    }
                    order.setTotal(totalPrice);
                    session.setAttribute("order", order);
                } else {
                    Order order = (Order) session.getAttribute("order");
                    List<Item> listItems = order.getItems();
                    boolean check = false;
                    for (Item item : listItems) {
                        if (item.getGear().getId() == gear.getId()) {
                            item.setQuantity(item.getQuantity() + quantity);
                            check = true;
                        }
                    }
                    if (!check) {
                        Item item = new Item();
                        item.setQuantity(quantity);
                        item.setGear(gear);
                        item.setPrice(gear.getPrice());
                        listItems.add(item);
                    }
                    for (Item i: listItems) {
                        totalPrice += i.getQuantity()*i.getPrice();
                    }
                    order.setTotal(totalPrice);
                    session.setAttribute("order", order);
                }
            }
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/cart.jsp");
            requestDispatcher.forward(request, response);
        } else {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/cart.jsp");
            requestDispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
