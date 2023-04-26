<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 06/01/2023
  Time: 08:11
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

<section class="h-100 h-custom" style="background-color: #eee;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col">
        <div class="card">
          <div class="card-body p-4">

            <div class="row">

              <div class="col-lg-7">
                <h5 class="mb-3"><a href="${pageContext.request.contextPath}/user" class="text-body"><i
                        class="fas fa-long-arrow-alt-left me-2"></i>Continue shopping</a></h5>
                <hr>

<%--               START OF MAIN CONTENTS--%>
                <c:forEach  items="${sessionScope['order'].getItems()}" var="item">
                  <div class="card mb-3">
                    <div class="card-body">
                      <div class="d-flex justify-content-between">
                        <div class="d-flex flex-row align-items-center">
                          <div>
                            <img
                                    src="${item.getGear().getImage()}"
                                    class="img-fluid rounded-3" alt="Shopping item" style="width: 65px;">
                          </div>
                          <div class="ms-3">
                            <h5>${item.getGear().getName()}</h5>
                            <p class="small mb-0">${item.getGear().getDescription()}</p>
                          </div>
                        </div>
                        <div class="d-flex flex-row align-items-center">
                          <div style="width: 50px;">
                            <h5 class="fw-normal mb-0">${item.getQuantity()}</h5>
                          </div>
                          <div style="width: 80px;">
                            <h5 class="mb-0">${item.getGear().getPrice()}</h5>
                          </div>
                          <a href="#" style="color: #cecece;"><i class="fas fa-trash-alt"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </c:forEach>
<%--                END OF MAIN CONTENTS--%>

              </div>
              <div class="col-lg-5">

                <div class="card bg-primary text-white rounded-3">
                  <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                      <h5 class="mb-0">Card details</h5>
                      <img src="https://media.istockphoto.com/id/1087531642/vector/male-face-silhouette-or-icon-man-avatar-profile-unknown-or-anonymous-person-vector.jpg?s=170667a&w=0&k=20&c=2BM-cif-x0i68L_JU3mchnl9NFhUIGEAWg003bUyn5k="
                           class="img-fluid rounded-3" style="width: 45px;" alt="Avatar">
                    </div>

                    <p class="small mb-2">Card type</p>
                    <a href="#!" type="submit" class="text-white"><i
                            class="fab fa-cc-mastercard fa-2x me-2"></i></a>
                    <a href="#!" type="submit" class="text-white"><i
                            class="fab fa-cc-visa fa-2x me-2"></i></a>
                    <a href="#!" type="submit" class="text-white"><i
                            class="fab fa-cc-amex fa-2x me-2"></i></a>
                    <a href="#!" type="submit" class="text-white"><i class="fab fa-cc-paypal fa-2x"></i></a>

                    <form class="mt-4">
                      <div class="form-outline form-white mb-4">
                        <input type="text" id="typeName" class="form-control form-control-lg" siez="17"
                               placeholder="" />
                        <label class="form-label" for="typeName">""</label>
                      </div>

                      <div class="form-outline form-white mb-4">
                        <input type="text" id="" class="form-control form-control-lg" siez="17"
                               placeholder="" minlength="19" maxlength="19" />
                        <label class="form-label" for="">""</label>
                      </div>

                      <div class="row mb-4">
                        <div class="col-md-6">
                          <div class="form-outline form-white">
                            <input type="text" id="typeExp" class="form-control form-control-lg"
                                   placeholder="" size="7" id="exp" minlength="7" maxlength="7" />
                            <label class="form-label" for="typeExp">""</label>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-outline form-white">
                            <input type="password" id="typeText" class="form-control form-control-lg"
                                   placeholder="" size="1" minlength="3" maxlength="3" />
                            <label class="form-label" for="typeText">""</label>
                          </div>
                        </div>
                      </div>

                    </form>

                    <hr class="my-4">

                    <div class="d-flex justify-content-between mb-4">
                      <h3 class="mb-2">Total:</h3>
                      <h3 class="mb-2">${sessionScope['order'].getTotal()} đ</h3>
                    </div>

                    <button type="button" class="btn btn-info btn-block btn-lg">
                      <div class="d-flex justify-content-between">
                        <span>Checkout <i class="fas fa-long-arrow-alt-right ms-2"></i></span>
                      </div>
                    </button>

                  </div>
                </div>

              </div>

            </div>

          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<%--END OF MAIN CONTENTS--%>

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
