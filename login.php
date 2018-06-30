<?php
 
  include 'dbconnect.php';  
 
  function isInDatabase($connect,$user,$pass){
   $sql="select userName from userLog where userName='$user' and password='$pass'";
   $result=mysqli_query($connect,$sql);
   if(mysqli_num_rows($result)>0){return true;}else{return false;}
  } 

 $connect=connectDB();
 $username=$_POST['username'];
 $password=$_POST['password'];
 $hash=hash('sha256',$password);

 if(isInDatabase($connect,$username,$hash))
  { $logdata="{ \"Login\": true, \"Sites\": ";
    $logdata.="{\"offices\": \"office_list.php\",\"cars\": \"cars_list.php\",\"locFilter\": \"location_filter.php\"},";
    $logdata.=" \"Admin\": false ";
    $logdata.="}";
    if($username=="Admin")
     {$logdata="{ \"Login\": true, \"Sites\": "; 
      $logdata.="{\"offices\": \"office_list.php\",\"cars\": \"cars_list.php\",\"locFilter\": \"location_filter.php\"},";
      $logdata.=" \"Admin\": true, \"AdminSite\": \"report.php\" ";
      $logdata.="}";
     }
  }
 else
  {$logdata="{ \"Login\": false, Sites: {\"nothing\": \"nothing\"}, Admin: false}";}


 echo $logdata;
?>
