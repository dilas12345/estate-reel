<html>
    <head>
        <title>Estate R&eacuteel</title>
         <link rel="stylesheet" type="text/css" href="CSS/mainLayout.css">
        <link rel="stylesheet" type="text/css" href="CSS/userManagementLayout.css">
    </head>
<?php
	include('header.php');
	$databaseObj->createConnection();

	if(isset($_POST['delete'])){
		$productObj->deleteProduct($_POST['hiddenID']);
	}elseif(isset($_POST['edit'])){
		$allResult = $productObj->displayProduct("SELECT * FROM apartment_house WHERE apartment_houseId = '" . $_POST['hiddenID'] . "'");
?>
		<form name="editForm" method="POST" action="">
		<h2>Edit Form</h2>
		<table align="center">
			<tbody>
				<?php 
					if(count($allResult) > 0){
						for($row = 0; $row < count($allResult); $row++){
							echo "<tr><td>House no</td>" 				. "<td><input name='house_no' type='text' value='" 		. $allResult[$row]['house_no'] 			."'></td></tr>" .
								 "<tr><td>Street name</td>" 			. "<td><input name='street_name' type='text' value='" 	. $allResult[$row]['street_name'] 		."'></td></tr>" .
								 "<tr><td>Apartment no</td>" 			. "<td><input name='apartment_no' type='text' value='" 	. $allResult[$row]['apartment_no'] 		."'></td></tr>" .
								 "<tr><td>City</td>" 					. "<td><input name='city' type='text' value='" 			. $allResult[$row]['city'] 				."'></td></tr>" .
								 "<tr><td>State</td>" 					. "<td><input name='state' type='text' value='" 		. $allResult[$row]['province'] 			."'></td></tr>" .
								 "<tr><td>Country</td>" 				. "<td><input name='country' type='text' value='" 		. $allResult[$row]['country'] 			."'></td></tr>" .
								 "<tr><td>Zip</td>" 					. "<td><input name='zip' type='text' value='" 			. $allResult[$row]['zip_code'] 			."'></td></tr>" .
								 "<tr><td>Type</td>" 					. "<td><input name='range' type='text' value='" 		. $allResult[$row]['type'] 				."'></td></tr>" .
								 "<tr><td>Description</td>" 			. "<td><input name='description' type='text' value='" 	. $allResult[$row]['description'] 		."'></td></tr>" .
								 "<tr><td>Number of Rooms</td>" 		. "<td><input name='rooms' type='text' value='" 		. $allResult[$row]['no_of_rooms'] 		."'></td></tr>" .
								 "<tr><td>Number of Bathrooms</td>" 	. "<td><input name='bathrooms' type='text' value='" 	. $allResult[$row]['no_of_bathrooms'] 	."'></td></tr>" .
								 "<tr><td>Number of Living romms</td>" 	. "<td><input name='living_rooms' type='text' value='"	. $allResult[$row]['no_of_living_rooms']."'></td></tr>" .
								 "<tr><td>Price</td>" 					. "<td><input name='price' type='text' value='" 		. $allResult[$row]['price'] 			."'></td></tr>";
						    echo "<input name='hiddenID' type='hidden' value='" . $allResult[$row]['apartment_houseId'] . "'/>
	                             <td><input name='update' type='submit' value='Update' /></td>";
						}
					}
				?>
			</tbody>
		</table>
	</form>
<?php
	}elseif(isset($_POST['update'])){
		$productObj->insertOrUpdateProduct($_POST);
	}
	$userId = $loginObj->getUserId();
	$rs = $productObj->displayProduct("SELECT * FROM apartment_house INNER JOIN apartment_images 
								ON apartment_house.apartment_houseId = apartment_images.apartment_houseId
								WHERE apartment_house.user_id = $userId
								GROUP BY apartment_house.apartment_houseId");
?>
	<h2>List of Apartments/Houses</h2>
	<table border="1" align="center">
		<tbody>
			<tr>
				<th>Image</th>
				<th>Description</th>
				<th>Price</th>
				<th>Options</th>
			</tr>
			<?php
				if (count($rs) > 0) {
					for($row = 0; $row < count($rs); $row++){
						echo "<tr>";
						echo "<td><img style='width:100px;height:100px;' src='apartment_images/" . $rs[$row]['file_name'] . "'/></td>" .
							 "<td>" . $rs[$row]['description'] . "</td>" .
							 "<td>" . $rs[$row]['price'] . "</td>";
			?>
						<form name="deleteApart" method="POST" action="">
							<input name="hiddenID" type="hidden" value="<?php echo $rs[$row]['apartment_houseId']; ?>" />
							<td>
								<input name='delete' type='submit' value='Delete' />
								<input name='edit' type='submit' value='Edit' />
							</td>
						</form>
						<form name="showApart" method="GET" action="showDetails.php">
							<td>
								<input name="hiddenID" type="hidden" value="<?php echo $rs[$row]['apartment_houseId']; ?>" />
								<input name='showDetail' type='submit' value='Show Details' />
							</td>
						</form>
			<?php
						echo "</tr>";
					}
				}
			?>
		</tbody>
	</table>
</body>
</html>