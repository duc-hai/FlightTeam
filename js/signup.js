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
    //Add enter hotkey
    document.getElementById("OTP_code").addEventListener("keypress", function (event) {
        if (event.key === "Enter") {
            event.preventDefault();
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

//OTP contains 6 digit of number, so must force input type is number
function revErr(event) {
    $("#error-otp").css("display", "none");
    var asci = event.which ? event.which : event.keyCode;
    if (asci > 31 && (asci < 48 || asci > 57)) return false;
    return true;
}

//Input of phone number must is number from 0 to 9
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
var phoneNumber = "";
//Action send OTP to phone number
function sendOTP() {
    var sdt = $("#phone").val();
    phoneNumber = sdt;
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
    document.getElementById("time-lapse").innerHTML = "(120)";
}

//Show layout verify OTP
function show_layout_verify() {
    var layout_verify = `
    <form id="formVerify">
      <h5 class="text-center" style="text-transform: uppercase;">X??c th???c t??i kho???n</h5 class="text-center">
          <p style="font-style: italic" class="mt-1">H??? th???ng ???? g???i m?? x??c th???c ?????n s??? ??i???n tho???i m?? b???n ???? ????ng k??.
            Vui l??ng ki???m tra v?? nh???p m?? OTP t???i ????y.</p>
          <div class="form-row">
            <div class="col-lg-10 col-md-9 col-sm-9">
              <input id="OTP_code" type="text" class="form-control my-2 p-2" placeholder="M?? x??c th???c" onkeypress="revErr(event)">
              <p id="error-otp" class="error-mess"> *M?? x??c th???c kh??ng ????ng. Vui l??ng th??? l???i</p>
            </div>
          </div>

          <div class="form-row">
            <div class="col-lg-4 col-md-3 col-sm-3 mb-3">
              <button id="verOTP" onclick="verifyOTP()" type="button" class="btn btn-block mt-2">X??c th???c</button>
            </div>
          </div>

          <p class="text-center mt-5">Ch??a nh???n ???????c m?? x??c th???c 
          <span id="time-lapse">(120) </span><a style="color: #348efe; cursor: pointer;" onclick="resendOTP()">G???i l???i</a></p>
    </form>
    `;
    $("#formSignup").remove();
    $("#content").append(layout_verify);
    setInterval(setTimeLap, 1000);

    $("#progress").remove ();
    $("#content").append(`
        <div id="progress" class="progress mb-3 mt-2" style="width: 70%; margin:auto">
        <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="66.6"
        aria-valuemin="0" aria-valuemax="100" style="width:66.6%">
        B?????c 2/3
        </div>
    </div>
    `);
}

// Resend OTP to phone when time out
function resendOTP () {
    if (document.getElementById("time-lapse").innerHTML != "(0) ") {
        return;
    }
    $.ajax({
        type: 'POST',
        url: '../controller/AccountController.php',
        dataType: 'text',
        data: "phone_verify=" + phoneNumber,
        success: function (data, status) {
            if (data != "success") {
                alert(data);
            }
        },
        error: function (data) {
            $('#modalError').modal('show');
        }
    });
    document.getElementById("time-lapse").innerHTML = "(120)";
}

//Set time lapse to resend OTP
function setTimeLap () {
    var time = document.getElementById("time-lapse").innerHTML;
    
    time = time.replace(")", "");
    time = time.replace("(", "");
    time = Number (time);
    if (time != 0) {
        time = time - 1;
    }
    document.getElementById("time-lapse").innerHTML = "(" + time + ") ";
}


//Verify OTP from server
// open cmt 
function verifyOTP() {
    var otp = $("#OTP_code").val();
    $.ajax({
        type: 'POST',
        url: '../controller/AccountController.php',
        dataType: 'text',
        data: "verify_OTP=" + otp,
        success: function (data, status) {
            // if (data == "true") {
                $(".alert").fadeIn(3000);
                $(".alert").fadeOut(3000);
                completeSignup();
            // }
            // else {
                // $("#error-otp").css("display", "block");
            // }
        },
        error: function (data) {
            $('#modalError').modal('show');
        }
    });
}

//Layout save account
function completeSignup() {
    var layout = `
    <form id="formComplete" action="../controller/AccountController.php" method="post">
          <h5 class="text-center">T???o m???t kh???u</h5>
          <div class="form-row">
            <div class="col-lg-10 col-md-9 col-sm-9">
              <input type="password" onkeyup="checkPassword()" id="password" class="form-control my-2 p-2" placeholder="Nh???p m???t kh???u" name="password">
            </div>
          </div>

          <div class="form-row">
            <div class="col-lg-10 col-md-9 col-sm-9">
              <input type="password" id="pass_veri" onkeyup="checkPassword()" class="form-control my-2 p-2" placeholder="X??c th???c m???t kh???u" style="position: relative;">
              <i class="fa fa-close"></i>
            </div>
          </div>

          <h5 class="text-center mt-2">Th??ng tin c?? nh??n</h5>
          <div class="form-row">
            <div class="col-lg-10 col-md-9 col-sm-9">
              <input name="passport" type="text" class="form-control my-2 p-2" placeholder="Nh???p s??? h??? chi???u/c??n c?????c">
            </div>
          </div>

          <div class="form-row mt-2">
            <div class="col-lg-5 col-md-4 col-sm-4" style="display: flex">
              <input type="date" name="dateOfBirth" id="" style="margin:auto; width: 90%; box-shadow: none;">
            </div>

            <div class="col-lg-5 col-md-4 col-sm-4" style="display: flex; height: 30px">
              <select name="nationality" id="nationality" style="margin:auto; width: 90%; height: 100%">
                <option value="" selected>-Qu???c t???ch c???a b???n-</option>
                <option value="Vi???t Nam">Vi???t Nam</option>
                <option value="Th??i Lan">Th??i Lan</option>
                <option value="Nh???t B???n">Nh???t B???n</option>
                <option value="H??n Qu???c">H??n Qu???c</option>
                <option value="Singapore">Singapore</option>
                <option value="Trung Qu???c">Trung Qu???c</option>
                <option value="Nga">Nga</option>
                <option value="Ph??p">Ph??p</option>
                <option value="M???">M???</option>
                <option value="Brazil">Brazil</option>
              </select>
            </div>
          </div>

          <div class="form-row">
          <div class="col-lg-4 col-md-3 col-sm-3 mb-3 mt-3">
            <button id="saveAcc" name="saveAcc" type="submit" class="btn btn-block mt-2 disabled" form="formComplete">Ho??n th??nh</button>
          </div>
        </div>
        </form>
    `;
    $("#formVerify").remove();
    $("#content").append(layout);
    $("#progress").remove();
    $("#content").append(
        `
        <div id="progress" class="progress mb-3 mt-2" style="width: 70%; margin:auto">
            <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="100"
            aria-valuemin="0" aria-valuemax="100" style="width:100%">
            B?????c 3/3
            </div>
        </div>
        `
    );
}

//Check whether two passwords is correct
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