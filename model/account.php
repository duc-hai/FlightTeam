<?php
    require_once("connection.php");
    class account {
        private $phone;
        private $password;

        public function __construct ($phone, $password) {
            $this->phone = $phone;
            $this->password = $password;
        }

        //Check whether the sign up phone number is duplicate
        public static function checkDuplicatePhone ($phone) {
            $conn = connection::connectToDatabase ();
            $result = mysqli_query($conn, "SELECT * FROM KHACHHANG WHERE sdt = '$phone'");
            if (mysqli_num_rows($result) != 0) {
                return true;
            }
            return false;
        }
    }
?>