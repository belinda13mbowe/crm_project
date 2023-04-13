<?php
/**
 
 */

function bottom(){
    $url = base_url();
    return "
        <!-- plugins:js -->
        <script src=\"{$url}public/assets/vendors/js/vendor.bundle.base.js\"></script>
        <script src=\"{$url}public/assets/vendors/js/vendor.bundle.addons.js\"></script>
        <!-- endinject -->
        <!-- Plugin js for this page-->
        <!-- End plugin js for this page-->
        <!-- inject:js -->
        <script src=\"{$url}public/assets/js/shared/off-canvas.js\"></script>
        <script src=\"{$url}public/assets/js/shared/misc.js\"></script>
        <!-- endinject -->
        <!-- Custom js for this page-->
        <script src=\"{$url}public/assets/js/main/dashboard.js\"></script>
        <!-- End custom js for this page-->
        <script src=\"{$url}public/assets/js/shared/jquery.cookie.js\" type=\"text/javascript\"></script>
        <script src=\"{$url}public/assets/datepicker/js/datepicker.min.js\"></script>
        <script src=\"{$url}public/assets/datepicker/dtp/js/datepicker.js\"></script>
        <script src=\"{$url}public/assets/sweetalert2/package/dist/sweetalert2.js\"></script>
        <script src=\"{$url}public/assets/data/common.js\"></script>
    ";
}
