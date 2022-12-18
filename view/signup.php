<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="icon" href="../assests/imgs/logo.png">
  <title>Đăng ký</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    .row {
      background-color: #CFF3FF;
      ;
      border-radius: 30px;
    }

    .img-fluid {
      border-top-right-radius: 30px;
      border-bottom-right-radius: 30px;
    }

    .img-logo {
      width: 10rem;
      height: auto;
    }

    .btn {
      background: #0492A8;
      color: white;
      font-weight: bold;
      font-family: Roboto, sans-serif;
    }

    .form-row {
      align-items: center;
      justify-content: center;
    }

    .error-mess {
      margin-bottom: 0.5rem;
      color: rgb(233, 81, 81);
      font-style: italic;
      display: none;
    }
  </style>

  <script>
    $(document).ready(function () {

    });

    function checkNumber(event) {
      //Remove error message
      $("#duplPhone").css ("display", "none");
      //Force input number 
      var asci = event.which ? event.which : event.keyCode;
      if (asci > 31 && (asci < 48 || asci > 57)) return false;
      return true;
    }

    function checkValid() {
      var sdt = $("#phone").val();
      $.ajax({
        type: 'POST',
        url: '../controller/AccountController.php',
        dataType: 'text',
        data: "phone=" + sdt,
        success: function (data, status) {
          if (data == "true") {
            $("#duplPhone").css ("display", "block");
            document.getElementById("phone").focus ();
          }
        },
        error: function (data) {
          $('#modalError').modal('show');
        }
      });
    }
  </script>
</head>

<body>
  <div class="Form my-4 mx-5">
    <div class="container">
      <div class="row no-gutters">
        <div class="col-lg-6 px-5 pt-5" style="flex-direction: column; display: flex;">
          <img src="../assests/imgs/logo.png" class="img-logo mb-5"
            style="margin-left: auto; margin-right: auto;">
          <form>
            <div class="form-row">
              <div class="col-lg-10 col-md-9 col-sm-9">
                <input type="text" class="form-control my-2 p-2" placeholder="Họ tên">
              </div>
            </div>
            <div class="form-row">
              <div class="col-lg-10 col-md-9 col-sm-9">
                <input type="email" class="form-control my-2 p-2" placeholder="Email">
              </div>
            </div>
            <div class="form-row">
              <div class="col-lg-10 col-md-9 col-sm-9">
                <input id="phone" type="text" onkeypress="return checkNumber(event)" class="form-control my-2 p-2"
                  placeholder="Số điện thoại">
                  <p id="duplPhone" class="error-mess"> *Số điện thoại bị trùng. Vui lòng thử lại</p>
              </div>
            </div>
            <div class="form-row">
              <div class="col-lg-10 col-md-9 col-sm-9">
                <button type="button" class="btn btn-block mt-2" onclick="checkValid ()">Đăng ký</button>
              </div>
            </div>
            <p class="text-center mt-3">Bạn đã có tài khoản? <a href="#">Đăng nhập ngay</a></p>
          </form>
        </div>
        <div class="col-lg-6">
          <img src="../assests/imgs/posterlogin.png" class="img-fluid" alt="">
        </div>
      </div>
    </div>
  </div>

  <div id='modalError' class='modal fade' role='dialog'>
    <div class='modal-dialog'>
      <div class='modal-content'>
        <div class='modal-header'>
          <button type='button' class='close' data-dismiss='modal'>&times;</button>
          <h4 class='modal-title' style='font-weight: bold; color: rgb(233, 81, 81);'>Error</h4>
        </div>
        <div class='modal-body'>
          <p>Đã xảy ra lỗi. Vui lòng thử lại hoặc liên hệ với quản trị viên</p>
        </div>
        <div class='modal-footer'>
          <button id='close' type='button' class='btn btn-default' data-dismiss='modal'>Close</button>
        </div>
      </div>
    </div>
  </div>
</body>

</html>