<?php
	session_start();
	include "connection.php";

  /*Throw AgentID from Session*/
  $agentID = $_SESSION['ID'];

  /*Then select the row from database*/
  $agentSelect = "SELECT * FROM account WHERE AccountID = $agentID";
  $agentResult = $conn->query($agentSelect);
  $agentRow = $agentResult->fetch_assoc();

  /*to get TeamID*/
  $agentTeamID = $agentRow['TeamID'];

	/*Get input values*/
    $firstname = $conn->real_escape_string($_POST["firstname"]);
    $lastname = $conn->real_escape_string($_POST["lastname"]);
    $email = $conn->real_escape_string($_POST["email"]);
    $contactnumber = $conn->real_escape_string($_POST["contactnumber"]);
    $country = $conn->real_escape_string($_POST["country"]);
    $facebook = $conn->real_escape_string($_POST["facebook"]);
    $source = $conn->real_escape_string($_POST["source"]);
    $buyingpurpose = $conn->real_escape_string($_POST["buyingpurpose"]);
    $interestlevel = $conn->real_escape_string($_POST["interestlevel"]);
    $preferredsize = $conn->real_escape_string($_POST["preferredsize"]);
    $note = $conn->real_escape_string($_POST["note"]);

    /*echo $firstname.' '.$lastname.' '.$email.' '.$contactnumber.' '.$country.' '.$facebook.' '.$source.' '.$buyingpurpose.' '.$interestlevel.' '.$preferredsize.' '.$note;*/

    /*Insert to client table*/
    $clientInsert = "INSERT INTO client (
                      TeamID
                      ,FirstName
                      ,LastName
                      ,Email
                      ,ContactNumber
                      ,Country
                      ,Facebook
                      ,AccountID
                      ,Source
                      ,BuyingPurpose
                      ,InterestLevel
                      ,StartDate
                      ,PreferredSize
                      ,Notes
                    ) VALUES (
                      '$agentTeamID'
                      ,'$firstname'
                      ,'$lastname'
                      ,'$email'
                      ,'$contactnumber'
                      ,'$country'
                      ,'$facebook'
                      ,'$agentID'
                      ,'$source'
                      ,'$buyingpurpose'
                      ,'$interestlevel'
                      ,now()
                      ,'$preferredsize'
                      ,'$note'
                    )";

    /*Execute Query*/
    if ($conn->query($clientInsert)) {

    } else {

    }

    /*https://dba.stackexchange.com/questions/124847/best-way-to-get-last-identity-inserted-in-a-table*/

    /*Select last record inserted*/
    $lastSelect = "SELECT * FROM client ORDER BY ClientID desc LIMIT 1";
    $lastResult = $conn->query($lastSelect);
    $lastRow = $lastResult->fetch_assoc();

    /*Get ClientID*/
    $clientid = $lastRow['ClientID'];

    /*Get input value*/
    $project = $conn->real_escape_string($_POST["project"]);

    /*Insert into project table*/
    $projectInsert = "INSERT INTO project (
                      ProjectName
                      ,ClientID
                      ,AccountID
                      ,TeamID
                      ,BuyingStage
                      ,DateAware
                    ) VALUES (
                      '$project'
                      ,'$clientid'
                      ,'$agentID'
                      ,'$agentTeamID'
                      ,'Awareness'
                      ,now()
                    )";

    /*Execute Query*/
    if ($conn->query($projectInsert)) {

    } else {

    }
?>