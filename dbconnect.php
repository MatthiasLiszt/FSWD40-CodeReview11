<?php

  define('DBHOST', 'localhost');
  define('DBUSER', 'root');
  define('DBPASS', '');
  define('DBNAME', 'cr11_Matthias_Liszt_php_car_rental');

 function connectDB()
  {$conn = mysqli_connect(DBHOST,DBUSER,DBPASS,DBNAME);


     if ( !$conn ) {
      die("Connection failed : " . mysqli_error());
     }
    return $conn; 
   } 
?>