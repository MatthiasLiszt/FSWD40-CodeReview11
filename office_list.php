<html>
<link rel="stylesheet" href="officelist.css">
<body>
<officelist>
<?php
  include 'dbconnect.php';

  $connect=connectDB();

  function getOfficeList($connect){
   $sql="select officeName, officeAddress from office";
   $result=mysqli_query($connect,$sql);
   if(mysqli_num_rows($result)>0)
    {while($row = mysqli_fetch_assoc($result))
      {echo "<office>";
       echo "<officeName>".$row['officeName']."</officeName>";
       echo "<officeAddress>".$row['officeAddress']."</officeAddress>";
       echo "</office>";
      }  
    }
  }

  getOfficeList($connect);
?>
</officelist>
</body>
</html>