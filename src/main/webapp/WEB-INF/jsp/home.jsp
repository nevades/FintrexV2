<%--
    Document   : home
    Created on : Nov 28, 2023, 3:39:05 PM
    Author     : Neva
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <link rel="icon" href="files/images/fav.ico" type="image/x-icon">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <%@include file="jspf/header.jspf" %>
        <style>
            /*            #firstv2 {
                            width: auto;
                            table-layout: fixed;
                        }
            
                        .table-responsive {
                            overflow-x: auto;
                            max-width: 100%;
                        }
            
                        .card {
                            width: 100%;
                        }*/

            .placeholder {
                cursor: auto !important;
                background-color: #ffffff !important;
            }
            td, th {
                white-space: nowrap;
                overflow: hidden;
            }
            .blue {
                color: #0691FF !important;
            }
            .green {
                color: #00D64E !important;
            }
            .red {
                color: #DD374F !important;
            }
            .green-up-arrow {
                color: #00D64E !important;
            }
            .red-down-arrow {
                color: #DD374F !important;
            }
            .right {
                text-align: right !important;
            }
            .table-bordered td, .table-bordered th {
                border: 1px solid #000000 !important;
            }
        </style>
    </head>

    <body style="background-color: #303549">
        <div style="padding: 70px; padding-top: 45px;">
            <div id="bigDiv" class="card" style="width: auto;">
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <h1 class="m-0" style="display: inline;">Fintrex V2 Report</h1>
                        </div>
                        <div class="col">
                            <img class="pull-right" src="files/images/logo.png" alt="Company Logo" style="width: 150px; height: auto;">
                        </div>
                    </div>
                    <h5 class="card-title">Select Parameter</h5>
                    <p class="card-text"></p>
                    <select id="param" class="swal2-select">
                        <option selected value="officer">Officer Wise</option>
                        <option value="cluster">Cluster Wise</option>
                    </select>

                    <div id="col" style="display: none;">
                        <h5 class="card-title">Select Collection Officer</h5>
                        <p class="card-text"></p>
                        <select id="col_officers" class="swal2-select">
                        </select>
                        <button type="button" class="btn btn-primary" id="show">Show Data</button>
                    </div>

                    <div id="clu" style="display: none;">
                        <h5 class="card-title">Select Cluster</h5>
                        <p class="card-text"></p>
                        <select id="cluster" class="swal2-select">
                        </select>
                        <button type="button" class="btn btn-primary" id="show2">Show Data</button>
                    </div>
                </div>
            </div>
        </div>

        <div id="hidden" style="display: none; padding: 5px;">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col">
                            <img src="files/images/logo.png" alt="Company Logo" style="width: 150px; height: auto;">
                        </div>
                        <div class="col">
                            <h6 class="m-0" style="display: inline;">Collection Officer:</h6>
                            <h6 class="m-0" id="name" style="display: inline; margin-left: 5px;">John Doe</h6>
                        </div>
                        <div class="col">
                            <h6 class="m-0" style="display: inline;">Report Generated On:</h6>
                            <h6 class="m-0" id="dateTimeContainer" style="display: inline; margin-left: 5px;"></h6>
                        </div>
                        <div class="col">
                            <button type="button" class="btn btn-danger pull-right" id="reset">Home</button>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover" id="firstv2">
                            <thead id="customHeader">
                                <tr>
                                    <th colspan="1"></th>
                                    <th colspan="2">2023-11-01</th>
                                    <th colspan="3">Bucket Improvement</th>
                                    <th colspan="3">Bucket Stabilization</th>
                                    <th colspan="3">Resolution Target</th>
                                    <th colspan="3">NPL Reversal</th>
                                    <th colspan="3">NPL Probable</th>
                                </tr>
                            </thead>
                            <thead class="table-dark">
                                <tr>
                                    <th>Bucket</th>
                                    <th>#</th>
                                    <th>Exposure</th>
                                    <th>#</th>
                                    <th>Exposure</th>
                                    <th>% Change</th>
                                    <th>#</th>
                                    <th>Exposure</th>
                                    <th>% Change</th>
                                    <th>#</th>
                                    <th>Exposure</th>
                                    <th>% Change</th>
                                    <th>#</th>
                                    <th>Exposure</th>
                                    <th>% Change</th>
                                    <th>#</th>
                                    <th>Exposure</th>
                                    <th>% Change</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Above 3</td>
                                    <td id="3">0</td>
                                    <td id="3e" class="right">0</td>
                                    <td id="3d">0</td>
                                    <td id="3de" class="right">0</td>
                                    <td id="3ip" class="right">0</td>
                                    <td id="3b">0</td>
                                    <td id="3be" class="right">0</td>
                                    <td id="3cie" class="right">0</td>
                                    <td id="30">0</td>
                                    <td id="3ze" class="right">0.00</td>
                                    <td id="3zep" class="right">0</td>
                                    <td id="p31">0</td>
                                    <td id="p32" class="right">0</td>
                                    <td id="p33" class="right">0</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>2 - 3</td>
                                    <td id="2">0</td>
                                    <td id="2e" class="right">0</td>
                                    <td id="2d">0</td>
                                    <td id="2de" class="right">0</td>
                                    <td id="2ip" class="right">0</td>
                                    <td id="2b">0</td>
                                    <td id="2be" class="right">0</td>
                                    <td id="2cie" class="right">0</td>
                                    <td id="20">0</td>
                                    <td id="2ze" class="right">0.00</td>
                                    <td id="2zep" class="right">0</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td id="r23">0</td>
                                    <td id="r22" class="right">0</td>
                                    <td id="r21" class="right">0</td>
                                </tr>
                                <tr>
                                    <td>1 - 2</td>
                                    <td id="1">0</td>
                                    <td id="1e" class="right">0</td>
                                    <td id="1d">0</td>
                                    <td id="1de" class="right">0</td>
                                    <td id="1ip" class="right">0</td>
                                    <td id="1b">0</td>
                                    <td id="1be" class="right">0</td>
                                    <td id="1cie" class="right">0</td>
                                    <td id="10">0</td>
                                    <td id="1ze" class="right">0.00</td>
                                    <td id="1zep" class="right">0</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>0 - 1</td>
                                    <td id="0">0</td>
                                    <td id="0e" class="right">0</td>
                                    <td id="0d">0</td>
                                    <td id="0de" class="right">0</td>
                                    <td id="0ip" class="right">0</td>
                                    <td id="0b">0</td>
                                    <td id="0be" class="right">0</td>
                                    <td id="0cie" class="right">0</td>
                                    <td id="00">0</td>
                                    <td id="0ze" class="right">0.00</td>
                                    <td id="0zep" class="right">0</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>0</td>
                                    <td id="99">0</td>
                                    <td id="99e" class="right">0</td>
                                    <td id="99d"></td>
                                    <td id="99de" class="right"></td>
                                    <td id="99ip" class="right"></td>
                                    <td id="99b">0</td>
                                    <td id="99be" class="right">0</td>
                                    <td id="99cie" class="right">0</td>
                                    <td id="990"></td>
                                    <td id="99ze" class="right"></td>
                                    <td id="99zep" class="right"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="table-dark">Total</td>
                                    <td class="table-dark" id="totalHash">0</td>
                                    <td class="table-dark right" id="totalExp">0</td>
                                    <td class="table-dark" id="totalRed">0</td>
                                    <td id="tde" class="table-dark right">0</td>
                                    <td class="table-dark right" id="tip">0</td>
                                    <td class="table-dark" id="mt">0</td>
                                    <td class="table-dark right" id="met">0</td>
                                    <td class="table-dark right" id="tcie">0</td>
                                    <td class="table-dark" id="tbt0">0</td>
                                    <td id="tze" class="table-dark right">0</td>
                                    <td class="table-dark right" id="rtce">0</td>
                                    <td id="t1" class="table-dark">0</td>
                                    <td id="t2" class="table-dark right">0</td>
                                    <td id="t3" class="table-dark right">0</td>
                                    <td id="t4" class="table-dark">0</td>
                                    <td id="t5" class="table-dark right">0</td>
                                    <td id="t6" class="table-dark right">0</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>


        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable" style="max-width: none; padding: 25px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Contract Information</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="card">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover" id="contractv2">
                                        <thead class="table-dark">
                                            <tr>
                                                <th>Finance NO</th>
                                                <th>Product</th>
                                                <th>Branch</th>
                                                <th>Full Name</th>
                                                <th>NIC NO</th>
                                                <th>Age</th>
                                                <th>Application Status</th>
                                                <th>Exposure</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button class="btn btn-primary" id="downloadTableButton">Download Table</button>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="jspf/scripts.jspf" %>
        <script type="text/javascript" src="files/js/slimselect.js"></script>
        <script type="text/javascript" src="files/js/datatables.min.js"></script>
        <script type="text/javascript" src="files/js/sweetalert2.js"></script>
        <script type="text/javascript" src="files/js/func.js"></script>
        <script type="text/javascript" src="files/js/autoNumeric.js"></script>
        <script type="text/javascript" src="files/js/dataTables.responsive.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script>
        </script>
        <script>
            $(document).ready(function () {

                function convertToCSV(table) {
                    var csv = [];
                    var rows = table.find('tr');

                    for (var i = 0; i < rows.length; i++) {
                        var row = [], cols = $(rows[i]).find('td, th');

                        for (var j = 0; j < cols.length; j++)
                            row.push(cols[j].innerText);

                        csv.push(row.join(','));
                    }

                    return csv.join('\n');
                }

                function downloadCSV(csv, filename) {
                    var csvFile;

                    var downloadLink = document.createElement('a');

                    csvFile = new Blob([csv], {type: 'text/csv'});
                    downloadLink.href = window.URL.createObjectURL(csvFile);
                    downloadLink.download = filename;

                    document.body.appendChild(downloadLink);
                    downloadLink.click();

                    document.body.removeChild(downloadLink);
                }

                $('#downloadTableButton').click(function () {
                    var table = $('#contractv2');
                    var csv = convertToCSV(table);
                    var filename = 'contract_data.csv';
                    downloadCSV(csv, filename);
                });
                function hash(url, prefix) {
                    fetch(url, {
                        method: 'POST',
                        body: new URLSearchParams({
                            user: $(prefix).val()
                        })
                    }).then((res) => res.json()).then((data) => {
                        for (var i = 0; i < data.length; i++) {
                            if (data[i].ageRange === 3) {
                                $('#3').html(data[i].ageCount);
                                $('#3e').html(data[i].totalExposure.toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2}));
                                h3e = data[i].totalExposure;
                            } else if (data[i].ageRange === 2) {
                                $('#2').html(data[i].ageCount);
                                $('#2e').html(data[i].totalExposure.toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2}));
                                h2e = data[i].totalExposure;
                            } else if (data[i].ageRange === 1) {
                                $('#1').html(data[i].ageCount);
                                $('#1e').html(data[i].totalExposure.toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2}));
                                h1e = data[i].totalExposure;
                            } else if (data[i].ageRange === 0) {
                                $('#0').html(data[i].ageCount);
                                $('#0e').html(data[i].totalExposure.toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2}));
                                h0e = data[i].totalExposure;
                            } else if (data[i].ageRange === 99) {
                                $('#99').html(data[i].ageCount);
                                $('#99e').html(data[i].totalExposure.toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2}));
                                h99e = data[i].totalExposure;
                            } else if (data[i].ageRange === null) {
                                $('#totalHash').html(data[i].ageCount);
                                expTotal = data[i].totalExposure;
                                $('#totalExp').html(data[i].totalExposure.toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2}));
                            }
                        }

                        if (prefix === '#col_officers') {
                            blue('project/blue-count', '#col_officers');
                            green('project/green-count', '#col_officers');
                            red('project/red-count', '#col_officers');
                        } else if (prefix === '#cluster') {
                            blue('project/blue-count-cluster', '#cluster');
                            green('project/green-count-cluster', '#cluster');
                            red('project/red-count-cluster', '#cluster');
                        }
                    });
                }

                function blue(url, prefix) {
                    fetch(url, {
                        method: 'POST',
                        body: new URLSearchParams({
                            user: $(prefix).val()
                        })
                    }).then((res) => res.json()).then((data) => {
                        for (var i = 0; i < data.length; i++) {
                            $('#3b').html(data[i].age3Count);
                            $('#2b').html(data[i].age2Count);
                            $('#1b').html(data[i].age1Count);
                            $('#0b').html(data[i].age0Count);
                            $('#99b').html(data[i].age99Count);
                            $('#3be').html(data[i].exposureThree.toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2}));
                            $('#2be').html(data[i].exposureTwo.toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2}));
                            $('#1be').html(data[i].exposureOne.toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2}));
                            $('#0be').html(data[i].exposureZero.toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2}));
                            $('#99be').html(data[i].exposureNinenine.toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2}));

                            blueTotalExp = data[i].totalExposure;
                            $('#met').html(data[i].totalExposure.toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2}));
                            updatePercentage('3cie', data[i].exposureThree, h3e);
                            updatePercentage('2cie', data[i].exposureTwo, h2e);
                            updatePercentage('1cie', data[i].exposureOne, h1e);
                            updatePercentage('0cie', data[i].exposureZero, h0e);
                            updatePercentage('99cie', data[i].exposureNinenine, h99e);
                        }

                        $('#mt').html(parseFloat($('#3b').html()) + parseFloat($('#2b').html()) + parseFloat($('#1b').html()) + parseFloat($('#0b').html()) + parseFloat($('#99b').html()));

                        updatePercentage('tcie', blueTotalExp, expTotal);
                    });
                }

                function red(url, prefix) {
                    fetch(url, {
                        method: 'POST',
                        body: new URLSearchParams({
                            user: $(prefix).val()
                        })
                    }).then((res) => res.json()).then((data) => {
                        for (var i = 0; i < data.length; i++) {
                            $('#3d').html(data[i].r3l);

                            $('#p31').html(data[i].r3l);
                            $('#t1').html(data[i].r3l);

                            $('#2d').html(data[i].r2l);

                            $('#r23').html(data[i].r2l);
                            $('#t4').html(data[i].r2l);

                            $('#1d').html(data[i].r1l);
                            $('#0d').html(data[i].r0l);
                            $('#3de').html(data[i].r3le.toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2}));

                            $('#p32').html(data[i].r3le.toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2}));
                            $('#t2').html(data[i].r3le.toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2}));
                            ttwo = data[i].r3le.toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2});
                            $('#2de').html(data[i].r2le.toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2}));

                            $('#r22').html(data[i].r2le.toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2}));
                            $('#t5').html(data[i].r2le.toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2}));

                            $('#1de').html(data[i].r1le.toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2}));
                            $('#0de').html(data[i].r0le.toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2}));
                            r3e = data[i].r3le;
                            r2e = data[i].r2le;
                            r1e = data[i].r1le;
                            r0e = data[i].r0le;
                            redTotalExp = r3e + r2e + r1e + r0e;
                            $('#totalRed').html(data[i].rt);
                            $('#tde').html(data[i].re.toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2}));
                        }
                        updatePercentage('tip', redTotalExp, expTotal);
                        updatePercentage('3ip', r3e, h3e);

                        updatePercentage('p33', r3e, h3e);

                        updatePercentage('2ip', r2e, h2e);

                        updatePercentage('r21', r2e, h2e);

                        updatePercentage('1ip', r1e, h1e);
                        updatePercentage('0ip', r0e, h0e);

                    });
                }

                function green(url, prefix) {
                    fetch(url, {
                        method: 'POST',
                        body: new URLSearchParams({
                            user: $(prefix).val()
                        })
                    }).then((res) => res.json()).then((data) => {
                        for (var i = 0; i < data.length; i++) {
                            $('#30').html(data[i].countage3to0);
                            $('#20').html(data[i].countage2to0);
                            $('#10').html(data[i].countage1to0);
                            $('#00').html(data[i].countage0to0);
                            $('#3ze').html(data[i].exposureAge3to0.toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2}));
                            $('#2ze').html(data[i].exposureAge2to0.toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2}));
                            $('#1ze').html(data[i].exposureAge1to0.toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2}));
                            $('#0ze').html(data[i].exposureAge0to0.toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2}));
                            gt = data[i].countage3to0 + data[i].countage2to0 + data[i].countage1to0 + data[i].countage0to0;
                            gte = data[i].exposureAge3to0 + data[i].exposureAge2to0 + data[i].exposureAge1to0 + data[i].exposureAge0to0;

                            updatePercentage('3zep', data[i].exposureAge3to0, h3e);
                            updatePercentage('2zep', data[i].exposureAge2to0, h2e);
                            updatePercentage('1zep', data[i].exposureAge1to0, h1e);
                            updatePercentage('0zep', data[i].exposureAge0to0, h0e);

                            $('#rtce').html(((gte / expTotal) * 100).toFixed(2) + '%');
                        }
                        $('#tze').html(gte.toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2}));
                        $('#tbt0').html(gt);
                    });
                }
                var filter;
                var officer;
                var cellText;
                var type;
                $('td').on('click', function () {
                    cellText = $(this).attr('id');

                    $('#exampleModal').modal('show');

                    switch (cellText) {
                        case "3":
                        case "3e":
                            filter = "AGE >= 3";
                            type = 1;
                            break;
                        case "2":
                        case "2e":
                            filter = "AGE < 3 AND AGE >= 2";
                            type = 1;
                            break;
                        case "1":
                        case "1e":
                            filter = "AGE < 2 AND AGE >= 1";
                            type = 1;
                            break;
                        case "0":
                        case "0e":
                            filter = "AGE < 1 AND AGE > 0";
                            type = 1;
                            break;
                        case "99":
                        case "99e":
                            filter = "AGE = 0";
                            type = 1;
                            break;
                        case "3d":
                        case "3de":
                        case "3ip":
                            filter = "data1.AGE >= 3 AND data2.AGE < 3";
                            type = 2;
                            break;
                        case "p31":
                        case "p32":
                        case "p33":
                            filter = "data1.AGE >= 3 AND data2.AGE < 3";
                            type = 2;
                            break;
                        case "2d":
                        case "2de":
                        case "2ip":
                            filter = "data1.AGE >= 2 AND data1.AGE < 3 AND data2.AGE < 2";
                            type = 2;
                            break;
                        case "r23":
                        case "r22":
                        case "r21":
                            filter = "data1.AGE >= 2 AND data1.AGE < 3 AND data2.AGE < 2";
                            type = 2;
                            break;
                        case "1d":
                        case "1de":
                        case "1ip":
                            filter = "data1.AGE >= 1 AND data1.AGE < 2 AND data2.AGE < 1";
                            type = 2;
                            break;
                        case "0d":
                        case "0de":
                        case "0ip":
                            filter = "data1.AGE > 0 AND data1.AGE < 1 AND data2.AGE = 0";
                            type = 2;
                            break;
                        case "3b":
                        case "3be":
                        case "3cie":
                            filter = "data1.AGE >= 3 AND data2.AGE >= 3";
                            type = 2;
                            break;
                        case "2b":
                        case "2be":
                        case "2cie":
                            filter = "data1.AGE >= 2 AND data1.AGE < 3 AND data2.AGE >= 2 AND data2.AGE < 3";
                            type = 2;
                            break;
                        case "1b":
                        case "1be":
                        case "1cie":
                            filter = "data1.AGE >= 1 AND data1.AGE < 2 AND data2.AGE >= 1 AND data2.AGE < 2";
                            type = 2;
                            break;
                        case "0b":
                        case "0be":
                        case "0cie":
                            filter = "data1.AGE > 0 AND data1.AGE < 1 AND data2.AGE > 0 AND data2.AGE < 1";
                            type = 2;
                            break;
                        case "99b":
                        case "99be":
                        case "99cie":
                            filter = "data1.AGE = 0 AND data2.AGE = 0";
                            type = 2;
                            break;
                        case "30":
                        case "3ze":
                        case "3zep":
                            filter = "data1.AGE >= 3 AND data2.AGE = 0";
                            type = 2;
                            break;
                        case "20":
                        case "2ze":
                        case "2zep":
                            filter = "data1.AGE >= 2 AND data1.AGE < 3 AND data2.AGE = 0";
                            type = 2;
                            break;
                        case "10":
                        case "1ze":
                        case "1zep":
                            filter = "data1.AGE >= 1 AND data1.AGE < 2 AND data2.AGE = 0";
                            type = 2;
                            break;
                        case "00":
                        case "0ze":
                        case "0zep":
                            filter = "data1.AGE > 0 AND data1.AGE < 1 AND data2.AGE = 0";
                            type = 2;
                            break;
                        default:
                    }

                    officer = $('#col_officers').val();
                    $.fn.dataTable.ext.errMode = 'none';
                    var dtable = $('#contractv2').DataTable(
                            {
                                "aLengthMenu": [[5, 10, 25, -1], [5, 10, 25, "All"]],
                                "pageLength": 0,
                                "ordering": true,
                                "autoWidth": false,
                                "processing": true,
                                "serverSide": true,
                                "searchHighlight": true,
                                "searchDelay": 350,
                                "ajax": {
                                    "url": "project/get-contracts",
                                    "contentType": "application/json",
                                    "type": "POST",
                                    "data": function (d) {
                                        d.filter = filter;
                                        d.data = officer;
                                        d.type = type;
                                        return JSON.stringify(d);
                                    },
                                    error: function (xhr, error, code) {
                                        console.log(xhr);
                                        console.log(code);
                                    }
                                },
                                "columns": [
                                    {"data": "financeno", className: "text-right"},
                                    {"data": "product"},
                                    {"data": "branch"},
                                    {"data": "fullname"},
                                    {"data": "nicno"},
                                    {"data": "age"},
                                    {"data": "applicationstatus"},
                                    {"data": "exposure"}
                                ], "language": {
                                    'loadingRecords': '&nbsp;',
                                    'processing': '<div class="loader2"></div>'
                                }
                            }
                    );
                    dtable.ajax.reload();
                });

                function updatePercentage(id, numerator, denominator) {
                    const result = ((numerator / denominator) * 100).toFixed(2) + '%';
                    document.getElementById(id).innerHTML = result;
                }

                var col_officers = new SlimSelect({
                    select: '#col_officers',
                    placeholder: "Collection Officers",
                    ajax: function (search, callback) {
                        fetch('project/search-col_officers', {
                            method: 'POST',
                            body: new URLSearchParams({search: search || ''})
                        }).then(res => res.json()).then((data) => {
                            callback(data);
                        });
                    },
                    allowDeselect: false
                });
                $('#col_officers').data('select', col_officers);

                var param = new SlimSelect({
                    select: '#param',
                    placeholder: "Select Parameter",
                    allowDeselect: false
                });

                var cluster = new SlimSelect({
                    select: '#cluster',
                    placeholder: "Cluster Collection Officers",
                    ajax: function (search, callback) {
                        fetch('project/search-clusters', {
                            method: 'POST',
                            body: new URLSearchParams({search: search || ''})
                        }).then(res => res.json()).then((data) => {
                            callback(data);
                        });
                    },
                    allowDeselect: false
                });
                $('#cluster').data('select', cluster);

                var col = document.getElementById("col");
                var clu = document.getElementById("clu");
                col.style.display = "block";

                $('#param').change(function () {
                    var selectedOption = $(this).val();
                    col.style.display = "none";
                    clu.style.display = "none";

                    if (selectedOption === 'officer') {
                        col.style.display = "block";
                    } else if (selectedOption === 'cluster') {
                        clu.style.display = "block";
                    }
                });

                document.getElementById('reset').addEventListener('click', function () {
                    location.reload();
                });

                var expTotal = 0;
                var redTotalExp = 0;
                var blueTotalExp = 0;

                var h3e = 0;
                var h2e = 0;
                var h1e = 0;
                var h0e = 0;
                var h99e = 0;

                var r3e = 0;
                var r2e = 0;
                var r1e = 0;
                var r0e = 0;

                function handleButtonClick(selector, errorMsg, hashEndpoint) {
                    expTotal = 0;
                    var dateTimeContainer = document.getElementById("dateTimeContainer");
                    if (dateTimeContainer) {
                        var currentDate = new Date();
                        var formattedDateTime = currentDate.toLocaleString();
                        dateTimeContainer.textContent = formattedDateTime;
                    }

                    var selectedValue = $(selector).val();
                    if (selectedValue !== null) {
                        document.getElementById('name').textContent = '' + selectedValue + '';
                        var hiddenBlock = document.getElementById("hidden");
                        hiddenBlock.style.display = "block";
                        var bigDiv = document.getElementById("bigDiv");
                        bigDiv.style.display = "none";
                        hash(hashEndpoint, selector);
                    } else {
                        Swal.fire('', errorMsg, 'error');
                    }
                }

                $(document).on('click', '#show2', function () {
                    handleButtonClick('#cluster', 'Cluster Officer Not Selected!', 'project/hash-count-cluster');
                });

                $(document).on('click', '#show', function () {
                    handleButtonClick('#col_officers', 'Collection Officer Not Selected!', 'project/hash-count');
                });

            });
        </script>
    </body>
</html>