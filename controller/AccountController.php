<?php
require_once("../model/account.php");
class AccountController {
    // public function 

    public static function checkDuplPhone ($phone) {
        return account::checkDuplicatePhone($phone);
    } 

    public static function sendOTP ($phone) {
        try {
            account::sendOTP($phone);
            die("success");
        } catch (Exception $e) {
            die('Error: ' . $e->getMessage().  "\n");
        }
    }

    public static function verifyOTP ($otp) {
        die(account::verifyOTP($otp) ? "true" : "false");
    }

    public static function createAccount ($phone, $password, $fullname, $dateofbirth, $passport, $national, $email) {
        account::createAccount($phone, $password, $fullname, $dateofbirth, $passport, $national, $email);
    }
}

$accContrl = new AccountController();
if (isset($_POST['phone'])) {
    $rel = $accContrl->checkDuplPhone($_POST['phone']);
    if ($rel == false) {
        if (isset($_POST['name']) && isset($_POST['email'])) {
            session_start();
            $_SESSION['name'] = $_POST['name'];
            $_SESSION['email'] = $_POST['email'];
            $_SESSION['phone'] = $_POST['phone'];
        }
    }
    die($rel ? "true" : "false");
}

if (isset($_POST['phone_verify'])) {
    $accContrl->sendOTP($_POST['phone_verify']);
}

if (isset($_POST['verify_OTP'])) {
    $accContrl->verifyOTP($_POST['verify_OTP']);
}

if (isset($_POST['saveAcc'])) {
    if (isset($_POST['password'])) {
        session_start();
        $time = strtotime($_POST['dateOfBirth']);
        if ($time) {
            $date = date('Y/m/d', $time);
        }
        else {
            exit;
        }
        $accContrl->createAccount ($_SESSION['phone'], $_POST['password'], $_SESSION['name'], $date, $_POST['passport'], $_POST['nationality'], $_SESSION['email']);
    }
}
?>