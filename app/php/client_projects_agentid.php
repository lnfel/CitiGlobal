<?php
	session_start();
	include "connection.php";
	// DB table to use
	$table = 'project';

	// Table's primary key
	$primaryKey = 'ProjectID';

	// indexes
	$columns = array(
		array( 'db' => 'Unit', 'dt' => 0 ),
		array( 'db' => 'ProjectName', 'dt' => 1 ),
		array( 'db' => 'EstimatedAmount',	'dt' => 2 ),
		array( 'db' => 'BuyingStage', 'dt' => 3 ),
		array( 'db' => 'ClientID', 'dt' => 4 ),
		array( 'db' => 'AccountID', 'dt' => 5 )
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

	/*Throw AgentID from Session*/
  	$agentID = $_SESSION['ID'];
  	/*Catch ClientID from ajax POST*/
  	/*$_SESSION['clientID'] = $_POST['clientID'];*/
  	$clientID = $_POST['clientID'];
  	/*echo $clientID;*/ /*it works :)*/
  	/*echo $agentID;*/
  	/*WHERE clause*/
  	$where = "ClientID = ".$clientID." AND AccountID = ".$agentID;
  	/*$where = "AgentID = $agentID";*/
  	/*https://github.com/DataTables/DataTablesSrc/blob/master/examples/server_side/scripts/ssp.class.php#L276*/
  	
  	echo json_encode(
		SSP::complex( $_GET, $sql_details, $table, $primaryKey, $columns, $where )
	);

  	/*Select all projects by agentID and clientID*/
  	/*$clientProjectsSelect = "SELECT * FROM project WHERE ClientID = $clientID AND AgentID = $agentID";
  	$clientProjectsResult = $conn->query($clientProjectsSelect);
  	$clientProjectsRows = $clientProjectsResult->fetch_assoc();*/


?>