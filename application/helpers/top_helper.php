<?php
/**
 
 */

function top(){
    $url = base_url();
    return"
        <!-- Required meta tags -->
        <meta charset=\"utf-8\">
        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">
        <title>Makongo Donations</title>
        <!-- plugins:css -->
        <link rel=\"stylesheet\" href=\"{$url}public/assets/vendors/iconfonts/mdi/css/materialdesignicons.min.css\">
        <link rel=\"stylesheet\" href=\"{$url}public/assets/vendors/iconfonts/ionicons/dist/css/ionicons.css\">
        <link rel=\"stylesheet\" href=\"{$url}public/assets/vendors/iconfonts/flag-icon-css/css/flag-icon.min.css\">
        <link rel=\"stylesheet\" href=\"{$url}public/assets/vendors/css/vendor.bundle.base.css\">
        <link rel=\"stylesheet\" href=\"{$url}public/assets/vendors/css/vendor.bundle.addons.css\">
        <link rel=\"stylesheet\" href=\"{$url}public/assets/fonts/fontawesome/css/font-awesome.min.css\">
        <link rel=\"stylesheet\" href=\"{$url}public/assets/css/shared/style.css\">
        <link rel=\"stylesheet\" href=\"{$url}public/assets/datepicker/css/datepicker.min.css\">
        <link rel=\"stylesheet\" href=\"{$url}public/assets/datepicker/dtp/css/datepicker.css\">
        <link rel=\"stylesheet\" href=\"{$url}public/assets/sweetalert2/package/dist/sweetalert2.css\">
        
        <!-- Layout styles -->
        <link rel=\"stylesheet\" href=\"{$url}public/assets/css/main/style.css\">
        <link rel=\"stylesheet\" href=\"{$url}public/assets/css/common.css\">
        <!-- End Layout styles -->
        <link rel=\"shortcut icon\" href=\"{$url}public/assets/images/logo-mini.png\" />
    ";
}
