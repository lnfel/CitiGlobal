<?php
/*
 * DataTables example server-side processing script.
 *
 * Please note that this script is intentionally extremely simple to show how
 * server-side processing can be implemented, and probably shouldn't be used as
 * the basis for a large complex system. It is suitable for simple use cases as
 * for learning.
 *
 * See http://datatables.net/usage/server-side for full details on the server-
 * side processing requirements of DataTables.
 *
 * @license MIT - http://datatables.net/license_mit
 */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * Easy set variables
 */
// DB table to use
$table = 'employee';
// Table's primary key
$primaryKey = 'EMPLOYEE_ID';
// Array of database columns which should be read and sent back to DataTables.
// The `db` parameter represents the column name in the database, while the `dt`
// parameter represents the DataTables column identifier. In this case simple
// indexes
$columns = array(
	array( 'db' => 'LAST_NAME', 'dt' => 0 ),
	array( 'db' => 'FIRST_NAME',  'dt' => 1 ),
	array( 'db' => 'EMPLOYEE_ID',   'dt' => 2 ),
	array( 'db' => 'DEPARTMENT_ID',     'dt' => 3 ),
	array( 'db' => 'POSITION_ID', 'dt' => 4 ),
	array( 'db' => 'EMPLOYEE_TYPEID', 'dt' => 5 ),
	array( 'db' => 'STATUS_ID', 'dt' => 6 ),
	array( 'db' => 'TEL_NO', 'dt' => 7 ),
	array( 'db' => 'CONTACT_NO_1', 'dt' => 8 )
);

/*array(
		'db'        => 'start_date',
		'dt'        => 4,
		'formatter' => function( $d, $row ) {
			return date( 'jS M y', strtotime($d));
		}
	),
	array(
		'db'        => 'salary',
		'dt'        => 5,
		'formatter' => function( $d, $row ) {
			return '$'.number_format($d);
		}
	)*/

// SQL server connection information
$sql_details = array(
	'user' => 'root',
	'pass' => '',
	'db'   => 'db_mango',
	'host' => '127.0.0.1'
);
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * If you just want to use the basic configuration for DataTables with PHP
 * server-side, there is no need to edit below this line.
 */
require( 'ssp.class.php' );
echo json_encode(
	SSP::simple( $_GET, $sql_details, $table, $primaryKey, $columns )
);
?>