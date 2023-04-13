var login = function() {
    $.ajax({
        type: "post",
        url: $("#url").html() + "Users/login",
        data: 'identity='+ $("#txt_identity").val() +'&pwd='+ $("#txt_pwd").val(),
        dataType: "json",
        cache: false,
        success: function(response) {
            if (response.content==="success") {
                window.location.href=$("#url").html() + "Main";
            } else {
                Swal.fire({ title: 'Login Failed!', text: 'Invalid user name or password.', icon: 'error'});
            }
        },
        error:function(e){console.warn(e.responseText);}
    });
};

var save_data = function() {
    var mode = parseInt($("#txt_mode").val());
    //alert(mode);
    if (mode === 1) { save_user(); }
    if (mode === 0) { update_user(); }
};

var show_add_user = function(){
    clear_frm_user();
    password("",true);
    $("#txt_mode").val(1);
    $("#md_title").html("Add User");
    $("#modal_add_user").modal("show");
};

var hide_add_user = function(){
    $("#sv").show();
};

var password = function(display,required) {
    $("#pan_pwd").css("display",display);
    $("#txt_pwd").prop("required",required);
    $("#pan_con_pwd").css("display",display);
    $("#txt_con_pwd").prop("required",required);
};


var save_user = function() {
    $("#sv").hide();
    var form = document.getElementById("frm_user");
    var data = new FormData(form);
    if ($("#txt_pwd").val() === $("#txt_con_pwd").val()) {
        $.ajax({
            url: $("#base_url").html() + "Users/add",
            type: "post",
            dataType: "json",
            data: data,
            contentType: false,
            processData: false,
            cache: false,
            success: function (response) {
                if (response !== null) {
                    if (response.code === 1) {
                        $("#modal_add_user").modal("hide");
                        Swal.fire({ title: 'Saved!', text: 'User details saved.', icon: 'success'}).then(function(){window.location.reload();});
                    } else {
                        $("#modal_add_user").modal("hide");
                        Swal.fire({ title: 'Error!', text: response.desc, icon: 'error'}).then(function(){$("#modal_add_user").modal("show");$("#sv").show();});
                    }
                }
            },
            error: function (err) {
                console.warn(err.responseText);
            }
        });
    } else {
        $("#modal_add_user").hide();
        Swal.fire({ title: 'Error!', text: 'Password does not match!', icon: 'error'}).then(function(){$("#modal_add_user").modal("show");});

    }
};

var clear_frm_user = function() {
    $("#txt_name").val("");
    $("#txt_phone").val("");
    $("#txt_email").val("");
    $("#txt_role").val("");
    $("#txt_add").val("");
    $("#txt_pwd").val("");
    $("#txt_con_pwd").val("");
};

var show_edit_user = function(user_id) {
    $("#txt_mode").val(0);
    clear_frm_user();
    password("none",false);
    $.ajax({
        url: $("#base_url").html() + "Users/fetch",
        type: "post",
        dataType: "json",
        data: "user_id=" + user_id,
        cache: false,
        success: function (response) {
            if (response !== null) {
                $("#txt_name").val(response.name);
                $("#txt_email").val(response.email);
                $("#txt_phone").val(response.phone);
                $("#txt_role").val(response.role_id);
                $("#txt_add").val(response.add);
                $("#txt_user_id").val(user_id);
                $("#md_title").html("Edit User");
                $("#modal_add_user").modal("show");
            }
        },
        error: function (e) {
            console.warn(e.responseText);
        }
    });
};


var update_user = function() {
    $("#sv").hide();
    var form = document.getElementById("frm_user");
    var data = new FormData(form);
    $.ajax({
        url: $("#base_url").html() + "Users/update",
        type: "post",
        dataType: "json",
        data: data,
        contentType: false,
        processData: false,
        cache: false,
        success: function (response) {
            if (response !== null) {
                if (response.code === 1) {
                    $("#modal_add_user").modal("hide");
                    Swal.fire({ title: 'Update!', text: 'User details Update.', icon: 'success'}).then(function(){window.location.reload();});
                } else {
                    $("#modal_add_user").modal("hide");
                    Swal.fire({ title: 'Error!', text: response.desc, icon: 'error'}).then(function(){$("#modal_add_user").modal("show");$("#sv").show();});
                }
            }
        },
        error: function (err) {
            console.warn(err.responseText);
        }
    });
};

var show_change_pwd = function(){
    $("#modal_change_pwd").modal("show");
};

var change_pwd = function(){
    var pwd = $("#txt_pwd_change").val();
    var cpwd = $("#txt_con_pwd_change").val();
    if(pwd == cpwd){
        $.ajax({
            url: $("#base_url").html() + "Users/changePwd",
            type: "post",
            dataType: "json",
            data: "pwd=" + pwd,
            cache: false,
            success: function (response) {
                if (response !== null) {
                    if (response.code === 1) {
                        $("#modal_change_pwd").modal("hide");
                        Swal.fire({ title: 'Changed!', text: 'Password changed successfully.', icon: 'success'}).then(function(){window.location.href=$("#base_url").html() + "Login";});
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
        Swal.fire({ title: 'Error!', text: 'Password mismatch!', icon: 'error'});
    }
};

var deactivate_user = function(uid) {
    swal.fire({
        title: "User Deactivation",
        text: "Are you sure you want to deactivate this user?",
        type: 'warning',
        icon: 'info',
        showCancelButton: true,
        confirmButtonColor: '#36c6d3',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes',
        cancelButtonText: 'Cancel'
    }).then(function(result){
        if(result.value){
            $.ajax({
                url: $("#base_url").html() + "Users/deactivate",
                type: "post",
                dataType: "json",
                data: "uid=" + uid,
                cache: false,
                success: function (response) {
                    if (response !== null) {
                        if (response.code === 1) {
                            Swal.fire({ title: 'Deactivated!', text: 'User deactivated.', icon: 'success'}).then(function(){window.location.reload();});
                        } else {
                            Swal.fire({ title: 'Error!', text: response.desc, icon: 'error'});
                        }
                    }
                },
                error: function (err) {
                    console.warn(err.responseText);
                }
            });
        }else if(result.dismiss === 'cancel'){
            swal.fire("User Deactivation", "Process cancelled", "info");
        }

    });
};



var activate_user = function(uid) {
    swal.fire({
        title: "User Activation",
        text: "Are you sure you want to activate this user?",
        type: 'warning',
        icon: 'info',
        showCancelButton: true,
        confirmButtonColor: '#36c6d3',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes',
        cancelButtonText: 'Cancel'
    }).then(function(result){
        if(result.value){
            $.ajax({
                url: $("#base_url").html() + "Users/activate",
                type: "post",
                dataType: "json",
                data: "uid=" + uid,
                cache: false,
                success: function (response) {
                    if (response !== null) {
                        if (response.code === 1) {
                            Swal.fire({ title: 'Activated!', text: 'User activated.', icon: 'success'}).then(function(){window.location.reload();});
                        } else {
                            Swal.fire({ title: 'Error!', text: response.desc, icon: 'error'});
                        }
                    }
                },
                error: function (err) {
                    console.warn(err.responseText);
                }
            });
        }else if(result.dismiss === 'cancel'){
            swal.fire("User Activation", "Process cancelled", "info");
        }

    });
};