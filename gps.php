<html>
<head>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous">
</script>
<style>
body{
 padding-left: 27px;
 padding-top: 12px;
}

button{
 border: none;
 background-color: transparent;
 color: blue;
}
</style>
</head>
<body>
<h1>GPS Tracking Of Rented Cars</h1>

<?php
 include 'dbconnect.php';
 $connect=connectDB();
 
 // for good reasons the ApiKey is fetched from database (not included in the github repo)
 function getApiKey($c){
  $sql="select apikey from apikey where service='googlemaps'";
  $result=mysqli_query($c,$sql);
  $row = mysqli_fetch_array($result); 
  return $row[0];
 }


 function getRentedCars($c){
  $sql="select car.carType,carSign.carSign,gps.gpsLat,gps.gpsLong,gps.carId,car.carId,carRent.carId ";
  $sql.=" from car inner join carRent ";
  $sql.="on carRent.carId=car.carId inner join gps on gps.carId=carRent.carId ";
  $sql.="inner join carSign on carSign.carId=carRent.carId";
  
  $result=mysqli_query($c,$sql);
  $apikey=getApiKey($c);

  if(mysqli_num_rows($result)>0)
   {while($row=mysqli_fetch_assoc($result))
     {$lat=$row['gpsLat'];
      $lng=$row['gpsLong'];
      echo "<p><strong>".$row['carType']."</strong> ".$row['carSign']." at ".$lat." ".$lng." ";
      //echo $row['carType'];
      echo "<button onclick='showMap(".$lat.",".$lng.",\"".$apikey."\")'>show on map</button></p>";
     }
    //echo $apikey;
   }
  else
   {echo "there are currently no cars rented";}
 }

 getRentedCars($connect);
?>

<div id="map"></div>

<script src="tracking.js"></script>
</body>
</html>