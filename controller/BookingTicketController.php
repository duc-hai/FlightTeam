<?php
require_once("../model/account.php");
class BookingTicketController
{
// public function 
    public static function searchFlight ($startPlace, $startDate) {
        $result = Flight::searchFlight($startPlace, $startDate);
        die (json_encode (array('code' => 0, 'data' => $result)));
    }
}


$bookCtr = new BookingTicketController();

if (isset($_GET['action']) && isset($_GET['action']) == "searchFlight") {   
    if (isset($_SESSION['startPlace']) && ($_SESSION['endPlace']) && ($_SESSION['typeTicket']) && ($_SESSION['startDate']) && ($_SESSION['Numpassenger'])) {
        $endDate = "";
        if (isset($_SESSION['endDate'])) {
            $time = strtotime($_SESSION['endDate']);
            if ($time) {
                $endDate = date('Y/m/d', $time);
            }
        }
        $bookCtr->searchFlight($_SESSION['startPlace'],$_SESSION['startDate']);
    }
    else { 
        die (json_encode(array('code' => 1)));
    }
}
// if 