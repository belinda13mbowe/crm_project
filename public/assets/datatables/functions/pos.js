$(document).ready(function() {
    $('#tebo').DataTable( {
        paging:   false,
        ordering: false,
        searching: true,
        select: false,
        info:     true,
        scrollY: ((45/100)*screen.height),
        responsive: {
            breakpoints: [
                {name: 'bigdesktop', width: Infinity},
                {name: 'meddesktop', width: 1480},
                {name: 'smalldesktop', width: 1280},
                {name: 'medium', width: 1188},
                {name: 'tabletl', width: 1024},
                {name: 'btwtabllandp', width: 848},
                {name: 'tabletp', width: 768},
                {name: 'mobilel', width: 480},
                {name: 'mobilep', width: 320}
            ]
        },

        dom: 'Bfrtip',
        buttons: [
            {
                extend: 'excel',
                className: 'btn btn-sm btn-warning',
                text: '<i class="fa fa-file-excel-o text-default"></i>',
                titleAttr: 'Excel',
                footer: false,
                header: true,
                messageBottom:'',
                title: 'annie agency banking - POS report',
                filename: 'banking_pos',
                customize: function(xlsx) {
                    var sheet = xlsx.xl.worksheets['sheet1.xml'];
                    $('row:eq(0) c', sheet).attr('s','50'); //align tittle message
                    $('row:eq(1) c', sheet).attr('s','50'); //align top message
                    $('row:last c', sheet).attr('s','50'); //align bottom message
                }
            },

            {
                extend: 'pdfHtml5',
                className: 'btn btn-sm btn-default',
                text: '<i class="fa fa-file-pdf-o text-danger"></i>',
                titleAttr: 'PDF',
                footer: true,
                header: true,
                messageBottom:'',
                title: 'annie agency banking - POS report',
                filename: 'banking_pos',
                orientation: 'potrait',
                pageSize: 'A4',
                customize: function ( doc ) {
                    doc.content[1].table.widths = [
                        '30%',
                        '30%',
                        '30%',
                        '10%'
                    ];
                    doc.defaultStyle.alignment = 'left';
                    doc.styles.tableHeader.alignment = 'left';
                    doc.defaultStyle.fontSize = '9';
                    doc.styles.message.alignment = 'left';
                }
            },

            {
                extend: 'print',
                className: 'btn btn-sm btn-default',
                text: '<i class="fa fa-print text-info"></i>',
                titleAttr: 'Print'
            }
        ]
    } );
} );