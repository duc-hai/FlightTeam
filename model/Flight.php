<?php
    class Flight{
        // public $idBooking;
        // public $seatPosition;
        // public $enntranceGate;   
        // public $ticketType;
        // public $idFlight;
        // public $airName;
        // public $flightDate;
        // public $landingDay;
        // public $priceTicket;

        // public $customePhoneNumber;
        // public $nameCustomer;
        // public $customerBirthday;
        // public $cccd_passport;
        // public $typeCustomer;
        // public $baggageNumber;
        // public $bookingDate;

        // public $Iddepartureair;
        // public $IdEndAir;
        
        // public $idpay;
        // public $payerName;
        // public $payMethods;
        // public $paymentdate;

        // public $datein;
        // public $dateout;


        // public function __construct ($idBooking, $seatPosition,$enntranceGate, $idFlight,$airName,$flightDate,$landingDay,$priceTicket,
        // $customePhoneNumber,$nameCustomer,$customerBirthday,$cccd_passport,$typeCustomer,$baggageNumber,$bookingDate,$idpay,$payerName,
        // $payMethods,$paymentdate,$datein,$dateout,$Iddepartureair,$IdEndAir) {
            
        //     $this->idBooking = $idBooking;
        //     $this->seatPosition = $seatPosition;
        //     $this->enntranceGate = $enntranceGate;
        //     $this->ticketType = $ticketType;
        //     $this->idFlight = $idFlight;
        //     $this->airName = $airName;
        //     $this->flightDate = $flightDate;
        //     $this->landingDay = $landingDay;
        //     $this->priceTicket = $priceTicket;

        //     $this->customePhoneNumber = $customePhoneNumber;
        //     $this->nameCustomer = $nameCustomer;
        //     $this->customerBirthday = $customerBirthday;
        //     $this->cccd_passport = $cccd_passport;
        //     $this->typeCustomer = $typeCustomer;
        //     $this->baggageNumber = $baggageNumber ;
        //     $this->bookingDate = $bookingDate;

        //     $this->idpay = $idpay;
        //     $this->payerName = $payerName;
        //     $this->payMethods = $payMethods;
        //     $this->paymentdate = $paymentdate;

        //     $this->datein = $datein;
        //     $this->dateount = $dateout;

        //     $this->Iddepartureair = $Iddepartureair;
        // }

        public static function getAllTicket() {
           require_once ('connection.php');
            $conn = connection::connectToDatabase ();

            $sql = "SELECT vb.madatcho,vb.vitrighe,vb.congvao,vb.tonggiave,vb.loaive,cb.machuyenbay,cb.tenmaybay,cb.ngaydi,cb.ngayden
            FROM vemaybay as vb, chuyenbay as cb
            WHERE vb.machuyenbay = cb.machuyenbay";

            $result = $conn -> query ($sql);
            $data = [];
            while ($r = $result -> fetch_assoc ()) {
                $data[] = ["idBooking"=> $r["madatcho"],"seatPosition"=> $r["vitrighe"],"enntranceGate"=>$r["congvao"],"ticketType"=>$r['loaive'],
                "idFlight"=>$r["machuyenbay"],"airName"=>$r["tenmaybay"],"flightDate"=>$r["ngaydi"],"landingDay"=>$r["ngayden"],"priceTicket"=>$r["tonggiave"]];
            }
            return $data;
        }

        public static function getHistoryTicket(){
            require_once ('connection.php');
            $conn = connection::connectToDatabase ();

            $sql = "SELECT * FROM vemaybay,thanhtoan WHERE vemaybay.magiaodich = thanhtoan.magiaodich";

            $result = $conn -> query ($sql);
            $data = [];
            while ($r = $result -> fetch_assoc ()) {
                $data[] = ["idBooking"=> $r["madatcho"],"customePhoneNumber"=> $r["sodienthoaikhachdangnhap"],"nameCustomer"=> $r["hotenkhachhang"],
                "customerBirthday"=> $r["ngaysinhkhachhang"],"cccd_passport"=>$r["cccd_passport"],"typeCustomer"=>$r['loaikhachhang'],
                "seatPosition"=>$r["vitrighe"],"enntranceGate"=>$r["congvao"],"baggageNumber"=>$r["sohangly_tuixach"],"bookingDate"=>$r["ngaydat"],
                "idFlight"=>$r["machuyenbay"],"idpay"=>$r["magiaodich"],"payerName"=>$r["tenkhachhang"],"payMethods"=>$r["phuongthucthanhtoan"],
                "paymentdate"=>$r["ngaygiaodich"],"priceTicket"=>$r["tonggiave"]];
            }
            return $data;
        }
        public static function getRevenue($datein,$dateout){
            require_once ('connection.php');
            $conn = connection::connectToDatabase ();

            $sql = "SELECT *FROM vemaybay,thanhtoan WHERE vemaybay.magiaodich = thanhtoan.magiaodich and ngaydat >= '$datein' AND ngaydat <= '$dateout'";

            $result = $conn -> query ($sql);
            $data = [];
            while ($r = $result -> fetch_assoc ()) {
                $data[] = ["idBooking"=> $r["madatcho"],"customePhoneNumber"=> $r["sodienthoaikhachdangnhap"],"nameCustomer"=> $r["hotenkhachhang"],
                "customerBirthday"=> $r["ngaysinhkhachhang"],"cccd_passport"=>$r["cccd_passport"],"typeCustomer"=>$r['loaikhachhang'],
                "seatPosition"=>$r["vitrighe"],"enntranceGate"=>$r["congvao"],"baggageNumber"=>$r["sohangly_tuixach"],"bookingDate"=>$r["ngaydat"],
                "idFlight"=>$r["machuyenbay"],"idpay"=>$r["magiaodich"],"payerName"=>$r["tenkhachhang"],"payMethods"=>$r["phuongthucthanhtoan"],
                "paymentdate"=>$r["ngaygiaodich"],"priceTicket"=>$r["tonggiave"],"ticketType"=>$r["loaive"]];
            }
            return $data;
        }
        public static function getInforHistory($idBooking){
            require_once ('connection.php');
            $conn = connection::connectToDatabase ();
            $sql = "SELECT * FROM vemaybay,thanhtoan WHERE vemaybay.magiaodich = thanhtoan.magiaodich and madatcho = '$idBooking'";

            $result = $conn -> query ($sql);
            $data = [];
            while ($r = $result -> fetch_assoc ()) {
                $data[] = ["idBooking"=> $r["madatcho"],"customePhoneNumber"=> $r["sodienthoaikhachdangnhap"],"nameCustomer"=> $r["hotenkhachhang"],
                "customerBirthday"=> $r["ngaysinhkhachhang"],"cccd_passport"=>$r["cccd_passport"],"typeCustomer"=>$r['loaikhachhang'],
                "seatPosition"=>$r["vitrighe"],"enntranceGate"=>$r["congvao"],"baggageNumber"=>$r["sohangly_tuixach"],"bookingDate"=>$r["ngaydat"],
                "idFlight"=>$r["machuyenbay"],"idpay"=>$r["magiaodich"],"payerName"=>$r["tenkhachhang"],"payMethods"=>$r["phuongthucthanhtoan"],
                "paymentdate"=>$r["ngaygiaodich"],"priceTicket"=>$r["tonggiave"]];
            }
            return $data;
        }

        public static function getflight(){
            require_once ('connection.php');
            $conn = connection::connectToDatabase ();
            $sql = "SELECT * FROM chitietchuyenbay,chuyenbay WHERE chitietchuyenbay.machuyenbay = chuyenbay.machuyenbay";
            $result = $conn -> query ($sql);
            $data = [];
            while ($r = $result -> fetch_assoc ()) {
                $data[] = ["idFlight"=> $r["machuyenbay"],"airName"=> $r["tenmaybay"],"flightDate"=>$r["ngaydi"],"landingDay"=>$r["ngayden"],"Iddepartureair"=>$r["masanbay"]];
            }
            return $data;
        }

        public static function addflight($idFlight,$airName,$flightDate,$landingDay,$Iddepartureair,$IdArrivalAir){
            require_once ('connection.php');
            $conn = connection::connectToDatabase ();
            $sql = "INSERT INTO `chuyenbay`(`machuyenbay`, `tenmaybay`, `ngaydi`, `ngayden`) 
            VALUES ('$idFlight','$airName','$flightDate','$landingDay')";
            $result = $conn -> query ($sql);

            $sql2 = "INSERT INTO `chitietchuyenbay`(`masanbay`, `machuyenbay`) 
            VALUES ('$Iddepartureair','$idFlight')";
            $result = $conn -> query ($sql2);
            
            $sql3 = "INSERT INTO `chitietchuyenbay`(`masanbay`, `machuyenbay`) 
            VALUES ('$IdArrivalAir','$idFlight')";
            $result = $conn -> query ($sql3);
        }
        

        public static function editflight($idFlight,$airName,$flightDate,$landingDay,$Iddepartureair){
            require_once ('connection.php');
            $conn = connection::connectToDatabase ();
            $sql = "UPDATE `chuyenbay` SET `tenmaybay`='$airName',`ngaydi`='$flightDate',`ngayden`='$landingDay'
            WHERE machuyenbay = '$idFlight'";
            $result = $conn -> query ($sql);
            $sql2 = "UPDATE `chitietchuyenbay` SET `masanbay`='$Iddepartureair'  WHERE machuyenbay = '$idFlight'";
            $result = $conn -> query ($sql2);
        }
        public static function getAir(){
            require_once ('connection.php');
            $conn = connection::connectToDatabase ();
            $sql = "SELECT `masanbay`FROM `sanbay`";
            $result = $conn -> query ($sql);
            $data = [];
            while ($r = $result -> fetch_assoc ()) {
                $data[] = ["idAir"=> $r["masanbay"]];
            }
            return $data;
        }
        
    }
?>
