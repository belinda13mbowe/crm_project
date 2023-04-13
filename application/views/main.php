<!DOCTYPE html>
<html lang="en">
    <head>
        <?php if(isset($top)){echo $top;} ?>
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
                                    <h4 class="page-title">Dashboard</h4>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="page-header-toolbar">
                                </div>
                            </div>
                        </div>
                        <!-- Page Title Header Ends-->
                        <div class="row">
                            <div class="col-md-12 grid-margin">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-lg-3 col-md-6">
                                                <div class="d-flex">
                                                    <div class="wrapper">
                                                        <h3 class="mb-0 font-weight-semibold">
															<!-- <?php if(isset($wakazi)){echo $wakazi;} ?> -->
														</h3>
                                                        <h5 class="mb-0 font-weight-medium text-primary">PROBLEMS</h5>
                                                        <!--p class="mb-0 text-muted"><?= date('M-Y'); ?></p-->
                                                    </div>
                                                    <div class="wrapper my-auto ml-auto ml-lg-4">
                                                        <i class="fa fa-users" style="color: darkorange;font-size: 2em"></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-6 mt-md-0 mt-4">
                                                <div class="d-flex">
                                                    <div class="wrapper">
                                                        <h3 class="mb-0 font-weight-semibold">
															<!-- /**  <?php if(isset($marafiki)){echo $marafiki;} ?> */ -->
														</h3>
                                                        <h5 class="mb-0 font-weight-medium text-primary">MARAFIKI</h5>
                                                    </div>
                                                    <div class="wrapper my-auto ml-auto ml-lg-4">
                                                        <i class="mdi mdi-nature-people" style="color: darkorange;font-size: 2em"></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-6 mt-md-0 mt-4">
                                                <div class="d-flex">
                                                    <div class="wrapper">
                                                        <h3 class="mb-0 font-weight-semibold">
															<!-- <?php if(isset($mikutano)){echo $mikutano;} ?> -->
														</h3>
                                                            <h6 class="mb-0 font-weight-medium text-primary">MIKUTANO</h6>
                                                    </div>
                                                    <div class="wrapper my-auto ml-auto ml-lg-4">
                                                        <i class="mdi mdi-table-large" style="color: darkorange;font-size: 2em"></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-6 mt-md-0 mt-4">
                                                <div class="d-flex">
                                                    <div class="wrapper">
                                                        <h3 class="mb-0 font-weight-semibold">
															<!-- <?php if(isset($dini)){echo $dini;} ?> -->
														</h3>
                                                        <h6 class="mb-0 font-weight-medium text-primary">NYUMBA ZA DINI</h6>
                                                    </div>
                                                    <div class="wrapper my-auto ml-auto ml-lg-4">
                                                        <i class="mdi mdi-church" style="color: darkorange;font-size: 2em"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12 grid-margin">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-lg-3 col-md-6">
                                                <div class="d-flex">
                                                    <div class="wrapper">
                                                        <h3 class="mb-0 font-weight-semibold">
															<!-- <?php if(isset($institutions)){echo $institutions;} ?> -->
														</h3>
                                                        <h5 class="mb-0 font-weight-medium text-primary">TAASISI</h5>
                                                        <!--p class="mb-0 text-muted"><?= date('M-Y'); ?></p-->
                                                    </div>
                                                    <div class="wrapper my-auto ml-auto ml-lg-4">
                                                        <i class="mdi mdi-home-city" style="color: darkorange;font-size: 2em"></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-6 mt-md-0 mt-4">
                                                <div class="d-flex">
                                                    <div class="wrapper">
                                                        <h3 class="mb-0 font-weight-semibold">
															<!-- <?php if(isset($ahadi)){echo $ahadi;} ?> -->
														</h3>
                                                        <h5 class="mb-0 font-weight-medium text-primary">AHADI</h5>
                                                    </div>
                                                    <div class="wrapper my-auto ml-auto ml-lg-4">
                                                        <i class="mdi mdi-cash-multiple" style="color: darkorange;font-size: 2em"></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-6 mt-md-0 mt-4">
                                                <div class="d-flex">
                                                    <div class="wrapper">
                                                        <h3 class="mb-0 font-weight-semibold">
															<!-- <?php if(isset($makusanyo)){echo $makusanyo;} ?> -->
														</h3>
                                                        <h6 class="mb-0 font-weight-medium text-primary">MAKUSANYO</h6>
                                                    </div>
                                                    <div class="wrapper my-auto ml-auto ml-lg-4">
                                                        <i class="mdi mdi-basket-fill" style="color: darkorange;font-size: 2em"></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-6 mt-md-0 mt-4">
                                                <div class="d-flex">
                                                    <div class="wrapper">
                                                        <h3 class="mb-0 font-weight-semibold">
															<!-- <?php if(isset($madeni)){echo $madeni;} ?> -->
														</h3>
                                                        <h6 class="mb-0 font-weight-medium text-primary">MADENI</h6>
                                                    </div>
                                                    <div class="wrapper my-auto ml-auto ml-lg-4">
                                                        <i class="mdi mdi-cash" style="color: darkorange;font-size: 2em"></i>
                                                    </div>
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
        <?php if(isset($bottom)){echo $bottom;} ?>
    </body>
</html>
