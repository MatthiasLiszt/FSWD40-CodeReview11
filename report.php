<html>
<style>
.officeName{
 font-weight: bold;
 color: green;
}

.numberCar{
 text-align: right;
}

td{
 padding-top: 0.5em;
}
</style>
<body>
<h1>Admin Report</h1>
<table>
<th>Location Name</th><th>Address Of Location</th><th>Number Of Cars</th>
<?php
  include 'dbconnect.php';

  $connect=connectDB();

  function getNumberOffices($c)
   {$sql="select count(officeId) from office";
    $result=mysqli_query($c,$sql);
    $row = mysqli_fetch_array($result);
    return $row[0];
   }
 
  //echo getNumberOffices($connect);

  function getNumberCars($c,$officeId){
   $sql="select count(carId) from location where officeId=$officeId";
   $result=mysqli_query($c,$sql);
   $row = mysqli_fetch_array($result);
   return $row[0];
  }

  function getOfficeName($c,$officeId){
   $sql="select officeName from office where officeId=$officeId";
   $result=mysqli_query($c,$sql);
   $row = mysqli_fetch_array($result);
   return $row[0];
  }

  function getOfficeAddress($c,$officeId){
   $sql="select officeAddress from office where officeId=$officeId";
   $result=mysqli_query($c,$sql);
   $row = mysqli_fetch_array($result);
   return $row[0];
  }

  $numberOffices=getNumberOffices($connect);

  for($i=1;$i<($numberOffices+1);$i++) // sorry, for being that retro
   {$officeName=getOfficeName($connect,$i);
    $numberCars=getNumberCars($connect,$i);
    $officeAddress=getOfficeAddress($connect,$i);
    echo "<tr><td class='officeName'>".$officeName."</td><td>".$officeAddress."</td>";
    echo "<td class='numberCar'>".$numberCars."</td></tr>";
   }
?>
</table>
</body>
</html>