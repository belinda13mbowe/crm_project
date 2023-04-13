var print_data = function(type) {
    var data = "type=" + type;
    //alert(data);
    $.ajax({
        url: $("#base_url").html() + "Printing/prepare",
        type: "post",
        dataType: "json",
        data: data,
        cache: false,
        success: function (response) {
            if (response.code===1) {
                window.open($("#base_url").html() + "Printing",'_blank');
            }
        },
        error: function (e) {
            console.warn(e.responseText);
        }
    });
};