<?php

        require 'DBConfig.php';
        $sql = "SELECT * FROM ShinobiView";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
          // output data of each row
          while($row = $result->fetch_assoc()) {
            echo '
            <tr class="border-gray-700 bg-gray-800 hover:bg-gray-600">
            <th scope="row" class="px-6 py-4 font-medium text-white whitespace-nowrap">
                '.$row["Shinobi_Id"].'
            </th>
            ';

            echo '
            <td class="px-6 py-4">
                '.$row["IG_Username"].'
            </td>
            ';

            echo '
            <td class="px-6 py-4">
                '.$row["Rank_Name"].'
            </td>
            ';

            echo '
            <td class="px-6 py-4">
                '.$row["Shinobi_Rank_Date"].'
            </td>
            ';

            echo '
            <td class="px-6 py-4">
                <a href="#" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Edit</a>
            </td>
             </tr>
            ';

          }
        }
?>