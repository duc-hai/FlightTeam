<?php
class poster
{
    public static function inforPoster($idPost) {
        require_once ('connection.php');
         $conn = connection::connectToDatabase ();

         $sql = "SELECT * FROM baiviet,banner WHERE baiviet.mabaiviet = banner.mabaiviet And baiviet.mabaiviet = '$idPost'";

         $result = $conn -> query ($sql);
         $data = [];
         while ($r = $result -> fetch_assoc ()) {
             $data[] = ["idPost"=> $r["mabaiviet"],"namePosst"=> $r["tenbaiviet"],"datelpost"=>$r["chitietbai"],"datePost"=>$r['ngaydang'],
             "imgPost"=>$r["anhbanner"]];
         }
         return $data;
     }
}

?>