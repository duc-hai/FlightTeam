<?php
require_once("../model/account.php");
class AccountController {
    // public function 

    public static function checkDuplPhone ($phone) {
        return account::checkDuplicatePhone($phone);
    } 
}

$accContrl = new AccountController();
if (isset($_POST['phone'])) {
    $rel = $accContrl->checkDuplPhone($_POST['phone']);
    die($rel ? "true" : "false");
}
?>