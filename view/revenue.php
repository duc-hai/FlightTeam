<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <link rel="icon" href="../assests/imgs/logo.png">
    <title>Document</title>
    <style>
        :root {
            --main-color: white;
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
        form{
            margin-top: 2%;
            margin-bottom: 2%;
        }
        #doanhthu{
            font-size:large;
            color: red;
            font-style:oblique;
        }
        #veban{
            font-size:large;
            font-style:oblique;
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
    <div class="container">
        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-4 col-md-10 col-lg-9">
                <h1 style ="margin-top: 4%">Thống kê doanh thu</h1>
                <form action="/FlightTeam/view/revenue.php">
                    <label for="datein">Từ ngày:</label>
                    <input type="date" id="datein" name="datein">
                    <label for="dateout" style = "margin-left:2%">Đến ngày:</label>
                    <input type="date" id="dateout" name="dateout">
                    <input type="submit" class="btn btn-danger " value="Thống kê" style = "margin-left:2%">
                    <a href="/FlightTeam/view/flightManager.php" class="btn btn-danger " style = "margin-left:1%">Trở về</a>

                </form>   
            </div>      
        </div>
        <div class="row">
            <div class="col-lg-1"></div>
                <div class="col-lg-4 col-md-10 col-lg-9">
                    <table id="list-ticket" class="table table-bordered">
                    <thead>
                        <tr class="header">
                            <td>Mã đặt chỗ</td>
                            <td>Tên khách hàng</td>
                            <td>Ngày đặt vé</td>
                            <td>Loại vé</td>
                            <td>Ngày thanh toán</td>
                            <td>Hình thức thanh toán</td>
                            <td>Tổng tiền</td>
                        </tr>  
                    </thead>
                <div id="mainView"></div>
            </div>
        </div>
    </div> 
    <div class="container">
        <div class="row">
            <div class="col-lg-12"><label style="font-size:large">Số lượng vé bán:</label><a id ='veban'></a></div>
            <div class="col-lg-12"><label style="font-size:large">Tổng doanh thu:</label><a id ='doanhthu'></a></div>
    </div>
</body>
</html> 
<script>
    $(document).ready(function () {
        get_revenue();
    });
    function get_revenue(){
        <?php
        if(!isset($_GET['dateout'])|| !isset($_GET['dateout'])){
            $_GET['dateout'] = '';
            $_GET['dateout'] = '';
        }
        ?>
        $.ajax({
        url: "/FlightTeam/controller/FlightManagerControler.php?datein=<?php echo $_GET['datein']?>&dateout=<?php echo $_GET['dateout']?>",
        dataType: 'json',
            success: function (data) { 
                show_revenue(data);
            },
            error: function (data) {
            }
        })
    }
    function show_revenue(data) {
        let doanhthu = 0;
        let veban = 0;
        for (let i = 0; i < data.data.length; i++) {
            let row = data.data[i];
            let table = 
            `<tbody>
                <tr>
                    <td>`+row.idBooking+`</td>
                    <td>`+row.nameCustomer+`</td>
                    <td>`+row.bookingDate+`</td>
                    <td>`+row.ticketType+`</td>
                    <td>`+row.paymentdate+`</td>
                    <td>`+row.payMethods+`</td>
                    <td>`+row.priceTicket+`</td>
                </tr>
            </tbody>
            </table>`
            $("#list-ticket").append(table);
            doanhthu += parseInt(row.priceTicket);
            veban += 1;
        }
        function formatMoney(number) {
            return  number.toLocaleString('en-VN')+'đ';
        }
        document.getElementById('doanhthu').innerHTML = formatMoney(doanhthu);
        document.getElementById('veban').innerHTML = veban;


    }

        
    
         
</script>
