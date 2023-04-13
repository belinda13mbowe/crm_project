var save_data = function() {
    var mode = parseInt($("#txt_mode").val());
    //alert(mode);
    if (mode === 1) { save_mkazi(); }
    if (mode === 0) { update_mkazi(); }
};

var show_add_mkazi = function(){
    clear_frm_mkazi();
    $("#pan_ahadi").show();
    $("#txt_mode").val(1);
    $("#md_title").html("Sajili Mkazi");
    $("#modal_add_mkazi").modal("show");
};


var get_monitors = function(zone) {
    $.ajax({
        url: $("#base_url").html() + "Wakazi/get_monitors",
        type: "post",
        dataType: "json",
        data: "zone=" + zone,
        cache: false,
        success: function (response) {
            if (response !== null) {
                $("#txt_monitor").html(response.content);
            }
        },
        error: function (e) {
            console.warn(e.responseText);
        }
    });
};



var save_mkazi = function() {
    $("#sv").hide();
    var form = document.getElementById("frm_mkazi");
    var data = new FormData(form);
    $.ajax({
        url: $("#base_url").html() + "Wakazi/add",
        type: "post",
        dataType: "json",
        data: data,
        contentType: false,
        processData: false,
        cache: false,
        success: function (response) {
            if (response !== null) {
                if (response.code === 1) {
                    $("#modal_add_wakazi").modal("hide");
                    Swal.fire({ title: 'Mrejesho!', text: 'taarifa za mkazi zimehifadhiwa.', icon: 'success'}).then(function(){window.location.reload();});
                } else {
                    $("#modal_add_wakazi").modal("hide");
                    Swal.fire({ title: 'Error!', text: response.desc, icon: 'error'}).then(function(){$("#modal_add_wakazi").modal("show");$("#sv").show();});
                }
            }
        },
        error: function (err) {
            console.warn(err.responseText);
        }
    });
};

var clear_frm_mkazi = function() {
    $("#txt_name").val("");
    $("#txt_phone").val("");
    $("#txt_zone").val("");
    $("#txt_shina").val("");
    $("#txt_monitor").val("");
    $("#txt_ahadi").val("");
};


var show_edit_mkazi = function(mkazi_id) {
    $("#txt_mode").val(0);
    clear_frm_mkazi();
    $.ajax({
        url: $("#base_url").html() + "Wakazi/fetch",
        type: "post",
        dataType: "json",
        data: "mkazi_id=" + mkazi_id,
        cache: false,
        success: function (response) {
            if (response !== null) {
                $("#txt_name").val(response.name);
                $("#txt_phone").val(response.phone);
                $("#txt_zone").val(response.zone);
                $("#txt_shina").val(response.zone);
                $("#txt_monitor").val(response.monitor);
                $("#txt_ahadi").val(response.ahadi);
                $("#txt_payments").val(response.payment);
                $("#txt_mkazi_id").val(mkazi_id);
                if(response.payment > 0){$("#pan_ahadi").hide();}
                $("#md_title").html("Hariri taarisha");
                $("#modal_add_mkazi").modal("show");
            }
        },
        error: function (e) {
            console.warn(e.responseText);
        }
    });
};


var update_mkazi = function() {
    $("#sv").hide();
    var form = document.getElementById("frm_mkazi");
    var data = new FormData(form);
    $.ajax({
        url: $("#base_url").html() + "Wakazi/update",
        type: "post",
        dataType: "json",
        data: data,
        contentType: false,
        processData: false,
        cache: false,
        success: function (response) {
            if (response !== null) {
                if (response.code === 1) {
                    $("#modal_add_mkazi").modal("hide");
                    Swal.fire({ title: 'Mrejesho!', text: 'Taarifa zimehaririwa kikamilifu.', icon: 'success'}).then(function(){window.location.reload();});
                } else {
                    $("#modal_add_mkazi").modal("hide");
                    Swal.fire({ title: 'Error!', text: response.desc, icon: 'error'}).then(function(){$("#modal_add_mkazi").modal("show");$("#sv").show();});
                }
            }
        },
        error: function (err) {
            console.warn(err.responseText);
        }
    });
};



var show_add_payments = function(mkazi_id) {
    $.ajax({
        url: $("#base_url").html() + "Wakazi/fetch",
        type: "post",
        dataType: "json",
        data: "mkazi_id=" + mkazi_id,
        cache: false,
        success: function (response) {
            if (response !== null) {
                $("#txt_debt").val(response.deni);
                $("#txt_paid").val(response.paid);
                $("#txt_mkazi").val(mkazi_id);
                $("#modal_add_payment").modal("show");
            }
        },
        error: function (e) {
            console.warn(e.responseText);
        }
    });
};

var showChangePassword = function(){
    $("#modal_change_pwd").modal("show");
};

var changePassword = function(){
    var pwd = $("#txt_cpwd").val();
    var cpwd = $("#txt_con_cpwd").val();
    if(pwd == cpwd){
        $.ajax({
            url: $("#base_url").html() + "Wakazi/changePwd",
            type: "post",
            dataType: "json",
            data: "pwd=" + pwd,
            cache: false,
            success: function (response) {
                if (response !== null) {
                    if (response.code === 1) {
                        $("#modal_change_pwd").modal("hide");
                        Swal.fire({ title: 'Changed!', text: 'Password changed successfully.', icon: 'success'}).then(function(){window.location.href=$("#base_url").html() + "panel/Login";});
                    } else {
                        Swal.fire({ title: 'Failed!', text: response.desc, icon: 'error'});
                    }
                }
            },
            error: function (err) {
                console.warn(err.responseText);
            }
        });
    }else {
        Swal.fire({ title: 'Error!', text: 'Password does not match!', icon: 'error'});
    }
};

var clear_pay = function(){
    $("#txt_tot_paid").val("");
    $("#txt_balance").val("");
    $("#txt_amt").val("");
};

var process_payments = function(){
    var debt = accounting.unformat($("#txt_debt").val());
    var paid = accounting.unformat($("#txt_paid").val());
    var amt = accounting.unformat($("#txt_amt").val());

    if(amt <= debt){
        $("#txt_tot_paid").val(accounting.format((parseFloat(paid) + parseFloat(amt)),2));
        $("#txt_balance").val(accounting.format((parseFloat(debt) - parseFloat(amt)),2));
    }else{
        Swal.fire({ title: 'Mrejesho!', text: 'Kiasi kimevuka ahadi husika', icon: 'error'});
        clear_pay();
    }
};

var add_payments = function(){
    var payment_cat = 1;
    var mid = $("#txt_mkazi").val();
    var deni = accounting.unformat($("#txt_debt").val());
    var amt = accounting.unformat($("#txt_amt").val());
    var balance = accounting.unformat($("#txt_balance").val());
    var paid = accounting.unformat($("#txt_tot_paid").val());

    var data = "payment_cat=" + payment_cat + "&mid=" + mid + "&deni=" + deni + "&amt=" + amt + "&balance=" + balance + "&paid=" + paid;

    //alert(data);
    $.ajax({
        url: $("#base_url").html() + "Wakazi/add_payments",
        type: "post",
        dataType: "json",
        data: data,
        cache: false,
        success: function (response) {
            if (response !== null) {
                if (response.code === 1) {
                    $("#modal_add_payment").modal("hide");
                    Swal.fire({ title: 'Mrejesho!', text: 'Malipo yamehifadhiwa Kikamilifu.', icon: 'success'}).then(function(){window.location.reload();});
                } else {
                    Swal.fire({ title: 'Mrejesho!', text: response.desc, icon: 'error'});
                }
            }
        },
        error: function (err) {
            console.warn(err.responseText);
        }
    });
};

var show_payments_details = function(mid,cat) {
    $.ajax({
        url: $("#base_url").html() + "Wakazi/get_payments",
        type: "post",
        dataType: "json",
        data: "mid=" + mid + "&cat=" + cat,
        cache: false,
        success: function (response) {
            if (response !== null) {
                $("#payments").html(response.content);
                openNav();
            }
        },
        error: function (e) {
            console.warn(e.responseText);
        }
    });
};
