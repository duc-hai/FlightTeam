<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <link rel="icon" href="../assests/imgs/logo.png">    
        <title>Trang chủ - Admin</title>
    <style>
        :root {
            --main-color: white;
        }
        #danhmuc{
            background-color: var(--main-color);
            text-align: center;
            border: 1px solid white;
        }
        .list-group-item{
            background-color: white;
        }
        .list-group-item:hover{
            background-color:rgb(213, 184, 184);
        }
        body{
            background-color:white;
        }     
        #addticket{
            margin-top: 1%;
            margin-bottom: 1%;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">FlightTeam Air</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href=""></a>
                    </li>
                    <li class="nav-item">
                        <a id="countItemCart" class="nav-link" href=""></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
        <div class="row">
            <div class="col-lg-2">
                <div id="danhmuc">
                    <img src = "/FlightTeam/assests/imgs/logo.png" style="width:100% ;height:100% ;">
                    <div class="list-group">
                        <a  class='list-group-item' onclick="get_all_tickets()" >Thông tin vé máy bay</a>
                        <a class='list-group-item' onclick="get_history_tickets()" >Lịch sử mua vé</a>
                        <a  class='list-group-item' href="revenue.php" >doanh thu</a>
                        <a  class='list-group-item' onclick="get_flight()" >Quản lý chuyến bay</a>
                        <a  class='list-group-item' href="clientManager.php">Quản lý khách hàng</a>
                        <a  class='list-group-item' href="historyTicket.php">Lịch sử vé</a>
                    </div>
                </div>
            </div>
            <div  class="col-md-12 col-lg-9">
                <!-- <div id="mainRevenue"></div> -->
                <div id="mainView"></div>
            </div>
        </div>
    </div>  
</body>
</html> 
<script>
    $(document).ready(function () {
        get_all_tickets();
    });
    function get_all_tickets() {
        $.ajax({
        url: "/FlightTeam/controller/FlightManagerControler.php?action=getAllTicket",
        dataType: 'json',
            success: function (data) { 
                show_tickets (data);
            },
            error: function (data) {
            }
        })
    }
   
    function show_tickets(data) {
            let tablemain =` 
            <div id ="tableTicket">
                <h1 style ="margin-top: 4%">Thông tin vé máy bay</h1>
                    <table id="list-ticket" class="table table-bordered" style ="margin-top: 2%">
                    <thead>
                        <tr class="header">
                            <th>Mã đặt chỗ</th>
                            <th>vị trí ghế</th>
                            <th>Cổng vào</th>
                            <th>Loại vé</th>
                            <th>Mã chuyến bay</th>
                            <th>Tên máy bay</th>
                            <th>Ngày đi</th>
                            <th>Ngày đến</th>
                            <th>Giá vé</th>
                        </tr>  
                    </thead>
                    </table>
                </div>`
            $('#tableHis').remove();
            $('#tableTicket').remove();
            $('#tableFly').remove();
            $("#mainView").append(tablemain);
            for (let i = 0; i < data.data.length; i++) {
                let row = data.data[i];
                let table = 
                `
                <tbody>
                    <tr>
                        <td>`+row.idBooking+`</td>
                        <td>`+row.seatPosition+`</td>
                        <td>`+row.enntranceGate+`</td>
                        <td>`+row.ticketType+`</td>
                        <td>`+row.idFlight+`</td>
                        <td>`+row.airName+`</td>
                        <td>`+row.flightDate+`</td>
                        <td>`+row.landingDay+`</td>
                        <td>`+row.priceTicket+`</td>
                    </tr>
                </tbody>
                </table>`
                $("#list-ticket").append(table);
            }
         
        }

    function get_history_tickets() {
        $.ajax({
        url: "/FlightTeam/controller/FlightManagerControler.php?action=gethistoryTicket",
        dataType: 'json',
            success: function (data) { 
                show_history_tickets (data);
            },
            error: function (data) {
            }
        })
        }

    function show_history_tickets (data) {
            let tablemain =`
            <div id ="tableHis">
            <h1 style ="margin-top: 4%">Lịch sử mua vé</h1>
            <table id="list-history-ticket" class="table table-bordered"style ="margin-top: 2%">
                <thead>
                <tr>
                    <th>Mã đặt chỗ</th>
                    <th>Số điện thoại</th>
                    <th>Tên khách hàng</th>
                    <th>Mã chuyến bay</th>
                    <th>Mã giao dịch</th>
                    <th>Người thanh toán</th>
                    <th>Thanh toán</th>
                    <th>Ngày giao dịch</th>
                    <th>Tổng tiền</th>
                </tr>
                </thead>
            </div>`
            $('#tableHis').remove();
            $('#tableTicket').remove();
            $('#tableFly').remove();
            $("#mainView").append(tablemain);
            for (let i = 0; i < data.data.length; i++) {
                let row = data.data[i];
                let table = 
                `<tbody>
                    <tr>
                        <td>`+row.idBooking+`</td>
                        <td>`+row.customePhoneNumber+`</td>
                        <td>`+row.nameCustomer+`</td>
                        <td>`+row.idFlight+`</td>
                        <td>`+row.idpay+`</td>
                        <td>`+row.payerName+`</td>
                        <td>`+row.payMethods+`</td>
                        <td>`+row.paymentdate+`</td>
                        <td>`+row.priceTicket+`</td>
                    </tr>
                    </tbody>
                </table>`
                $("#list-history-ticket").append(table);
            }
         
        }
        //Quản lý chuyến bay
        function get_flight() {
            $.ajax({
            url: "/FlightTeam/controller/FlightManagerControler.php?action=getflight",
            dataType: 'json',
                success: function (data) { 
                    show_flight (data);
                },
                error: function (data) {
                }
            })
            }

        function show_flight(data) {
            let tablemain = `
            <div id ="tableFly">
            <h1 style ="margin-top: 4%">Quản lý chuyến bay</h1>
                <a href="../view/addFlight.php" id="addticket" class="btn btn-danger mt-10">Thêm chuyến bay</a>
                <table id ="list-getflight" class="table table-hover" style ="margin-top: 1%">
                <thead>
                <tr>
                    <th>Mã chuyến bay</th>
                    <th>Tên Máy bay</th>
                    <th>Ngày khởi hành</th>
                    <th>Ngày đến</th>
                    <th>Mã sân bay</th>
                </tr>
                </thead>
                </div>`
            $('#tableHis').remove();
            $('#tableTicket').remove();
            $('#tableFly').remove();
            $("#mainView").append(tablemain);    
            for (let i = 0; i < data.data.length; i++) {
                let row = data.data[i];
                let table = 
                `<tbody>
                    <tr>
                        <td>`+row.idFlight+`</td>
                        <td>`+row.airName+`</td>
                        <td>`+row.flightDate+`</td>
                        <td>`+row.landingDay+`</td>
                        <td>`+row.Iddepartureair+`</td>
                        <td><a href="../view/editFlight.php?idFlight=` +row.idFlight+`" class="btn btn-primary">Edit</a></td>
                    </tr>
                </body>
                </table>`
                $("#list-getflight").append(table);
            }
        }
</script>   