<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 05/01/2023
  Time: 20:55
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/list-style.css">
    <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap"
    />
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
    />
    <title>Product Lists</title>
</head>
<body>

<%--START OF NAVBAR--%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <div class="container-fluid">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/user/homepage.jsp">
                <img src="https://i.pinimg.com/originals/72/3d/0a/723d0af616b1fe7d5c7e56a3532be3cd.png" alt="" width="100" height="70" class="d-inline-block align-text-center">
                GAMING GEAR
            </a>
        </div>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div style="width: 670px">
                <form method="get">
                    <label>
                        <input type="text" name="findName" placeholder="Enter something to find">
                    </label>
                    <input type="hidden" name="action" value="findByCloseName">
                    <input type="submit" value="Search">
                </form>
            </div>
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item ms-lg-2 me-lg-2" style="width: 120px; text-align: center">
                    <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/user/cart.jsp">Cart</a>
                </li>
                <li class="nav-item ms-lg-2 me-lg-2" style="width: 120px; text-align: center">
                    <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/user">Shop</a>
                </li>
                <li class="nav-item ms-lg-2 me-lg-2" style="width: 120px; text-align: center">
                    <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/admin">Admin Page</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<%--END OF NAVBAR--%>

<%--START OF SORTING--%>
<div align="right">
    <a href="">Monitor</a>
    <a href="">Mouse</a>
    <a href="">Laptop</a>
    <a href="">VGA</a>
    <a href="">Controller</a>
    <a href="">Ascending Price</a>
    <a href="">Descending Price</a>
</div>
<%--END OF SORTING--%>

<%--&lt;%&ndash;START OF ABOUT OUR PRODUCTS&ndash;%&gt;--%>
<%--<div class="container mt-lg-5" ALIGN="center">--%>
<%--    <h1>ABOUT OUR PRODUCTS</h1>--%>
<%--</div>--%>
<%--&lt;%&ndash;END OF ABOUT OUR PRODUCTS&ndash;%&gt;--%>

<%--START OF PRODUCTS LIST--%>
<div class="container">
    <div class="row">
        <c:forEach items="${requestScope['listGear']}" var="gear">
            <div class="col mt-lg-5">
                <div class="card" style="width: 18rem; height: 450px">
                    <a href="${pageContext.request.contextPath}/user?action=viewDetails&image=${gear.image}"><img src="${gear.image}" class="card-img-top" alt="..."></a>
                    <div class="card-body">
                        <h5 class="card-title" style="font-size: 95%">${gear.name}</h5>
                        <p class="card-text">${gear.price} đ</p>
                    </div>
                    <div class="card-footer">
                        <div class="d-flex justify-content-between">
                            <a href="${pageContext.request.contextPath}/addToCart?gearId=${gear.id}" class="btn btn-primary"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                                <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"></path>
                            </svg>
                            </a>
                            <a href="${pageContext.request.contextPath}/addToCart?gearId=${gear.id}" class="btn btn-info">Buy Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<%--END OF PRODUCTS LIST--%>

<%--START OF FOOTER--%>
<footer class="text-center text-lg-start bg-white text-muted">
    <!-- Section: Links  -->
    <section class="" style="background-color: lightgrey">
        <div class="container text-center text-md-start mt-lg-5">
            <!-- Grid row -->
            <div class="row mt-lg-5 pt-lg-5">
                <!-- Grid column -->
                <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                    <!-- Content -->
                    <h6 class="text-uppercase fw-bold mb-4">
                        <i class="fas fa-gem me-3 text-secondary"></i>GAMING GEAR CO., LTD
                    </h6>
                    <p>
                        Republic Of Gamers
                    </p>
                </div>
                <!-- Grid column -->

                <!-- Grid column -->
                <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                    <!-- Links -->
                    <h6 class="text-uppercase fw-bold mb-4">
                        Products
                    </h6>
                    <p>
                        <a href="#" class="text-reset">Gaming Gears</a>
                    </p>
                    <p>
                        <a href="#" class="text-reset">Gaming Chairs</a>
                    </p>
                    <p>
                        <a href="#" class="text-reset">Gaming PC</a>
                    </p>
                    <p>
                        <a href="#" class="text-reset">Gaming Laptop</a>
                    </p>
                </div>
                <!-- Grid column -->

                <!-- Grid column -->
                <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                    <!-- Links -->
                    <h6 class="text-uppercase fw-bold mb-4">
                        Useful links
                    </h6>
                    <p>
                        <a href="#" class="text-reset">Pricing</a>
                    </p>
                    <p>
                        <a href="#" class="text-reset">Settings</a>
                    </p>
                    <p>
                        <a href="#" class="text-reset">Orders</a>
                    </p>
                    <p>
                        <a href="#" class="text-reset">Help</a>
                    </p>
                </div>
                <!-- Grid column -->

                <!-- Grid column -->
                <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                    <!-- Links -->
                    <h6 class="text-uppercase fw-bold mb-4">Contact</h6>
                    <p><i class="fas fa-home me-3 text-secondary"></i> Ho Chi Minh City, Vietnam</p>
                    <p>
                        <i class="fas fa-envelope me-3 text-secondary"></i>
                        info@example.com
                    </p>
                    <p><i class="fas fa-phone me-3 text-secondary"></i> + 01 234 567 88</p>
                    <p><i class="fas fa-print me-3 text-secondary"></i> + 01 234 567 89</p>
                </div>
                <!-- Grid column -->
            </div>
            <!-- Grid row -->
        </div>
    </section>
    <!-- Section: Links  -->

    <!-- Copyright -->
    <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.025);">
        © 2021 Copyright:
        <a class="text-reset fw-bold" href="#">gaminggearshop.com</a>
    </div>
    <!-- Copyright -->
</footer>
<%--END OF FOOTER--%>
</body>
</html>
