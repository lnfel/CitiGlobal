<?php
	session_start();
	include "connection.php";

	/*Throw AgentID from Session*/
	$agentID = $_SESSION['ID'];

	/*Get values from POST*/
	$buyingStage = $_POST['buyingStage'];
	/*$clientID = $_POST['clientID'];
	$teamID = $_POST['teamID'];*/
	$projectID = $_POST['projectID'];

	/*Determine what type of decision and find out dateColumn to update*/
	if ($buyingStage == "Lost") {
		$buyingStage = "Decision - Lost";
		$dateStage = "DateDecision";
	} elseif ($buyingStage == "Won") {
		$buyingStage = "Decision - Won";
		$dateStage = "DateDecision";
	} elseif ($buyingStage == "Consideration") {
		$dateStage = "DateConsidered";
	}

	/*SQL Statement*/
	$moveStageSql = "UPDATE project SET BuyingStage = '$buyingStage', $dateStage = now() WHERE ProjectID = $projectID";
	echo $moveStageSql;

	/*Execute Query*/
	$moveStageResult = $conn->query($moveStageSql) or die($conn->error);
?>