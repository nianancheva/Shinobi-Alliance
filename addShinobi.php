<?php
    
    require 'DBConfig.php';

  
    $username = $_REQUEST['username'];
    $rankName = $_REQUEST['rank'];

    $sql = "SELECT Rank_Id FROM Ranks where Rank_Name='".$rankName."'";
    $result = $conn->query($sql);
    
    while($row = $result->fetch_assoc()) {
      $rankId = $row["Rank_Id"];
    }
  

    $sql = "INSERT INTO shinobis (IG_Username, Rank_Id, Shinobi_Rank_Date)
    VALUES ('".$username."', '".$rankId."', '".date("d.m.Y")."')";

    if($username == ""){
      echo "<p class='text-pink-600'> <br> Enter Username </p>";
    }
    else{
      if ($conn->query($sql) === TRUE) {

        echo "<p class='text-green-600'> <br> New Shinobi with rank ". $rankName ." Added! </p>";
      } 
      else {
        echo "Error: " . $sql . "<br>" . $conn->error;
      }
    }

?>