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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="../css/signup.css">
  <title>Đăng ký</title>
  <script>
    //Loading function
    $(window).bind("load", function () {
      jQuery("#status").fadeOut();
      jQuery("#loader").fadeOut();
    });

    $(document).ready(function () {
      //Add hotkey "Enter" for Register button
      document.getElementById("phone").addEventListener("keypress", function (event) {
        if (event.key === "Enter") {
          event.preventDefault();
          document.getElementById("btnSignUp").click();
        }
      })

      document.getElementById("OTP_code").addEventListener("keypress", function(event) {
        if (event.key === "Enter") {
          event.preventDefault ();
          document.getElementById("verOTP").click();
        }
      })
    });

    //Remove message error when click to input
    function revNameMessErr() {
      $("#error-name").css("display", "none");
    }

    function revEmailMessErr() {
      $("#error-email").css("display", "none");
    }

    function revErr() {
      $("#error-otp").css("display", "none");
      var asci = event.which ? event.which : event.keyCode;
      if (asci > 31 && (asci < 48 || asci > 57)) return false;
      return true;
    }

    function checkNumber(event) {
      //Remove error message
      $("#duplPhone").css("display", "none");
      //Force input number 
      var asci = event.which ? event.which : event.keyCode;
      if (asci > 31 && (asci < 48 || asci > 57)) return false;
      return true;
    }

    //Check input empty
    function checkEmpty() {
      var email = $("#email").val().trim();
      var name = $("#name").val().trim();
      if (name == "") {
        $("#error-name").css("display", "block");
        document.getElementById("name").focus();
        return false;
      }
      if (email == "") {
        $("#error-email").css("display", "block");
        document.getElementById("email").focus();
        return false;
      }
      return true;
    }

    //Check whether the phone is empty
    function checkValid() {
      var sdt = $("#phone").val();
      var email = $("#email").val().trim();
      var name = $("#name").val().trim();
      if (checkEmpty() == false) return;
      $.ajax({
        type: 'POST',
        url: '../controller/AccountController.php',
        dataType: 'text',
        data: "phone=" + sdt + "&name=" + name + "&email=" + email,
        success: function (data, status) {
          if (data == "true") {
            $("#duplPhone").css("display", "block");
            document.getElementById("phone").focus();
          }
          else {
            sendOTP();
          }
        },
        error: function (data) {
          $('#modalError').modal('show');
        }
      });
    }

    function sendOTP() {
      var sdt = $("#phone").val();
      $.ajax({
        type: 'POST',
        url: '../controller/AccountController.php',
        dataType: 'text',
        data: "phone_verify=" + sdt,
        success: function (data, status) {
          if (data != "success") {
            alert(data);
          }
        },
        error: function (data) {
          $('#modalError').modal('show');
        }
      });
      show_layout_verify();
    }

    function show_layout_verify() {
      var layout_verify = `
      <form id="formVerify">
        <h5 class="text-center" style="text-transform: uppercase;">Xác thực tài khoản</h5 class="text-center">
            <p style="font-style: italic" class="mt-1">Hệ thống đã gửi mã xác thực đến số điện thoại mà bạn đã đăng ký.
              Vui lòng kiểm tra và nhập mã OTP tại đây.</p>
            <div class="form-row">
              <div class="col-lg-10 col-md-9 col-sm-9">
                <input id="OTP_code" type="text" class="form-control my-2 p-2" placeholder="Mã xác thực" onkeypress="revErr()">
                <p id="error-otp" class="error-mess"> *Mã xác thực không đúng. Vui lòng thử lại</p>
              </div>
            </div>

            <div class="form-row">
              <div class="col-lg-4 col-md-3 col-sm-3 mb-3">
                <button id="verOTP" onclick="verifyOTP()" type="button" class="btn btn-block mt-2">Xác thực</button>
              </div>
            </div>

            <p class="text-center mt-5">Chưa nhận được mã xác thực <a style="color: #348efe; cursor: pointer;" onclick="sendOTP()">Gửi lại</a></p>
      </form>
      `;
      $("#formSignup").remove();
      $("#content").append(layout_verify);
    }

    function verifyOTP() {
      var otp = $("#OTP_code").val();
      $.ajax({
        type: 'POST',
        url: '../controller/AccountController.php',
        dataType: 'text',
        data: "verify_OTP=" + otp,
        success: function (data, status) {
          if (data == "true") {
            $(".alert").fadeIn(3000);
            $(".alert").fadeOut(3000);
            completeSignup();
          }
          else {
            $("#error-otp").css("display", "block");
          }
        },
        error: function (data) {
          $('#modalError').modal('show');
        }
      });
    }

    function completeSignup() {
      var layout = `
      <form id="formComplete" action="../controller/AccountController.php" method="post">
            <h5 class="text-center">Tạo mật khẩu</h5>
            <div class="form-row">
              <div class="col-lg-10 col-md-9 col-sm-9">
                <input type="password" id="password" class="form-control my-2 p-2" placeholder="Nhập mật khẩu" name="password">
              </div>
            </div>

            <div class="form-row">
              <div class="col-lg-10 col-md-9 col-sm-9">
                <input type="password" id="pass_veri" onkeyup="checkPassword()" class="form-control my-2 p-2" placeholder="Xác thực mật khẩu" style="position: relative;">
                <i class="fa fa-close"></i>
              </div>
            </div>

            <h5 class="text-center mt-2">Thông tin cá nhân</h5>
            <div class="form-row">
              <div class="col-lg-10 col-md-9 col-sm-9">
                <input name="passport" type="text" class="form-control my-2 p-2" placeholder="Nhập số hộ chiếu/căn cước">
              </div>
            </div>

            <div class="form-row mt-2">
              <div class="col-lg-5 col-md-4 col-sm-4" style="display: flex">
                <input type="date" name="dateOfBirth" id="" style="margin:auto; width: 90%; box-shadow: none;">
              </div>

              <div class="col-lg-5 col-md-4 col-sm-4" style="display: flex; height: 30px">
                <select name="nationality" id="nationality" style="margin:auto; width: 90%; height: 100%">
                  <option value="" selected>-Quốc tịch của bạn-</option>
                  <option value="Việt Nam">Việt Nam</option>
                  <option value="Thái Lan">Thái Lan</option>
                  <option value="Nhật Bản">Nhật Bản</option>
                  <option value="Hàn Quốc">Hàn Quốc</option>
                  <option value="Singapore">Singapore</option>
                  <option value="Trung Quốc">Trung Quốc</option>
                  <option value="Nga">Nga</option>
                  <option value="Pháp">Pháp</option>
                  <option value="Mỹ">Mỹ</option>
                  <option value="Brazil">Brazil</option>
                </select>
              </div>
            </div>

            <div class="form-row">
            <div class="col-lg-4 col-md-3 col-sm-3 mb-3 mt-3">
              <button id="saveAcc" name="saveAcc" type="submit" class="btn btn-block mt-2 disabled" form="formComplete">Hoàn thành</button>
            </div>
          </div>
          </form>
      `;
      $("#formVerify").remove();
      $("#content").append(layout);
    }
    function checkPassword() {
      var pass = $("#password").val().trim();
      var veri_pass = $("#pass_veri").val().trim();
      if (pass == veri_pass && pass != "") {
        $(".fa-close").css("display", "none");
        $("#saveAcc").removeClass("disabled").addClass("active");
      }
      else {
        $(".fa-close").css("display", "inline-block");
        $("#saveAcc").removeClass("active").addClass("disabled");
      }
    }
  </script>
</head>

<body>
  <div id='status'></div>
  <div id='loader'></div>
  <div class="alert">
    <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
    Xác nhận mã OTP thành công.
  </div>
  <div class="Form my-4 mx-5">
    <div class="container">
      <div class="row no-gutters">
        <div id="content" class="col-lg-6 px-5 pt-5">
          <img src="../assests/imgs/logo.png" class="img-logo mb-3" style="margin-left: auto; margin-right: auto;">

          <form id="formSignup">
            <div class="form-row">
              <div class="col-lg-10 col-md-9 col-sm-9">
                <input id="name" type="text" class="form-control my-2 p-2" placeholder="Họ tên"
                  onkeypress="revNameMessErr()" onclick="revNameMessErr()">
                <p id="error-name" class="error-mess"> *Vui lòng nhập họ tên</p>
              </div>
            </div>
            <div class="form-row">
              <div class="col-lg-10 col-md-9 col-sm-9">
                <input id="email" type="email" class="form-control my-2 p-2" placeholder="Email"
                  onkeypress="revEmailMessErr()" onclick="revEmailMessErr()">
                <p id="error-email" class="error-mess"> *Vui lòng nhập email</p>
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
                <button id="btnSignUp" type="button" class="btn btn-block mt-2" onclick="checkValid ()">Đăng ký</button>
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