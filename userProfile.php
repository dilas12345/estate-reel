<html>
    <head>
        <title>Estate R&eacuteel</title>
        <link rel="stylesheet" type="text/css" href="CSS/mainLayout.css">
        <script type= "text/javascript" src = "JS/countries.js"></script>
    </head>	
	<?php include('PreCode/header.php'); ?>
	<form name="buttons" method="POST" action="">
		<input name="editProfile" type="submit" value="Edit Profile" />
		<input name="changePass" type="submit" value="Change Password" />
		<input name="displayAll" type="submit" value="Display All Users" />
		<input name="deactivate" type="submit" value="Deactivate My Account" />
	<!-- <button type="button" onClick="window.location.href='changePassword.php'">Edit Profile</button>
	<button type="button" onClick="window.location.href='changePassword.php'">Change Password</button>
	<button type="button" onClick="window.location.href='displayAllUsers.php'">DisplayAllProfiles</button> -->
	</form>
	<form name="updateProfile" method="POST" action="">
	<table align="center">
		<tbody>
		<?php
			if(isset($_POST['update'])){
				$loginObj->updateProfile($_POST);
			}
			if(isset($_POST['resetPass'])){
				$old = $_POST['oldPass'];
				$new = $_POST['newPass'];
				$newConfirm = $_POST['confirmNewPass'];
				$loginObj->resetPassword($old, $new, $newConfirm);
			}
			if(isset($_POST['editProfile'])){
				$profileInfo = $loginObj->getUsersProfileInfo();
				if (count($profileInfo) > 0) {
					for($row = 0; $row < count($profileInfo); $row++){
						echo "<h2>User Profile</h2>";
						echo "<tr><td>First Name</td>" . "<td><input name='firstname' type='text' value='" 	. $profileInfo[$row]['firstname'] ."'></td></tr>" .
							 "<tr><td>Last Name</td>"  . "<td><input name='lastname' type='text' value='" 	. $profileInfo[$row]['lastname']  ."'></td></tr>" .
							 "<tr><td>Email</td>" 	   . "<td><input name='email' type='text' value='" 		. $profileInfo[$row]['email'] 	  ."'></td></tr>" .
							 "<tr><td>Username</td>"   . "<td><input name='username' type='text' value='" 	. $profileInfo[$row]['username']  ."'></td></tr>" .
							 "<tr><td>Phone Num</td>"  . "<td><input name='phoneNum' type='text' value='" 	. $profileInfo[$row]['phoneNumber']  ."'></td></tr>" .
							 "<tr><td></td>"   		   . "<td><input name='update' type='submit' value='Save Changes'></td></tr>";
					}
				}
			} elseif (isset($_POST['changePass'])) {
		?>
				<h2>Reset Password</h2>
				<form name="changePass" method="POST" action="">
					<input name="oldPass" type="password" placeholder="Old Password" required /><br>
					<input name="newPass" type="password" placeholder="New Password" required /><br>
					<input name="confirmNewPass" type="password" placeholder="Confirm New Password" required /><br>
					<input name="resetPass" type="submit" value="Reset">
				</form>
		<?php 
					// if(isset($_POST['resetPass'])){
					// 	$old = $_POST['oldPass'];
					// 	$new = $_POST['newPass'];
					// 	$newConfirm = $_POST['confirmNewPass'];
					// 	$loginObj->resetPassword($old, $new, $newConfirm);
					// }
			} elseif (isset($_POST['displayAll'])) {
		?>
				<h2>List of All Users</h2>
				<table align="center" border="1">
					<tbody>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Email</th>
					<?php
						$profileInfo = $loginObj->getAllUsers();
						if (count($profileInfo) > 0) {
							for($row = 0; $row < count($profileInfo); $row++){
								echo "<tr><td>" . $profileInfo[$row]['firstname'] . "</td>" .
									 "<td>" . $profileInfo[$row]['lastname'] . "</td>" .
									 "<td>" . $profileInfo[$row]['email'] . "</td></tr>";
							}
						}
					?>
					</tbody>
				</table>
	<?php 
			} elseif (isset($_POST['deactivate'])) {
				$loginObj->deactivateAccount();
			} 
	?>
		</tbody>
	</table>
	</form>
</section>

</body>
</html>