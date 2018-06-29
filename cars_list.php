<html>
<link rel='stylesheet' href='cars.css'>
<body>

<carlist>
<?php
  include 'dbconnect.php';

  $connect=connectDB();


  function getCarList($connect){
   $sql="select location.carId,car.carId,car.carType,office.officeName from car inner join location on car.carId=location.carId inner join office on office.officeId=location.officeId";
   
   $result=mysqli_query($connect,$sql);
   $pdo=array();

   if(mysqli_num_rows($result)>0)
    {while($row = mysqli_fetch_assoc($result))
      {echo "<car>";
       echo "<carImage><img src='car/car".$row['carId'].".jpeg'></carImage>";
       echo "<carType>".$row['carType']."</carType>";
       echo "<carLocation>".$row['officeName']."</carLocation>";
       echo "</car>";
       
       
       
      }  
     
    }
  }

  getCarList($connect);
?>
</carlist>
</body>
</html>
