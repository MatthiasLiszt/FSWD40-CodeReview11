<html>
<link rel='stylesheet' href='cars.css'>
<body>

<carlist>
<?php
  include 'dbconnect.php';

  $connect=connectDB();


  function getCarList($connect){
   $sql="select location.carId,car.carId,car.carType,office.officeName,car.power,car.seats,";
   $sql.="car.prodYear from car inner join location on car.carId=location.carId";
   $sql.=" inner join office on office.officeId=location.officeId";
   
   $result=mysqli_query($connect,$sql);
   $pdo=array();

   if(mysqli_num_rows($result)>0)
    {while($row = mysqli_fetch_assoc($result))
      {echo "<car>";
       echo "<carImage><img src='car/car".$row['carId'].".jpeg'></carImage>";
       echo "<carType>".$row['carType']."</carType>";
       echo "<carLocation>".$row['officeName']."</carLocation>";
       echo "<carAddInfo>";
       echo "<carSeats>".$row['seats']. " seats</carSeats>";
       echo "<carPower>".$row['power']. " kW</carPower>";
       echo "<carYear>".$row['prodYear']. "</carYear>";
       echo "</carAddInfo>";
       echo "</car>";
       
       
       
      }  
     
    }
  }

  getCarList($connect);
?>
</carlist>
</body>
</html>
