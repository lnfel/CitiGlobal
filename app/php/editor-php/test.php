<?php
// DataTables PHP library
include( "DataTables.php" );
 
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
 
 
/*
 * Example PHP implementation used for the join.html example
 */
Editor::inst( $db, 'client' )
    ->field(
        Field::inst( 'client.FirstName' ),
        Field::inst( 'client.LastName' ),
        Field::inst( 'client.ContactNumber' ),
        Field::inst( 'client.Country' )
            ->options( Options::inst()
                ->table( 'project' )
                ->value( 'ProjectID' )
                ->label( 'ProjectName' )
            )
            ->validator( Validate::dbValues() ),
        Field::inst( 'project.ProjectName' )
    )
    ->leftJoin( 'project', 'project.ClientID', '=', 'client.ClientID' )
    ->process($_POST)
    ->json();
?>