<?php
// SELECT
$sqlSelect = "SELECT";
$result = $conn->query($select_sql);
$row = $result->fetch_assoc();

// ADD
if(isset($_POST['add'])){
	$lastname = mysqli_real_escape_string($conn, $_POST['lastname']);
	$_SESSION['lastname'] = $lastname;
	echo '<script>$("#modal").modal("show").closest("h4").text("'.$_SESSION['lastname'].'");</script>';
}
header('Location: ../s-white/auth-register.html');
?>