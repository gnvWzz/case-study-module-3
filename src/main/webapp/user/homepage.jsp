<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 09/01/2023
  Time: 15:42
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

<%--START OF CAROUSEL--%>
<div class="container">
  <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
      <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
      <div class="carousel-item active" data-interval="3000">
        <img src="https://www.homelane.com/blog/wp-content/uploads/2020/10/shutterstock_1430140070.jpg" class="d-block w-100" alt="...">
        <div class="carousel-caption d-none d-md-block">
          <h5>Welcome to GAMING GEAR SHOP</h5>
          <p>REPUBLIC OF GAMERS</p>
        </div>
      </div>
      <div class="carousel-item" data-interval="3000">
        <img src="https://i.ytimg.com/vi/lP14CoCshlQ/maxresdefault.jpg" class="d-block w-100" alt="...">
        <div class="carousel-caption d-none d-md-block">
          <h5>Welcome to GAMING GEAR SHOP</h5>
          <p>REPUBLIC OF GAMERS</p>
        </div>
      </div>
      <div class="carousel-item" data-interval="3000">
        <img src="https://leaguefeed.net/wp-content/uploads/2022/01/best-gaming-setups.jpeg" class="d-block w-100" alt="...">
        <div class="carousel-caption d-none d-md-block">
          <h5>Welcome to GAMING GEAR SHOP</h5>
          <p>REPUBLIC OF GAMERS</p>
        </div>
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>
</div>
<%--END OF CAROUSEL--%>

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
