var save_data = function() {
    var mode = parseInt($("#txt_mode").val());
    //alert(mode);
    if (mode === 1) { save_rafiki(); }
    if (mode === 0) { update_rafiki(); }
};

var show_add_rafiki = function(){
    clear_frm_rafiki();
    $("#pan_ahadi").show();
    $("#txt_mode").val(1);
    $("#md_title").html("Sajili Rafiki");
    $("#modal_add_rafiki").modal("show");
};


var save_rafiki = function() {
    $("#sv").hide();
    var form = document.getElementById("frm_rafiki");
    var data = new FormData(form);
    $.ajax({
        url: $("#base_url").html() + "Marafiki/add",
        type: "post",
        dataType: "json",
        data: data,
        contentType: false,
        processData: false,
        cache: false,
        success: function (response) {
            if (response !== null) {
                if (response.code === 1) {
                    $("#modal_add_Marafiki").modal("hide");
                    Swal.fire({ title: 'Mrejesho!', text: 'taarifa  zimehifadhiwa kikamilifu.', icon: 'success'}).then(function(){window.location.reload();});
                } else {
                    $("#modal_add_Marafiki").modal("hide");
                    Swal.fire({ title: 'Error!', text: response.desc, icon: 'error'}).then(function(){$("#modal_add_Marafiki").modal("show");$("#sv").show();});
                }
            }
        },
        error: function (err) {
            console.warn(err.responseText);
        }
    });
};

var clear_frm_rafiki = function() {
    $("#txt_name").val("");
    $("#txt_phone").val("");
    $("#txt_location").val("");
    $("#txt_ahadi").val("");
};


var show_edit_rafiki = function(rafiki_id) {
    $("#txt_mode").val(0);
    clear_frm_rafiki();
    $.ajax({
        url: $("#base_url").html() + "Marafiki/fetch",
        type: "post",
        dataType: "json",
        data: "rafiki_id=" + rafiki_id,
        cache: false,
        success: function (response) {
            if (response !== null) {
                $("#txt_name").val(response.name);
                $("#txt_phone").val(response.phone);
                $("#txt_location").val(response.makazi);
                $("#txt_ahadi").val(response.ahadi);
                $("#txt_rafiki_id").val(rafiki_id);
                $("#txt_payments").val(response.payment);
                if(response.payment > 0){$("#pan_ahadi").hide();}
                $("#md_title").html("Hariri Taarifa");
                $("#modal_add_rafiki").modal("show");
            }
        },
        error: function (e) {
            console.warn(e.responseText);
        }
    });
};


var update_rafiki = function() {
    $("#sv").hide();
    var form = document.getElementById("frm_rafiki");
    var data = new FormData(form);
    $.ajax({
        url: $("#base_url").html() + "Marafiki/update",
        type: "post",
        dataType: "json",
        data: data,
        contentType: false,
        processData: false,
        cache: false,
        success: function (response) {
            if (response !== null) {
                if (response.code === 1) {
                    $("#modal_add_rafiki").modal("hide");
                    Swal.fire({ title: 'Mrejesho!', text: 'Taarifa zimehaririwa kikamilifu.', icon: 'success'}).then(function(){window.location.reload();});
                } else {
                    $("#modal_add_rafiki").modal("hide");
                    Swal.fire({ title: 'Error!', text: response.desc, icon: 'error'}).then(function(){$("#modal_add_rafiki").modal("show");$("#sv").show();});
                }
            }
        },
        error: function (err) {
            console.warn(err.responseText);
        }
    });
};



var show_add_payments = function(rafiki_id) {
    $.ajax({
        url: $("#base_url").html() + "Marafiki/fetch",
        type: "post",
        dataType: "json",
        data: "rafiki_id=" + rafiki_id,
        cache: false,
        success: function (response) {
            if (response !== null) {
                $("#txt_debt").val(response.deni);
                $("#txt_paid").val(response.paid);
                $("#txt_rafiki").val(rafiki_id);
                $("#modal_add_payment").modal("show");
            }
        },
        error: function (e) {
            console.warn(e.responseText);
        }
    });
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
    var payment_cat = 2;
    var rid = $("#txt_rafiki").val();
    var deni = accounting.unformat($("#txt_debt").val());
    var amt = accounting.unformat($("#txt_amt").val());
    var balance = accounting.unformat($("#txt_balance").val());
    var paid = accounting.unformat($("#txt_tot_paid").val());

    var data = "payment_cat=" + payment_cat + "&rid=" + rid + "&deni=" + deni + "&amt=" + amt + "&balance=" + balance + "&paid=" + paid;

    //alert(data);
    $.ajax({
        url: $("#base_url").html() + "Marafiki/add_payments",
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

var show_payments_details = function(rid,cat) {
    $.ajax({
        url: $("#base_url").html() + "Marafiki/get_payments",
        type: "post",
        dataType: "json",
        data: "rid=" + rid + "&cat=" + cat,
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
