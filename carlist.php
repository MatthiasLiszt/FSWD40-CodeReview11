<carlist>
<?php
  include 'dbconnect.php';

  $connect=connectDB();

  class Car{
   var $Image;
   var $Type;
   function __construct($id,$carType){
    $this->Image="car".$id.".jpg";
    $this->Type=$carType;
   }
  }

  function getCarList($connect){
   /*$sql="select location.carId,car.carId,car.carType,office.officeName from car inner join location on car.carId=location.carId inner join office on office.officeId=location.officeId";*/
   $sql="select carId,carType from car";
   $result=mysqli_query($connect,$sql);
   $pdo=array();

   if(mysqli_num_rows($result)>0)
    {while($row = mysqli_fetch_assoc($result))
      {//echo "<car>";
       //echo "<carImage>car".$row['carId']."</carImage>";
       //echo "<carType>".$row['carType']."</carType>";
       //echo "<carLocation>".$row['officeName']."</carLocation>";
       //echo "</car>";
       //echo "carId ".$row['carId']." carType ".$row['carType']." \n ";
       $x=new Car($row['carId'],$row['carType']);
       //$x->Type=$row['carType'];
       //$x->Image="car".$row['carId'].".jpg";
       //echo json_encode($x);
       
       array_push($pdo,$x);
      }  
     echo json_encode($pdo);
    }
  }

  getCarList($connect);
?>
</carlist>