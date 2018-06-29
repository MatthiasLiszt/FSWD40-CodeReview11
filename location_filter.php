<html>
<link rel='stylesheet' href='cars.css'>
<body>

<carlist>
<?php
  include 'dbconnect.php';

  $connect=connectDB();


  function getCarsFilteredByLocation($connect,$loc){
   if($loc!=0)
    {$sql="select location.carId,car.carId,car.carType from car ";
     $sql.="inner join location on car.carId=location.carId where location.officeId=";
     $sql.=$loc;
    }
   else
    {$sql="select location.carId,car.carId,car.carType from car ";
     $sql.="inner join location on car.carId=location.carId";
    }
   
   $result=mysqli_query($connect,$sql);
  
   if(mysqli_num_rows($result)>0)
    {while($row = mysqli_fetch_assoc($result))
      {echo "<car>";
       echo "<carImage><image src='car/car".$row['carId'].".jpeg'></carImage>";
       echo "<carType>".$row['carType']."</carType>";
       echo "</car>";
       
       
       
      }  
     
    }
  }
  
  if(isset($_GET['location']))
   {getCarsFilteredByLocation($connect,$_GET['location']);}
  else
   {getCarsFilteredByLocation($connect,0);}
?>
</carlist>
</body>
</html>
