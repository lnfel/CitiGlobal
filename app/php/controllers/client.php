<?php
session_start();
include( "../lib/DataTables.php" );

//throw variable values from session
$agentID = $_SESSION['ID'];
$agentTeamID = $_SESSION['teamID'];

// Alias Editor classes so they are easy to use
use
	DataTables\Editor,
	DataTables\Editor\Field,
	DataTables\Editor\Format,
	DataTables\Editor\Mjoin,
	DataTables\Editor\Options,
	DataTables\Editor\Upload,
	DataTables\Editor\Validate,
	DataTables\Editor\ValidateOptions;

// Build our Editor instance and process the data coming from _POST
Editor::inst($db, 'client2')
	->fields(
		Field::inst( 'client2.ClientID' ),
		Field::inst( 'client2.AccountID' ),
		Field::inst( 'client2.TeamID' ),
		Field::inst( 'client2.FirstName' )
			->validator( Validate::notEmpty( ValidateOptions::inst()
				->message( 'A first name is required' )
			) ),
		Field::inst( 'client2.LastName' )
			->validator( Validate::notEmpty( ValidateOptions::inst()
				->message( 'A last name is required' )
			) ),
		Field::inst( 'client2.ContactNumber' ),
		Field::inst( 'client2.Country' )
			->options( Options::inst()
				->table( 'country' )
				->value( 'id' )
				->label( 'nicename' )
			)
			->validator( Validate::dbValues() ),
		Field::inst( 'country.nicename' ),
		Field::inst( 'client2.Unit' ),
		Field::inst( 'client2.ProjectName' )
			->options( Options::inst()
				->table( 'project_name' )
				->value( 'id' )
				->label( 'ProjectName' )
			)
			->validator( Validate::dbValues() ),
		Field::inst( 'project_name.ProjectName' ),
		Field::inst( 'client2.BuyingStage' )
			->options( Options::inst()
				->table( 'buying_stage' )
				->value( 'id' )
				->label( 'name' )
			)
			->validator( Validate::dbValues() ),
		Field::inst( 'buying_stage.name' )
	)
	->where( function($q) use ( $agentID ) {
		$q->where( 'client2.AccountID', $agentID );
	} )
	->leftJoin( 'buying_stage', 'buying_stage.id', '=', 'client2.BuyingStage' )
	->leftJoin( 'country', 'country.id', '=', 'client2.Country' )
	->leftJoin( 'project_name', 'project_name.id', '=', 'client2.ProjectName' )
	->process( $_POST )
	->json();
?>