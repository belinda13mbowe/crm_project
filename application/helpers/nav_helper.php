<?php
/**
 
 */

function nav(){
    $url = base_url();
    return"
        <!-- partial:partials/_navbar.html -->
        <nav class=\"navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex flex-row\">
            <div class=\"text-center navbar-brand-wrapper d-flex align-items-top justify-content-center\">
                <a class=\"navbar-brand brand-logo\" href=\"{$url}Main\">
                    <img src=\"{$url}public/assets/images/logo.png\" alt=\"logo\" /> </a>
                <a class=\"navbar-brand brand-logo-mini\" href=\"{$url}Main\">
                    <img src=\"{$url}public/assets/images/logo-mini.png\" alt=\"logo\" /> </a>
            </div>
            <div class=\"navbar-menu-wrapper d-flex align-items-center\">
                <div style=\"text-align: center;width: 100%\">
                    <span style=\"color:Black;font-family: sans-serif;\">MAKONGO DONATIONS</span>
                </div>
                <ul class=\"navbar-nav ml-auto\">
                    <li class=\"nav-item dropdown d-none d-xl-inline-block user-dropdown\">
                        <a class=\"nav-link dropdown-toggle\" id=\"UserDropdown\" href=\"{$url}public/#\" data-toggle=\"dropdown\" aria-expanded=\"false\">
                            <img class=\"img-xs rounded-circle\" src=\"{$url}public/assets/images/faces/face8.jpg\" alt=\"Profile image\"> </a>
                        <div class=\"dropdown-menu dropdown-menu-right navbar-dropdown\" aria-labelledby=\"UserDropdown\">
                            <div class=\"dropdown-header text-center\">
                                <img class=\"img-md rounded-circle\" src=\"{$url}public/assets/images/faces/face8.jpg\" alt=\"Profile image\">
                                <p class=\"mb-1 mt-3 font-weight-semibold\">System Admin</p>
                                <p class=\"font-weight-light text-muted mb-0\">admin@gmail.com</p>
                            </div>
                            <a class=\"dropdown-item\">Upload Profile Picture<i class=\"dropdown-item-icon ti-dashboard\"></i></a>
                            <!--a class=\"dropdown-item\" href=\"{$url}Users/logout\">Sign Out<i class=\"dropdown-item-icon ti-power-off\"></i></a-->
                        </div>
                    </li>
                </ul>
                <button class=\"navbar-toggler navbar-toggler-right d-lg-none align-self-center\" type=\"button\" data-toggle=\"offcanvas\">
                    <span class=\"mdi mdi-menu\"></span>
                </button>
            </div>
        </nav>
        <!-- partial -->
    ";
}
