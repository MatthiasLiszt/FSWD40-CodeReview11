<?php
  include 'dbconnect.php';

  $connect=connectDB();

  class Office
   { var $id;
     var $name;
     
     function __construct($id,$name){
      $this->id=$id;
      $this->name=$name;
     }
   }


  function getOfficeListJson($connect){
   $sql="select officeName, officeId from office";
   $result=mysqli_query($connect,$sql);
   $pdo=array();
   if(mysqli_num_rows($result)>0)
    {while($row = mysqli_fetch_assoc($result))
      {$x=new Office($row['officeId'],$row['officeName']);
       array_push($pdo,$x);
      }
     echo json_encode($pdo);  
    }
    
  }

  getOfficeListJson($connect);
?>
