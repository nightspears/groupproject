<%-- 
    Document   : home3
    Created on : May 16, 2023, 3:00:06 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page errorPage="errorPage.jsp" %> 
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html
    lang="en"
    class="light-style layout-menu-fixed"
    dir="ltr"
    data-theme="theme-default"
    data-assets-path="assets/"
    data-template="vertical-menu-template-free"
    >
    <head>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
            />

        <title>Betrolimex</title>
         <link rel="icon" href="img/favicon.png" />   
        <meta name="description" content="" />

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet"
            />

        <!-- Icons. Uncomment required icon fonts -->
        <link rel="stylesheet" href="assets/vendor/fonts/boxicons.css" />

        <!-- Core CSS -->
        <link rel="stylesheet" href="assets/vendor/css/core.css" class="template-customizer-core-css" />
        <link rel="stylesheet" href="assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
        <link rel="stylesheet" href="assets/css/demo.css" />

        <!-- Vendors CSS -->
        <link rel="stylesheet" href="assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

        <link rel="stylesheet" href="assets/vendor/libs/apex-charts/apex-charts.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/newsManagement.css">
        <!-- Page CSS -->

        <!-- Helpers -->
        <script src="assets/vendor/js/helpers.js"></script>

        <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
        <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
        <script src="assets/js/config.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
            function showDropdown() {
                var dropdown = document.getElementById("statusDropdown");
                dropdown.style.display = "block";
            }

            function changeStatus(status) {
                $.ajax({
                    type: "POST",
                    url: "newsmanagement",
                    data: {buttonStatus: status},
                    success: function (response) {
                        // Xử lý phản hồi thành công (nếu cần)
                        location.reload(); // Tải lại trang sau khi cập nhật trạng thái
                    },
                    error: function () {
                        // Xử lý lỗi (nếu cần)
                    }
                });
            }
        </script>
    </head>

    <body>
        <!-- Layout wrapper -->
        <c:set var="account" value="${sessionScope.account}"/>
        <div class="layout-wrapper layout-content-navbar">
            <div class="layout-container">
                <!-- Menu -->

                <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
                    <div class="app-brand demo">
                        <a href="statistic.jsp" class="app-brand-link">
                            <span class="app-brand-text demo menu-text fw-bolder ms-2"><img style="width: 1.5em; margin-left: 0px;" src="img/favicon.png">
                                Betrolimex</span>

                        </a>

                        <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
                            <i class="bx bx-chevron-left bx-sm align-middle"></i>
                        </a>
                    </div>

                    <div class="menu-inner-shadow"></div>

                    <ul class="menu-inner py-1">
                        <!-- Dashboard -->
                        <li class="menu-item">
                            <a href="statistic" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-home-circle"></i>
                                <div data-i18n="Analytics">Dashboard</div>
                            </a>
                        </li>
                        <li class="menu-item">

                            <a href="javascript:void(0);" class="menu-link menu-toggle">
                                <i class="menu-icon tf-icons bx bx-layout"></i>
                                <div data-i18n="Layouts">Menu Layouts</div>
                            </a>

                            <ul class="menu-sub">

                                <li class="menu-item">

                                    <ul class="menu-sub">
                                        <c:forEach items="${sessionScope.Navigation}" var="c">
                                            <li class="menu-item<c:if test="${not empty requestScope.News}">
                                                    <c:forEach items="${requestScope.News}" var="n">
                                                        <c:if test="${n.navigationID == c.navigationID}"> active</c:if>
                                                    </c:forEach>
                                                </c:if>">
                                                <a href="changedirection?change=${c.navigationID}" class="menu-link">
                                                    <div data-i18n="Without navbar">${c.navigationName}</div>
                                                </a>
                                            </li>
                                        </c:forEach>

                                    </ul>
                                </li>

                            </ul>
                        </li>
                        <!-- Components -->
                        <li class="menu-header small text-uppercase"><span class="menu-header-text">Product Management</span></li>
                        <!-- Cards -->
                        <li class="menu-item">
                            <a href="javascript:void(0)" class="menu-link menu-toggle">
                                <i class="menu-icon tf-icons bx bx-box"></i>
                                <div data-i18n="User interface">Stock</div>
                            </a>
                            <ul class="menu-sub">
                                <li class="menu-item">
                                    <a href="<%=request.getContextPath()%>/stock" class="menu-link">
                                        <div data-i18n="AllCategory">All category</div>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="menu-item">
                            <a href="<%=request.getContextPath()%>/addproduct" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-collection"></i>
                                <div data-i18n="Basic">Add Product</div>
                            </a>
                        </li>

                        <c:if test="${account.role eq 'Admin'}">
                            <li class="menu-item">
                                <a href="<%=request.getContextPath()%>/adddiscount" class="menu-link">
                                    <i class="menu-icon tf-icons bx bx-collection"></i>
                                    <div data-i18n="Basic">Add Discount</div>
                                </a>
                            </li>
                        </c:if>
                        <li class="menu-item">
                            <a href="javascript:void(0);" class="menu-link menu-toggle">
                                <i class="menu-icon tf-icons bx bx-collection"></i>
                                <div data-i18n="Form Layouts">Manufacturer</div>
                            </a>
                            <ul class="menu-sub">
                                <li class="menu-item ">
                                    <a href="allmanufacturer" class="menu-link">
                                        <div data-i18n="Vertical Form">Manufacturer List</div>
                                    </a>
                                </li>
                                <li class="menu-item ">
                                    <a href="addmanufacturer" class="menu-link">
                                        <div data-i18n="Horizontal Form">Add Manufacturer</div>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="menu-item">
                            <a href="<%=request.getContextPath()%>/allcategory" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-collection"></i>
                                <div data-i18n="Basic">Add Category</div>
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="javascript:void(0);" class="menu-link menu-toggle">
                                <i class="menu-icon tf-icons bx bx-detail"></i>
                                <div data-i18n="Form Layouts">Warranty</div>
                            </a>
                            <ul class="menu-sub">

                                <li class="menu-item">
                                    <a href="checkwarranty" class="menu-link">
                                        <div data-i18n="Horizontal Form">Warranty list</div>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="menu-header small text-uppercase"><span class="menu-header-text">Order</span></li>
                        <li class="menu-item ">
                            <a href="<%=request.getContextPath()%>/checkorder" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-collection"></i>
                                <div data-i18n="Basic">Check Order</div>
                            </a>
                        </li>
                        <li class="menu-header small text-uppercase"><span class="menu-header-text">News Management</span></li>
                        <li class="menu-item active open ">
                            <a href="javascript:void(0);" class="menu-link menu-toggle">
                                <i class="menu-icon tf-icons bx bx-detail"></i>
                                <div data-i18n="Form Layouts">News</div>
                            </a>

                            <ul class="menu-sub">
                                <li class="menu-item ">
                                    <a href="addnews" class="menu-link">
                                        <div data-i18n="Vertical Form">Add News</div>
                                    </a>
                                </li>
                                <c:if test="${account.role eq 'Admin'}">
                                    <li class="menu-item active">
                                        <a href="newsmanagement" class="menu-link">
                                            <div data-i18n="Without navbar">News Management</div>
                                        </a>
                                    </li>
                                </ul>

                            </li>
                        </c:if>

                        <!-- Forms & Tables -->

                        <!-- Tables -->
                        <c:if test="${account.role eq 'Admin'}">
                            <li class="menu-header small text-uppercase"><span class="menu-header-text">User management</span></li>
                            <li class="menu-item ">
                                <a href="javascript:void(0);" class="menu-link menu-toggle">
                                    <i class="menu-icon tf-icons bx bx-detail"></i>
                                    <div data-i18n="Form Layouts">Employees</div>
                                </a>
                                <ul class="menu-sub">
                                    <li class="menu-item">
                                        <a href="listemployee" class="menu-link">
                                            <div data-i18n="Vertical Form">Employee List</div>
                                        </a>
                                    </li>
                                    <li class="menu-item ">
                                        <a href="addemployee" class="menu-link">
                                            <div data-i18n="Horizontal Form">Add Employee</div>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="menu-item">
                                <a href="<%=request.getContextPath()%>/listcustomer" class="menu-link">
                                    <i class="menu-icon tf-icons bx bx-detail"></i>
                                    <div data-i18n="Basic">Customer</div>
                                </a>
                            </li>
                            <li class="menu-header small text-uppercase"><span class="menu-header-text">Statistic</span></li><!-- comment -->
                            <li class="menu-item ">
                                <a href="<%=request.getContextPath()%>/customerstatistic" class="menu-link">
                                    <i class="menu-icon tf-icons bx bx-detail"></i>
                                    <div data-i18n="Basic">Customer Statistic</div>
                                </a>
                            </li>
                            <li class="menu-item">
                                <a href="<%=request.getContextPath()%>/employeestatistic" class="menu-link">
                                    <i class="menu-icon tf-icons bx bx-detail"></i>
                                    <div data-i18n="Basic">Employee Statistic</div>
                                </a>
                            </li>
                        </c:if>
                        <li class="menu-header small text-uppercase"><span class="menu-header-text">Misc</span></li>
                        <li class="menu-item">
                            <a href="<%=request.getContextPath()%>/employeechat" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-support"></i>
                                <div data-i18n="Support">Support</div>
                            </a>
                        </li>
                    </ul>
                </aside>
                <!-- / Menu -->

                <!-- Layout container -->
                <div class="layout-page">
                    <!-- Navbar -->

                    <nav
                        class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
                        id="layout-navbar"
                        >
                        <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
                            <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                                <i class="bx bx-menu bx-sm"></i>
                            </a>
                        </div>

                        <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
                            <!-- Search -->
                            <div class="navbar-nav align-items-center">
                                <div class="nav-item d-flex align-items-center">
                                    <i class="bx bx-search fs-4 lh-0"></i>
                                    <input type="text" oninput="searchByName(this)" name="searchString" id="searchInput" class="form-control border-0 shadow-none" placeholder="Search..." aria-label="Search..."/>
                                </div>
                            </div>
                            <!-- /Search -->

                            <ul class="navbar-nav flex-row align-items-center ms-auto">
                                <!-- Place this tag where you want the button to render. -->

                                <!-- User -->
                                <li class="nav-item navbar-dropdown dropdown-user dropdown">
                                    <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                                        <div class="avatar avatar-online">
                                            <img src="data:image/jpeg/png/jpg;base64,${account.encodedImage}" alt class="w-px-40 h-auto rounded-circle" />
                                        </div>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                            <a class="dropdown-item" href="employeeprofile">
                                                <div class="d-flex">
                                                    <div class="flex-shrink-0 me-3">
                                                        <div class="avatar avatar-online">
                                                            <img src="data:image/jpeg/png/jpg;base64,${account.encodedImage}" alt class="w-px-40 h-auto rounded-circle" />
                                                        </div>
                                                    </div>
                                                    <div class="flex-grow-1">
                                                        <span class="fw-semibold d-block">${account.firstname} ${account.lastname}</span>
                                                        <small class="text-muted">${account.role}</small>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <div class="dropdown-divider"></div>
                                        </li>
                                        <li>
                                            <a class="dropdown-item" href="employeeprofile">
                                                <i class="bx bx-user me-2"></i>
                                                <span class="align-middle">My Profile</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a class="dropdown-item" href="#">
                                                <i class="bx bx-cog me-2"></i>
                                                <span class="align-middle">Settings</span>
                                            </a>
                                        </li>
                                        
                                        <li>
                                            <div class="dropdown-divider"></div>
                                        </li>
                                        <li>
                                            <a class="dropdown-item" href="logout">
                                                <i class="bx bx-power-off me-2"></i>
                                                <span class="align-middle">Log Out</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <!--/ User -->
                            </ul>
                        </div>
                    </nav>

                    <!-- / Navbar -->

                    <!-- Content wrapper -->
                    <div class="content-wrapper">
                        <!-- Content -->
                        <div class="container-xxl flex-grow-1 container-p-y">
                            <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Menu Layouts /</span> News</h4>
                            <div class="card">
                                <h5 class="card-header">News</h5>
                                <div class="table-responsive text-nowrap">
                                    <div class="wrapper">
                                        <div class="card">

                                            <table class="table table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>Index</th>
                                                        <th>News ID</th>
                                                        <th>News Title</th>
                                                        <th>News Heading</th>
                                                        <th>Created Date</th>
                                                        <th>Modified Date</th>
                                                        <th>Created By</th>
                                                        <th>Modified By</th>
                                                        <th>Status</th>
                                                        <th>Approved Date</th>
                                                        <th>Change Status</th>


                                                    </tr>
                                                </thead>
                                                <tbody id="table-data" class="table-border-bottom-0">

                                                    <c:forEach items="${requestScope.listnew}" var="c" varStatus="index">
                                                        <tr>
                                                            <td>${index.index+1}</td>
                                                            <td>${c.getNewID()}</td>
                                                            <td>${c.getNewsTitle()}</td>
                                                            <td >${c.getNewsHeading()}</td>
                                                            <td><fmt:formatDate value = "${c.getCreatedDate()}"  pattern="dd-MM-yyyy"/></td>
                                                            <td><fmt:formatDate value = "${c.getModifiedDate()}"  pattern="dd-MM-yyyy"/></td>

                                                            <c:forEach items="${requestScope.listEmployee}" var="e" >
                                                                <c:if test="${c.createdBy eq e.id}">
                                                                    <td>${e.firstname} ${e.lastname}</td>
                                                                </c:if>
                                                                <c:if test="${c.modifiedBy eq e.id}">
                                                                    <td>${e.firstname} ${e.lastname}</td>
                                                                </c:if>
                                                            </c:forEach>
                                                            <td>
                                                                <c:if test="${c.getNewsStatus() == 1}">
                                                                    <button class="btn-primary btn" style="background-color: green"
                                                                            >Approved</button>
                                                                </c:if>
                                                                <c:if test="${c.getNewsStatus()== 2}">
                                                                    <button class="btn-primary btn"  style="background-color: blue"
                                                                            >Pending</button>
                                                                </c:if>
                                                                <c:if test="${c.getNewsStatus() == 3}">
                                                                    <button class="btn-primary btn" style="background-color: red"
                                                                            >Cancel</button>
                                                                </c:if>

                                                            </td>


                                                            <td>
                                                                <fmt:formatDate value = "${c.getApprovedDate()}"  pattern="dd-MM-yyyy"/></td>
                                                            <td>
                                                                <div class="dropdown">
                                                                    <a href="#" 
                                                                       data-bs-toggle="modal" 
                                                                       data-bs-target="#basicModal${c.getNewID()}">
                                                                        <i class="bx bx-edit-alt me-1 "></i>
                                                                    </a>
                                                                    <form action="editnews" method="post">
                                                                        <input type="hidden" name="id" value="${c.newID}"/>
                                                                        <div class="modal fade" id="basicModal${c.newID}" tabindex="-1" aria-hidden="true">
                                                                            <div class="modal-dialog" role="document">
                                                                                <div class="modal-content">
                                                                                    <div class="modal-header">
                                                                                        <h5 class="modal-title" id="exampleModalLabel1">Edit news</h5>
                                                                                        <button
                                                                                            type="button"
                                                                                            class="btn-close"
                                                                                            data-bs-dismiss="modal"
                                                                                            aria-label="Close"
                                                                                            ></button>
                                                                                    </div>
                                                                                    <div class="modal-body">
                                                                                        <div class="row">
                                                                                            <div class="col mb-3">
                                                                                                <label for="nameBasic" class="form-label">News Title</label>
                                                                                                <input type="text" name="newsTitle" id="nameBasic${c.newID}" class="form-control"  value="${c.newsTitle}"/>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row g-2">
                                                                                            <div class="col mb-0">
                                                                                                <label for="emailBasic" class="form-label">News Heading</label>
                                                                                                <input type="text" name="newsHeading" id="emailBasic${c.newID}" class="form-control"  value="${c.newsHeading}"/>
                                                                                            </div>

                                                                                        </div>
                                                                                        <div class="row g-2">
                                                                                            <div class="col mb-0">
                                                                                                <label for="emailBasic" class="form-label">News Content</label>
                                                                                                <input type="text" name="newsContent" id="emailBasic${c.newID}" class="form-control"  value="${c.newsContent}"/>
                                                                                            </div>

                                                                                        </div>
                                                                                        <div class="row g-2">
                                                                                            <div class="col mb-0">
                                                                                                <label for="emailBasic" class="form-label">News Status</label></br>
                                                                                                <input type="radio" name="newsStatus" id="emailBasic${c.newID}" value="1">
                                                                                                <label for="approved">Approved</label><br>
                                                                                                <input type="radio" name="newsStatus" id="emailBasic${c.newID}" value="2">
                                                                                                <label for="pending">Pending</label><br>
                                                                                                <input type="radio" name="newsStatus" id="emailBasic${c.newID}" value="3">
                                                                                                <label for="cancel">Cancel</label>
                                                                                            </div>

                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="modal-footer">
                                                                                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                                                                                            Close
                                                                                        </button>
                                                                                        <button type="submit" class="btn btn-primary">Save changes</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </form>
                                                                    <a href="#" onclick="deleteDiscount(${c.getNewID()})"
                                                                       ><i class="bx bx-trash me-1"></i></a
                                                                    >
                                                                    <script>

                                                                        function deleteDiscount(id)
                                                                        {
                                                                            var result = confirm("Are you sure?");
                                                                            if (result)
                                                                            {
                                                                                window.location.href = "deletenews4?newsID=${c.getNewID()}";
                                                                            }
                                                                        }

                                                                    </script>

                                                                </div>
                                                            </td>


                                                        </tr>
                                                    </c:forEach>


                                                </tbody>
                                            </table>


                                        </div>

                                    </div>

                                </div>
                            </div>

                        </div>
                        <span><a href="<%=request.getContextPath()%>/newsmanagement" ><button class="col-2 btn btn-primary"><i class="fa fa-file-excel-o"></i> Export to Excel</button></a></span>

                        <div class="content-backdrop fade"></div>
                    </div>

                </div>

                <!-- Content wrapper -->
            </div>
            <!-- / Layout page -->
        </div>
        <!-- Core JS -->

        <!-- build:js assets/vendor/js/core.js -->
        <script src="assets/vendor/libs/jquery/jquery.js"></script>
        <script src="assets/vendor/libs/popper/popper.js"></script>
        <script src="assets/vendor/js/bootstrap.js"></script>
        <script src="assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

        <script src="assets/vendor/js/menu.js"></script>
        <!-- endbuild -->

        <!-- Vendors JS -->
        <script src="assets/vendor/libs/apex-charts/apexcharts.js"></script>

        <!-- Main JS -->
        <script src="assets/js/main.js"></script>

        <!-- Page JS -->
        <script src="assets/js/dashboards-analytics.js"></script>

        <!-- Place this tag in your head or just before your close body tag. -->
        <script async defer src="https://buttons.github.io/buttons.js"></script>
    </body>
</html>

