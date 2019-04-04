<?php
	session_start();

	// DB table to use
	$table = 'project';

	// Table's primary key
	$primaryKey = 'ProjectID';

	// indexes
	$columns = array(
		array( 'db' => 'ProjectID', 'dt' => 0 ),
		array( 'db' => 'Unit', 'dt' => 1 ),
		array( 'db' => 'ProjectName', 'dt' => 2 ),
		array( 'db' => 'FinalAmount',	'dt' => 3 ),
		array( 'db' => 'BuyingStage', 'dt' => 4 ),
		array( 'db' => 'ClientID', 'dt' => 5 ),
		array( 'db' => 'AccountID', 'dt' => 6 )
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
  	/*$clientID = $_POST['clientID'];*/

  	/*WHERE clause*/
  	$where = "AccountID = ".$agentID." AND (BuyingStage = 'Decision - Won')";

  	echo json_encode(
		SSP::complex( $_GET, $sql_details, $table, $primaryKey, $columns, $where )
	);
?>