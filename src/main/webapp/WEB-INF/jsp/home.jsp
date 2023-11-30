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
        </style>
    </head>

    <body>
        <%@include file="jspf/navbar.jspf" %>
        <div style="padding: 70px; padding-top: 10px;">
            <div class="card" style="width: auto;">
                <div class="card-body">
                    <h5 class="card-title">Select Collection Officer</h5>
                    <p class="card-text"></p>
                    <select id="col_officers" class="swal2-select">
                    </select>
                    <button type="button" class="btn btn-primary" id="show">Show Data</button>
                    <button type="button" class="btn btn-danger" id="reset">Reset Table</button>
                </div>
            </div>
        </div>

        <div id="hidden" style="display: none; padding: 15px; margin-top: -100px;">
            <div class="card">
                <div class="card-header">
                    <h6 class="m-0" id="name"></h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover" id="firstv2">
                            <thead id="customHeader">
                                <tr>
                                    <th colspan="1"></th>
                                    <th colspan="2">2023-11-01</th>
                                    <th colspan="7">Bucket Movement</th>
                                    <th colspan="2">2023-11-28</th>
                                    <th colspan="1">Results</th>
                                </tr>
                            </thead>
                            <thead class="table-dark">
                                <tr>
                                    <th>Bucket</th>
                                    <th>#</th>
                                    <th>Exposure</th>
                                    <th>Above 3</th>
                                    <th>2 - 3</th>
                                    <th>1 - 2</th>
                                    <th>0 - 1</th>
                                    <th>0</th>
                                    <th><i class="fas fa-arrow-up green-up-arrow"></i></th>
                                    <th><i class="fas fa-arrow-down red-down-arrow"></i></th>
                                    <th>#</th>
                                    <th>Exposure</th>
                                    <th>% Change In Exposure</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Above 3</td>
                                    <td id="3">0</td>
                                    <td id="3e">0</td>
                                    <td id="3b" class="blue">0</td>
                                    <td id="32g" class="green">0</td>
                                    <td id="31g" class="green">0</td>
                                    <td id="30g" class="green">0</td>
                                    <td id="399g" class="green">0</td>
                                    <td id="3up">0</td>
                                    <td id="3down">0</td>
                                    <td id="32">0</td>
                                    <td id="3e2">0</td>
                                    <td id="3cie">0</td>
                                </tr>
                                <tr>
                                    <td>2 - 3</td>
                                    <td id="2">0</td>
                                    <td id="2e">0</td>
                                    <td id="2r1" class="red">0</td>
                                    <td id="2b" class="blue">0</td>
                                    <td id="21g" class="green">0</td>
                                    <td id="20g" class="green">0</td>
                                    <td id="299g" class="green">0</td>
                                    <td id="2up">0</td>
                                    <td id="2down">0</td>
                                    <td id="22">0</td>
                                    <td id="2e2">0</td>
                                    <td id="2cie">0</td>
                                </tr>
                                <tr>
                                    <td>1 - 2</td>
                                    <td id="1">0</td>
                                    <td id="1e">0</td>
                                    <td id="13r2" class="red">0</td>
                                    <td id="1r1" class="red">0</td>
                                    <td id="1b" class="blue">0</td>
                                    <td id="10g" class="green">0</td>
                                    <td id="199g" class="green">0</td>
                                    <td id="1up">0</td>
                                    <td id="1down">0</td>
                                    <td id="12">0</td>
                                    <td id="1e2">0</td>
                                    <td id="1cie">0</td>
                                </tr>
                                <tr>
                                    <td>0 - 1</td>
                                    <td id="0">0</td>
                                    <td id="0e">0</td>
                                    <td id="03r2" class="red">0</td>
                                    <td id="02r2" class="red">0</td>
                                    <td id="0r1" class="red">0</td>
                                    <td id="0b" class="blue">0</td>
                                    <td id="099g" class="green">0</td>
                                    <td id="0up">0</td>
                                    <td id="0down">0</td>
                                    <td id="02">0</td>
                                    <td id="0e2">0</td>
                                    <td id="0cie">0</td>
                                </tr>
                                <tr>
                                    <td>0</td>
                                    <td id="99">0</td>
                                    <td id="99e">0</td>
                                    <td id="993r2" class="red">0</td>
                                    <td id="992r2" class="red">0</td>
                                    <td id="991r2" class="red">0</td>
                                    <td id="99r1" class="red">0</td>
                                    <td id="99b" class="blue">0</td>
                                    <td id="99up">0</td>
                                    <td id="99down">0</td>
                                    <td id="992">0</td>
                                    <td id="99e2">0</td>
                                    <td id="99cie">0</td>
                                </tr>
                                <tr>
                                    <td class="table-dark">Total</td>
                                    <td class="table-dark" id="totalHash">0</td>
                                    <td class="table-dark" id="totalExp">0</td>
                                    <td id="3t" class="table-dark">3t</td>
                                    <td id="2t" class="table-dark">2t</td>
                                    <td id="1t" class="table-dark">1t</td>
                                    <td id="0t" class="table-dark">0t</td>
                                    <td id="99t" class="table-dark">99t</td>
                                    <td id="upt" class="table-dark">upt</td>
                                    <td id="downt" class="table-dark">downt</td>
                                    <td class="table-dark" id="totalHash2">0</td>
                                    <td class="table-dark" id="totalExp2">0</td>
                                    <td class="table-dark" id="tcie">0</td>
                                </tr>
                            </tbody>
                        </table>
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
            document.getElementById('reset').addEventListener('click', function () {
                location.reload();
            });

            var hashTotal = 0;
            var expTotal = 0;
            var hashTotal2 = 0;
            var expTotal2 = 0;
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

            $(document).on('click', '#show', function () {
                var col_officers = $('#col_officers').val();
                if (col_officers !== null) {

                    document.getElementById('name').textContent = '' + col_officers + '';
                    var hiddenBlock = document.getElementById("hidden");
                    hiddenBlock.style.display = "block";
                    hashTotal = 0;
                    expTotal = 0;
                    hashTotal2 = 0;
                    expTotal2 = 0;
//                fetch('project/hash-count1').then((res) => res.json()).then((data) => {
                    fetch('project/hash-count1', {
                        method: 'POST',
                        body: new URLSearchParams({
                            user: col_officers
                        })
                    }).then((res) => res.json()).then((data) => {
                        for (var i = 0; i < data.length; i++) {
                            if (data[i].ageRange === 3) {
                                $('#3').html(data[i].ageCount);
                                $('#3e').html(data[i].totalExposure);
                            } else if (data[i].ageRange === 2) {
                                $('#2').html(data[i].ageCount);
                                $('#2e').html(data[i].totalExposure);
                            } else if (data[i].ageRange === 1) {
                                $('#1').html(data[i].ageCount);
                                $('#1e').html(data[i].totalExposure);
                            } else if (data[i].ageRange === 0) {
                                $('#0').html(data[i].ageCount);
                                $('#0e').html(data[i].totalExposure);
                            } else if (data[i].ageRange === 99) {
                                $('#99').html(data[i].ageCount);
                                $('#99e').html(data[i].totalExposure);
                            }
                            hashTotal = hashTotal + data[i].ageCount;
                            expTotal = expTotal + data[i].totalExposure;
                        }
                        $('#totalHash').html(hashTotal);
                        $('#totalExp').html(expTotal);
                    });

//                fetch('project/hash-count2').then((res) => res.json()).then((data) => {
                    fetch('project/hash-count2', {
                        method: 'POST',
                        body: new URLSearchParams({
                            user: col_officers
                        })
                    }).then((res) => res.json()).then((data) => {
                        for (var i = 0; i < data.length; i++) {
                            if (data[i].ageRange === 3) {
                                $('#32').html(data[i].ageCount);
                                $('#3e2').html(data[i].totalExposure);
                            } else if (data[i].ageRange === 2) {
                                $('#22').html(data[i].ageCount);
                                $('#2e2').html(data[i].totalExposure);
                            } else if (data[i].ageRange === 1) {
                                $('#12').html(data[i].ageCount);
                                $('#1e2').html(data[i].totalExposure);
                            } else if (data[i].ageRange === 0) {
                                $('#02').html(data[i].ageCount);
                                $('#0e2').html(data[i].totalExposure);
                            } else if (data[i].ageRange === 99) {
                                $('#992').html(data[i].ageCount);
                                $('#99e2').html(data[i].totalExposure);
                            }
                            hashTotal2 = hashTotal2 + data[i].ageCount;
                            expTotal2 = expTotal2 + data[i].totalExposure;
                        }
                        $('#totalHash2').html(hashTotal2);
                        $('#totalExp2').html(expTotal2);
                    });

//                fetch('project/blue-count').then((res) => res.json()).then((data) => {
                    fetch('project/blue-count', {
                        method: 'POST',
                        body: new URLSearchParams({
                            user: col_officers
                        })
                    }).then((res) => res.json()).then((data) => {
                        for (var i = 0; i < data.length; i++) {
                            $('#3b').html(data[i].age3Count);
                            $('#2b').html(data[i].age2Count);
                            $('#1b').html(data[i].age1Count);
                            $('#0b').html(data[i].age0Count);
                            $('#99b').html(data[i].age99Count);
                        }
                    });

//                fetch('project/red-count1').then((res) => res.json()).then((data) => {
                    fetch('project/red-count1', {
                        method: 'POST',
                        body: new URLSearchParams({
                            user: col_officers
                        })
                    }).then((res) => res.json()).then((data) => {
                        for (var i = 0; i < data.length; i++) {
                            $('#2r1').html(data[i].count3toTwo);
                            $('#1r1').html(data[i].count2toOne);
                            $('#0r1').html(data[i].count1toZero);
                            $('#99r1').html(data[i].count0toNinenine);
                        }
                    });

//                fetch('project/red-count2').then((res) => res.json()).then((data) => {
                    fetch('project/red-count2', {
                        method: 'POST',
                        body: new URLSearchParams({
                            user: col_officers
                        })
                    }).then((res) => res.json()).then((data) => {
                        for (var i = 0; i < data.length; i++) {
                            $('#13r2').html(data[i].count1toThree);
                            $('#03r2').html(data[i].count0toThree);
                            $('#993r2').html(data[i].count99toThree);
                            $('#02r2').html(data[i].count0toTwo);
                            $('#992r2').html(data[i].count99toTwo);
                            $('#991r2').html(data[i].count99toOne);
                        }
                    });

//                fetch('project/green-count').then((res) => res.json()).then((data) => {
                    fetch('project/green-count', {
                        method: 'POST',
                        body: new URLSearchParams({
                            user: col_officers
                        })
                    }).then((res) => res.json()).then((data) => {
                        for (var i = 0; i < data.length; i++) {
                            $('#32g').html(data[i].count3toTwo);
                            $('#31g').html(data[i].count3toOne);
                            $('#30g').html(data[i].count3toZero);
                            $('#399g').html(data[i].count3toNinenine);
                            $('#21g').html(data[i].count2toOne);
                            $('#20g').html(data[i].count2toZero);
                            $('#299g').html(data[i].count2toNinenine);
                            $('#10g').html(data[i].count1toZero);
                            $('#199g').html(data[i].count1toNinenine);
                            $('#099g').html(data[i].count0toNinenine);
                        }
                    });

                    $('#3t').html(parseFloat($('#3b').html()) + parseFloat($('#2r1').html()) + parseFloat($('#13r2').html()) + parseFloat($('#03r2').html()) + parseFloat($('#993r2').html()));
                    $('#2t').html(parseFloat($('#32g').html()) + parseFloat($('#2b').html()) + parseFloat($('#1r1').html()) + parseFloat($('#02r2').html()) + parseFloat($('#992r2').html()));
                    $('#1t').html(parseFloat($('#31g').html()) + parseFloat($('#21g').html()) + parseFloat($('#1b').html()) + parseFloat($('#0r1').html()) + parseFloat($('#991r2').html()));
                    $('#0t').html(parseFloat($('#30g').html()) + parseFloat($('#20g').html()) + parseFloat($('#10g').html()) + parseFloat($('#0b').html()) + parseFloat($('#99r1').html()));
                    $('#99t').html(parseFloat($('#399g').html()) + parseFloat($('#299g').html()) + parseFloat($('#199g').html()) + parseFloat($('#099g').html()) + parseFloat($('#99b').html()));


                    $('#3cie').html((((parseFloat($('#3e2').html()) - parseFloat($('#3e').html())) / parseFloat($('#3e2').html())) * 100).toFixed(2) + '%');
                    $('#2cie').html((((parseFloat($('#2e2').html()) - parseFloat($('#2e').html())) / parseFloat($('#2e2').html())) * 100).toFixed(2) + '%');
                    $('#1cie').html((((parseFloat($('#1e2').html()) - parseFloat($('#1e').html())) / parseFloat($('#1e2').html())) * 100).toFixed(2) + '%');
                    $('#0cie').html((((parseFloat($('#0e2').html()) - parseFloat($('#0e').html())) / parseFloat($('#0e2').html())) * 100).toFixed(2) + '%');
                    $('#99cie').html((((parseFloat($('#99e2').html()) - parseFloat($('#99e').html())) / parseFloat($('#99e2').html())) * 100).toFixed(2) + '%');
                    $('#tcie').html((((parseFloat($('#totalExp2').html()) - parseFloat($('#totalExp').html())) / parseFloat($('#totalExp2').html())) * 100).toFixed(2) + '%');

                    $('#3up').html(parseFloat($('#32g').html()) + parseFloat($('#31g').html()) + parseFloat($('#30g').html()) + parseFloat($('#399g').html()));
                    $('#2up').html(parseFloat($('#21g').html()) + parseFloat($('#20g').html()) + parseFloat($('#299g').html()));
                    $('#1up').html(parseFloat($('#10g').html()) + parseFloat($('#199g').html()));
                    $('#0up').html(parseFloat($('#099g').html()));

                    $('#2down').html(parseFloat($('#2r1').html()));
                    $('#1down').html(parseFloat($('#13r2').html()) + parseFloat($('#1r1').html()));
                    $('#0down').html(parseFloat($('#03r2').html()) + parseFloat($('#02r2').html()) + parseFloat($('#0r1').html()));
                    $('#99down').html(parseFloat($('#993r2').html()) + parseFloat($('#992r2').html()) + parseFloat($('#991r2').html()) + parseFloat($('#99r1').html()));

                    $('#upt').html(parseFloat($('#3up').html()) + parseFloat($('#2up').html()) + parseFloat($('#1up').html()) + parseFloat($('#0up').html()) + parseFloat($('#99up').html()));
                    $('#downt').html(parseFloat($('#3down').html()) + parseFloat($('#2down').html()) + parseFloat($('#1down').html()) + parseFloat($('#0down').html()) + parseFloat($('#99down').html()));

                } else {
                    Swal.fire(
                            '',
                            'Collection Officer Not Selected!',
                            'error'
                            );
                }
            });
        </script>
    </body>
</html>