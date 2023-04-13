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
            #data td{padding: 10px 4px;font-size: 11px !important;height:auto !important;}
            #data th{padding: 10px 4px;font-size: 12px !important;height: auto !important; font-weight: bold}
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
            .text-right{font-weight: 600;}
            .crock{
                font-weight: 600 !important;font-size: 0.7em !important;
                padding: 4px 10px !important;text-align: left;
                border-bottom: 1px solid black;
            }
            .dile{
                font-weight: 600;font-size: 0.7em !important;
                text-align: Right;padding:4px 10px !important;
            }
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
                                    <span style="font-size:1em !important;font-weight: bold">MARAFIKI</span>
                                    <span style="float: right !important;margin-right: 20px;cursor: pointer" onclick="show_add_rafiki()">
                                        <i class="fa fa-plus-square-o text-success" title="Sajili Rafiki" style="font-weight: bold !important;"></i>
                                    </span>
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
                                                                <th>JINA</th>
                                                                <th>SIMU</th>
                                                                <th>MAKAZI</th>
                                                                <th>AHADI</th>
                                                                <th>MALIPO</th>
                                                                <th>DENI</th>
                                                                <th>CHAGUZI</th>
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


        <!-- Add Mkazi Modal -->
        <div class="modal fade" id="modal_add_rafiki" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <form id="frm_rafiki" method="post" action="javascript:save_data()">
                    <input type="hidden" id="txt_mode">
                    <input type="hidden" id="txt_rafiki_id" name="txt_rafiki_id">
                    <input type="hidden" id="txt_payments" name="txt_payments">
                    <div class="modal-content">
                        <div class="modal-header" style="background-color: #05101e;color: white;padding: 8px 20px !important;">
                            <h6 class="modal-title" id="md_title"></h6>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="opacity: 1;padding: 20px 20px">
                                <span aria-hidden="true" style="color: red;font-size: 0.6em;" class="fa fa-window-close"></span>
                            </button>
                        </div>
                        <div class="modal-body" style="padding: 0 !important; background-color: rgb(30,0,0);margin: 0 !important;border-radius: 0 0 3px 3px">
                            <div class="col-md-12 grid-margin stretch-card" style="padding: 0 !important;height: 100% !important;">
                                <div class="card" style="padding: 0 !important;">
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label class="control-label">Jina</label>
                                            <input type="text" class="form-control" id="txt_name" name="txt_name"  autocomplete="off" required>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Namba ya simu</label>
                                            <input type="text" class="form-control" id="txt_phone" name="txt_phone"  autocomplete="off" required>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Sehemu</label>
                                            <input type="text" class="form-control" id="txt_location" name="txt_location" autocomplete="off"  required>
                                        </div>
                                        <div class="form-group" id="pan_ahadi">
                                            <label class="control-label">Ahadi</label>
                                            <input type="text" class="form-control" id="txt_ahadi" name="txt_ahadi"  autocomplete="off" required style="font-weight: 600">
                                        </div>
                                        <div class="form-group">
                                            <button type="Submit" class="btn btn-primary" id="sv" style="float: right;margin: 0 !important;">Wasilisha</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>


        <!-- Add Payment Modal -->
        <div class="modal fade" id="modal_add_payment" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <form id="frm_payments" method="post" action="javascript:add_payments()">
                    <input type="hidden" id="txt_rafiki" name="txt_rafiki">
                    <div class="modal-content">
                        <div class="modal-header" style="background-color: #05101e;color: white;padding: 8px 20px !important;">
                            <h6 class="modal-title">Ingiza Malipo</h6>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="opacity: 1;padding: 20px 20px">
                                <span aria-hidden="true" style="color: red;font-size: 0.6em;" class="fa fa-window-close"></span>
                            </button>
                        </div>
                        <div class="modal-body" style="padding: 0 !important; background-color: rgb(30,0,0);margin: 0 !important;border-radius: 0 0 3px 3px">
                            <div class="col-md-12 grid-margin stretch-card" style="padding: 0 !important;height: 100% !important;">
                                <div class="card" style="padding: 0 !important;">
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label class="control-label">Malipo</label>
                                            <input type="text" class="form-control" id="txt_paid" name="txt_paid" required readonly style="background-color: white">
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Deni</label>
                                            <input type="text" class="form-control" id="txt_debt" name="txt_debt" required readonly style="background-color: white">
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Kiasi</label>
                                            <input type="text" class="form-control" id="txt_amt" name="txt_amt"  autocomplete="off" required onkeyup="process_payments()">
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Jumla ya Malipo</label>
                                            <input type="text" class="form-control" id="txt_tot_paid" name="txt_tot_paid" required readonly style="background-color: white">
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Baki</label>
                                            <input type="text" class="form-control" id="txt_balance" name="txt_balance" required readonly style="background-color: white">
                                        </div>
                                        <div class="form-group">
                                            <button type="Submit" class="btn btn-primary" id="sv" style="float: right;margin: 0 !important;">Wasilisha</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>


        <div id="myNav" class="overlay" style="height: calc(100%);">
            <div class="overlay-content">
                <div class="nicknet">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-2"></div>
                            <div class="col-md-10 lion" id="nav_heading">Taarifa za Malipo
                                <span style="float: right;color:red;cursor: pointer;" onclick="closeNav()"><i class="fa fa-window-close"></i></span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2"></div>
                            <div class="col-md-10" style="padding: 0 !important;">
                                <div class="table-responsive" style="background-color: white;">
                                    <table style="width: 100%;" border="1">
                                        <tr>
                                            <td class="crock">Date</td>
                                            <td class="dile">DENI</td>
                                            <td class="dile">KIASI</td>
                                            <td class="dile">BAKI</td>
                                        </tr>
                                        <tbody id="payments"></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <?php if(isset($bottom)){echo $bottom;} ?>
        <script src="<?= base_url();?>public/assets/data/marafiki.js"></script>
        <script src="<?= base_url();?>public/assets/js/main/accounting.js"></script>
        <script src="<?= base_url();?>public/assets/js/main/jquery.number.min.js"></script>

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
        <script type="text/javascript">
            $(document).ready(function(){
                $("#txt_debt").number(true,2);
                $("#txt_amt").number(true,2);
                $("#txt_balance").number(true,2);
                $("#txt_paid").number(true,2);
                $("#txt_tot_paid").number(true,2);
            });
        </script>
        <script>
            var table = null;

            $(document).ready(function() {
                table = $("#data").DataTable({
                    pageLength: 12,
                    language: {search: "", searchPlaceholder: "Search..."},
                    responsive: true,
                    serverSide:true,
                    searching:true,
                    ordering:false,
                    processing:true,
                    ajax: {url: $("#base_url").html() + 'Marafiki/data', type: 'post'},
                    columns: [
                        {data: "extension", defaultContent: ''},
                        {data: "name", defaultContent: ''},
                        {data: "phone", defaultContent: ''},
                        {data: "location", defaultContent: ''},
                        {data: "ahadi", defaultContent: '',className:'text-right'},
                        {data: "malipo", defaultContent: '',className:'text-right'},
                        {data: "deni", defaultContent: '',className:'text-right'},
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