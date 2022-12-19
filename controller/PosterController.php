<?php
require_once("../model/poster.php");
class PosterController
{
    public static function inforPoster($idPost)
    {
        $result = poster::inforPoster($idPost);
        die (json_encode (array('code' => 0, 'data' => $result)));
    }

}
$tikCtr = new PosterController();

if (isset($_GET['action']) && $_GET['action'] == "getinforPost") {
    $idPost = $_GET['idPost'];
    $tikCtr -> inforPoster($idPost);
}
?>