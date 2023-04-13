<!DOCTYPE html>
<html lang="en">
    <head>
        <?php if(isset($top)){echo $top;} ?>
        <!-- third party css -->
        <link href="<?= base_url() ?>public/assets/datatables/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <link href="<?= base_url() ?>public/assets/datatables/css/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <link href="<?= base_url() ?>public/assets/datatables/css/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <link href="<?= base_url() ?>public/assets/datatables/css/select.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <style>
            #data td{padding: 10px 4px !important;font-size: 11px !important;height:auto !important;}
            #data th{padding: 10px 4px !important;font-size: 12px !important;height: auto !important; font-weight: bold}
            .control-label{font-size: 0.9em !important;}
            table.dataTable.dtr-inline.collapsed>tbody>tr[role="row"]>td:first-child:before, table.dataTable.dtr-inline.collapsed>tbody>tr[role="row"]>th:first-child:before {
                top: 6px;
                left: 2px;
            }
            #data_info{font-size: 0.7em !important;}
            .paginate_button{font-size: 0.7em !important;padding: 0 !important;}
            .dt-buttons{padding: 0 !important;}
            .dt-button{margin: 0 !important;padding: 0 !important;}
            #data_length{font-size: 0.7em !important;}
            #data_length select{font-size: 0.9em !important;}
            .form-control.form-control-sm {
                padding: 0.25rem 2.6em;
            }
            #data_filter input{padding: 0.25rem 1em;!important;}
            .control-label{font-size: 0.7em !important;}
        </style>
    </head>
    <body>
        <div class="container-srcoller">
            <?php if(isset($nav)){echo $nav;} ?>
            <div class="container-fluid page-body-wrapper">
                <?php if(isset($mnu)){echo $mnu;} ?>
                <div class="main-panel">
                    <div class="content-wrapper">
                        <!-- Page Title Header Starts-->
                        <div class="row page-title-header">
                            <div class="col-12">
                                <div class="page-header">
                                    <span style="font-size:1em !important;font-weight: bold">WATUMIAJI</span>
                                    <a href="<?= base_url() ?>Users/logout" style="margin-right:20px;font-weight:900;float:right;color: red" class="mdi mdi-logout" title="Logout"></a>
                                    <span style="float: right !important;margin-right: 20px;cursor: pointer;font-size:1em;font-weight: 900" onclick="show_change_pwd()"><i class="mdi mdi-textbox-password text-danger" title="Change Password"></i></span>
                                    <?php if($this->session->userdata("user_role_id") == 1){
                                        echo "<span style=\"float: right !important;margin-right: 20px;cursor: pointer\" onclick=\"show_add_user()\">
                                                    <i class=\"fa fa-plus-square-o\" title=\"Sajili Mtumiaji\" style=\"font-weight: bold !important;color:rgb(242,112,39);\"></i>
                                                </span>";
                                    } ?>
                                </div>
                            </div>
                        </div>
                        <!-- Page Title Header Ends-->
                        <div class="row">
                            <div class="col-lg-12 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="table-responsive">
                                                    <table id="data" class="table table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                                        <thead>
                                                            <tr>
                                                                <th style="color: transparent;width:15px !important;">+</th>
                                                                <th>Name</th>
                                                                <th>Phone</th>
                                                                <th>Email</th>
                                                                <th>Address</th>
                                                                <th>Status</th>
                                                                <th>Action</th>
                                                            </tr>
                                                        </thead>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <span id="base_url" style="display: none"><?php echo base_url();?></span>
                    <!-- content-wrapper ends -->
                    <!-- partial:partials/_footer.html -->
                    <?php if(isset($footer)){echo $footer;} ?>
                    <!-- partial -->
                </div>
                <!-- main-panel ends -->
            </div>
            <!-- page-body-wrapper ends -->
        </div>
        <!-- container-srcoller -->


        <!-- Add Customer Modal -->
        <div class="modal fade" id="modal_add_user" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <form id="frm_user" method="post" action="javascript:save_data()">
                    <input type="hidden" id="txt_mode">
                    <input type="hidden" id="txt_user_id" name="txt_user_id">
                    <div class="modal-content">
                        <div class="modal-header" style="background-color: #05101e;color: white;padding: 8px 20px !important;">
                            <h6 class="modal-title" id="md_title"></h6>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="opacity: 1;padding: 20px 20px">
                                <span aria-hidden="true" style="color: red;font-size: 0.6em;" class="fa fa-window-close"></span>
                            </button>
                        </div>
                        <div class="modal-body" style="padding: 0 !important; background-color: #05101e;margin: 0 !important;border-radius: 0 0 3px 3px;">
                            <div class="col-md-12 grid-margin stretch-card" style="padding: 0 !important;height: 100% !important;">
                                <div class="card" style="padding: 0 !important;">
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label class="control-label" style="font-size: 0.7em;font-weight: bold">User Name</label>
                                            <input type="text" id="txt_name" name="txt_name" placeholder="user full name" class="form-control" required autocomplete="off">
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">User Role</label>
                                            <select type="select" id="txt_role" name="txt_role" class="form-control" required style="padding-top: 4px">
                                                <?php if(isset($roles)){echo $roles;} ?>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">User Email</label>
                                            <input type="email" id="txt_email" name="txt_email" placeholder="user@samplemail.com" class="form-control" required autocomplete="off">
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">User Phone</label>
                                            <input type="text" id="txt_phone" name="txt_phone" placeholder="000000000" class="form-control" required autocomplete="off">
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">User Address</label>
                                            <input type="text" id="txt_add" name="txt_add" placeholder="user full address" class="form-control" required autocomplete="off">
                                        </div>
                                        <div class="form-group" id="pan_pwd">
                                            <label class="control-label">User Password</label>
                                            <input type="password" id="txt_pwd" name="txt_pwd" placeholder="********" class="form-control" required autocomplete="off">
                                        </div>
                                        <div class="form-group" id="pan_con_pwd">
                                            <label class="control-label">Confirm Password</label>
                                            <input type="password" id="txt_con_pwd" name="txt_con_pwd" placeholder="********" class="form-control" required autocomplete="off">
                                        </div>
                                        <div class="form-group">
                                            <button type="Submit" class="btn btn-primary" id="sv" style="float: right;margin: 0 !important;">Submit</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>


        <!-- Change password Modal -->
        <div class="modal fade" id="modal_change_pwd" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <form id="frm_pwd" method="post" action="javascript:change_pwd()">
                    <div class="modal-content">
                        <div class="modal-header" style="background-color: #05101e;color: white;padding: 8px 20px !important;">
                            <h6 class="modal-title" id="md_title">Change Password</h6>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="opacity: 1;padding: 20px 20px">
                                <span aria-hidden="true" style="color: red;font-size: 0.6em;" class="fa fa-window-close"></span>
                            </button>
                        </div>
                        <div class="modal-body" style="padding: 0 !important; background-color: #05101e;margin: 0 !important;border-radius: 0 0 3px 3px">
                            <div class="col-md-12 grid-margin stretch-card" style="padding: 0 !important;height: 100% !important;">
                                <div class="card" style="padding: 0 !important;">
                                    <div class="card-body">
                                        <div class="form-group" id="pan_pwd">
                                            <label class="control-label">Enter New Password</label>
                                            <input type="password" id="txt_pwd_change" name="txt_pwd_change" placeholder="********" class="form-control" required autocomplete="off">
                                        </div>
                                        <div class="form-group" id="pan_con_pwd">
                                            <label class="control-label">Confirm New Password</label>
                                            <input type="password" id="txt_con_pwd_change" name="txt_con_pwd_change" placeholder="********" class="form-control" required autocomplete="off">
                                        </div>
                                        <div class="form-group">
                                            <button type="Submit" class="btn btn-primary" id="sv" style="float: right;margin: 0 !important;">Submit</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>


        <?php if(isset($bottom)){echo $bottom;} ?>
        <script src="<?= base_url();?>public/assets/data/users.js"></script>

        <!-- Required datatable js -->
        <script src="<?= base_url() ?>public/assets/datatables/js/jquery.dataTables.min.js"></script>
        <script src="<?= base_url() ?>public/assets/datatables/js/dataTables.bootstrap4.min.js"></script>

        <!-- Buttons examples -->
        <script src="<?= base_url() ?>public/assets/datatables/js/dataTables.buttons.min.js"></script>
        <script src="<?= base_url() ?>public/assets/datatables/js/datatable.reorder.min.js"></script>
        <script src="<?= base_url() ?>public/assets/datatables/js/datatable.buttons.min.js"></script>
        <script src="<?= base_url() ?>public/assets/datatables/js/datatable.responsive.min.js"></script>
        <script src="<?= base_url() ?>public/assets/datatables/js/datatable.pdfmake.min.js"></script>
        <script src="<?= base_url() ?>public/assets/datatables/js/datatable.buttons.print.min.js"></script>
        <script src="<?= base_url() ?>public/assets/datatables/js/datatable.buttons.html5.min.js"></script>
        <script src="<?= base_url() ?>public/assets/datatables/js/datatable.buttons.flash.min.js"></script>
        <script src="<?= base_url() ?>public/assets/datatables/js/datatable.jszip.min.js"></script>
        <script src="<?= base_url() ?>public/assets/datatables/js/datatable.vfs_fonts.js"></script>

        <!-- Responsive examples -->
        <script src="<?= base_url() ?>public/assets/datatables/js/dataTables.responsive.min.js"></script>
        <script src="<?= base_url() ?>public/assets/datatables/js/responsive.bootstrap4.min.js"></script>

        <script src="<?= base_url() ?>public/assets/datatables/js/dataTables.keyTable.min.js"></script>
        <script src="<?= base_url() ?>public/assets/datatables/js/dataTables.select.min.js"></script>
        <script>
            var table = null;

            $(document).ready(function() {
                table = $("#data").DataTable({
                    pageLength: 15,
                    language: {search: "", searchPlaceholder: "Search..."},
                    responsive: true,
                    serverSide:true,
                    searching:true,
                    ordering:false,
                    processing:true,
                    ajax: {url: $("#base_url").html() + 'Users/data', type: 'post'},
                    columns: [
                        {data: "extension", defaultContent: ''},
                        {data: "name", defaultContent: ''},
                        {data: "phone", defaultContent: ''},
                        {data: "email", defaultContent: ''},
                        {data: "address", defaultContent: ''},
                        {data: "status", defaultContent: ''},
                        {data: "action", defaultContent: ''}
                    ]
                });

                $('.dataTables_filter input').addClass("form-control").css("font-size", "12px");

                $.fn.dataTable.ext.errMode = 'none';

                $('#data').on('error.dt', function (e, settings, techNote, message) {
                    console.log('Data error: ', message);
                });
            });
        </script>
    </body>
</html>