<?php
	session_start();

	// DB table to use
	$table = 'client';

	// Table's primary key
	$primaryKey = 'ClientID';

	// indexes
	$columns = array(
		array( 'db' => 'FirstName', 'dt' => 0 ),
		array( 'db' => 'LastName',  'dt' => 1 ),
		array( 'db' => 'Email',   'dt' => 2 ),
		array( 'db' => 'ContactNumber',     'dt' => 3 ),
		array( 'db' => 'Country', 'dt' => 4 ),
		array( 'db' => 'Facebook', 'dt' => 5 ),
		array( 'db' => 'Source', 'dt' => 6 ),
		array( 'db' => 'BuyingPurpose', 'dt' => 7 ),
		array( 'db' => 'InterestLevel', 'dt' => 8 ),
		array( 'db' => 'PreferredSize', 'dt' => 9 ),
		array( 'db' => 'Notes', 'dt' => 10 ),
		array( 'db' => 'ClientID', 'dt' => 11 ),
		array( 'db' => 'TeamID', 'dt' => 12 )
	);

	// SQL server connection information
	$sql_details = array(
		'user' => 'root',
		'pass' => '',
		'db'   => 'db_mango',
		'host' => '127.0.0.1'
	);

	/*IMPORTANT ssp.class.php is used alongside data table*/
	require( 'ssp.class.php' );

	/*Throw values from Session*/
  	$agentID = $_SESSION['ID'];
  	$teamID = $_POST['teamID'];

  	/*WHERE clause*/
  	$where = "TeamID = '$teamID'";

  	echo json_encode(
		SSP::complex( $_GET, $sql_details, $table, $primaryKey, $columns, $where )
	);
?>