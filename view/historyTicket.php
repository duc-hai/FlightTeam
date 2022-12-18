
<!DOCTYPE html>
<html>
<head>
<style>

    /* table{
        width: 80% ;
        margin-left: 4%
        

    } */
    /* table, th, td {
   
        border: 1px solid black;
        text-align: center;

    } */

    table {
        border-collapse: collapse;
        border: 1px solid black;
        text-align: center;
	    vertical-align: middle;

    }

    
    th, td {
    border: 1px solid black;
    padding: 8px;

    }

    thead, th  {
        width: 1%;
        background-color: #333;
        color: white;
    }

    thead {
        background-color: #333;
        color: white;
        font-size: 0.875rem;
        text-transform: uppercase;
        letter-spacing: 2%;
    }   

    .caption {
        font-weight: bold;
        font-size: 10px;
        text-align: left;
        color: #333;
        margin-bottom: 16px;
    }


    .wrap_search{

        margin-top: 5% ;
        margin-bottom: 1%;
        margin-left: 4%
    }

</style>
</head>
<body>


<div class="wrap_search">
    <form action=""  method="get">
       <input name ="search" type="text" class="searchTerm"  placeholder="Nhập mã vé của bạn"
       value ="" >
       <button type="submit" class="searchButton">
         Submit
      </button>
    </form>
 </div>


</body>
</html>



<?php
    // $servername = "localhost";
    // $username = "root";
    // $password = "";
    // $dbname = "air_ticket_management";

    // // Create connection
    // $conn = new mysqli($servername, $username, $password, $dbname);
    // // Check connection
    // if ($conn->connect_error) {
    //     die("Connection failed: " . $conn->connect_error);
    // } 
    require_once("../model/connection.php");
    $conn = connection::connectToDatabase ();



if(isset( $_GET["search"])) {
    $sql = "SELECT * FROM vemaybay where madatcho like'%$_GET[search]%' " ;
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        echo "<table> 
         <thead>
                <tr class= 'caption'>
                    <th>Mã đặt chỗ </th> 
                    <th>Họ tên khách hàng</th>  
                    <th>Ngày sinh khách hàng</th> 
                    <th>Cccd / passport</th>  
                    <th>Loại khách hàng</th>  
                    <th>Vị trí ghế</th>  
                    <th>Cổng vào</th>  
                    <th>Số túi xách / hành lý</th>
                    <th>Tổng giá vé</th>
                    <th>Loại vé</th>
                    <th>Tình trạng</th>
                    <th>Ngày đặt</th>
                </tr>
           </thead>
           "
           ;

        // output data of each row
        while($row = $result->fetch_assoc()) {
            echo "<tr><td>" . $row["madatcho"]. "</td><td>" . $row["hotenkhachhang"]. "</td><td> " . $row["ngaysinhkhachhang"]. "</td><td>" . 
            $row["cccd_passport"]. "</td><td>" . $row["loaikhachhang"]. "</td><td>"  . $row["vitrighe"]. "</td><td>" . $row["congvao"]. "</td><td>" . 
            $row["sohangly_tuixach"]. "</td><td>" . $row["tonggiave"]. "</td><td>". $row["loaive"]. "</td><td>" . $row["tinhtrang"]. "</td><td>"
            . $row["ngaydat"]. "</td>  </tr>" ;
        }
        echo "</table>";
    } else {
        echo "0 results";
    }
}

   


    $conn->close();
?>

