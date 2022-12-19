<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href='https://fonts.googleapis.com/css?family=Roboto Slab' rel='stylesheet'>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Trang chủ</title>
    <style>
        body{
            font-family: 'Roboto Slab';
        }
        .form-search{
            position: absolute;
            top: 30px;
            right: 30px;
            background-color: #99E0F8;
        }
        .banner{
            position: relative;
        }
        .size-text{
            font-size: 10px;
        
        }
        .img-place{
            border-radius: 5px;
            width: 100%;
            margin: 5px;
        }
        .img-question{
            border-radius: 5px;
            width: 100%;
            margin: 5px;
        }
        .container-fluid{
            padding: 0;
        }

                

    </style>
  </head>
  <body>
    <!-- Navbar -->
  <nav class="navbar navbar-expand-lg " style="background-color: #CFF3FF;">
        <div class="container-fluid">
            <a class="navbar-brand" href="/">
                <img src="../assests/imgs/logo.png" alt="" srcset="" height="60px">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse "  id="navbarSupportedContent">
                <ul id="nav-custom" class="navbar-nav ml-auto " style="font-weight: 600;
                                                    font-size: 24px;
                                                    line-height: 40px;">
                    <li class="nav-item px-4">
                        <a class="nav-link active"  aria-current="page"  href="/">Lên kế hoạch</a>
                    </li>
                     <li class="nav-item px-4" >
                        <a class="nav-link active"  aria-current="page" href="/">Chuyến bay của tôi</a>
                    </li>
        
                     <li class="nav-item px-4">
                        <a class="nav-link active"  aria-current="page" href="/login">Đăng nhập || Đăng ký</a>
                     </li>
            
                 </ul>
            </div>
        </div>
    </nav>


    <!-- Banner and form search -->
    <div class="container-fluid ">
        <div class="row banner">
            <div class="col-12 p-0">
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                     </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="../assests/imgs/posterhome.png" alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="../assests/imgs/DaLat.jpg" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="../assests/imgs/hcm.jpg" alt="Third slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>

            <div class="col-4 form-search p-5 border ">
                <form action="">
                    <div class="row">
                        <div class="col-4">
                            <p>Điểm đi: </p>
                        </div>
                        <div class="col-8">
                            <input id="noidi" type="text" name="noidi" class="form-control" placeholder="Nơi đi">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-4">
                            <p>Điểm đến: </p>
                        </div>
                        <div class="col-8">
                            <input id="noiden" type="text" name="noiden" class="form-control" placeholder="Nơi đến">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-4">
                            <p>Loại vé: </p>
                        </div>
                        <div class="col-4 d-flex">
                            <div class="col-3 p-0 mt-2">
                                <input id="oneway" type="radio" class="form-control">
                            </div>
                            <div class="col-9 p-0">
                                <p class="p-0">Một chiều</p>
                            </div>    
                        </div>
                        <div class="col-4 d-flex">
                            <div class="col-3 p-0 mt-2">
                                <input id="round-trip" type="radio" class="form-control">
                            </div>
                            <div class="col-9 p-0">
                                <p class="p-0">Khứ hồi</p>
                            </div> 
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-6">
                            <input id="date-left" type="text" class="form-control" placeholder="Ngày đi">
                        </div>
                        <div class="col-6">
                            <input id="date-come" type="text" class="form-control" placeholder="Ngày về">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-5">
                            <p>Số lượng khách: </p>
                        </div>
                        <div class="col-2 p-0">
                            <div class="col4">
                                <input id="adult" type="number" class="form-control p-0">
                            </div>
                            
                            <div class ="col-6">
                                <p class="p-0 m-0 size-text">Người lớn</p>
                            </div>
                            
                        </div>
                        <div class="col-2 p-0">
                            <input id="child" type="number" class="form-control p-0">
                            <p class="p-0 size-text">Trẻ em</p>
                        </div>
                        <div class="col-2 p-0">
                            <input id="kid" type="number" class="form-control p-0">
                            <p class="p-0 size-text">Em bé</p>
                        </div>
                    </div>
                    <div class="row-3 mt-3">
                        <div class="col-12 d-flex justify-content-center">
                            <button class ="btn btn-dark">Tìm chuyến bay</button>
                        </div>
                        
                    </div>
                </form>
            </div>
    </div>
      
      <div class="mx-4 " style="margin-top:40px;">
        <h3 class="mb-4" style="font-style: normal;
        font-weight: 600;
        font-size: 32px;
        line-height: 42px;">Trải nghiệm FlyTeam</h3>
    </div>

    <div class="container-fluid ">
        <div class="row sub-banner">
            <div class="col-12 p-0">
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                    <img class="d-block w-100" src="../assests/imgs/b1.jpg" alt="First slide">
                    </div>
                    <div class="carousel-item">
                    <img class="d-block w-100" src="../assests/imgs/b2.jpg" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                    <img class="d-block w-100" src="../assests/imgs/b1.jpg" alt="Third slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
                </div>
            </div>
        </div>
    </div>
      <div class="mx-4 " style="margin-top:40px;">
        <h3 class="mb-4" style="font-style: normal;
        font-weight: 600;
        font-size: 32px;
        line-height: 42px;">Điểm đến hấp dẫn</h3>
        </div>
      <div class="container">
        <div class="row">
            <div class="col-4">
                <img class="img-place" src="../assests/imgs/hcm.jpg">
            </div>
            <div class="col-4">
                <img class="img-place" src="../assests/imgs/HN.jpg">
            </div>
            <div class="col-4">
                <img class="img-place" src="../assests/imgs/SaPa.jpg">
            </div>

            <div class="col-4">
                <img class="img-place" src="../assests/imgs/NhaTrang.jpg">
            </div>

            <div class="col-4">
                <img class="img-place" src="../assests/imgs/HoiAn.jpg">
            </div>

            <div class="col-4">
                <img class="img-place" src="../assests/imgs/DaNang.jpg">
            </div>

        </div>
      </div>
      <div class="mx-4 " style="margin-top:40px;">
        <h3 class="mb-4" style="font-style: normal;
        font-weight: 600;
        font-size: 32px;
        line-height: 42px;">Câu hỏi thường gặp</h3>
        </div>

      <div class="container p-0">
        <div class="row">
            <div class="col-2">
            <img class="img-question" src="../assests/imgs/question2.jpg">
            </div>
            <div class="col-2">
            <img class="img-question" src="../assests/imgs/question3.jpg">
            </div>
            <div class="col-2">
            <img class="img-question" src="../assests/imgs/question4.jpg">
            </div>
            <div class="col-2">
            <img class="img-question" src="../assests/imgs/question5.jpg">
            </div>
            <div class="col-2">
            <img class="img-question" src="../assests/imgs/question6.jpg">
            </div>
            <div class="col-2">
            <img class="img-question" src="../assests/imgs/question7.jpg">
            </div>

        </div>
      </div>

      <div class="container-fluid mt-3 p-0 text-light bg-dark py-5 text-center">
        Copyright@ FlyTeam 2022
    </div>


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>