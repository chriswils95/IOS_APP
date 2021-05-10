<?php
/**
 * Created by PhpStorm.
 * User: Belal
 * Date: 12/08/16
 * Time: 7:58 PM
 */

define('DB_USERNAME', 'root');
define('DB_PASSWORD', 'password');
define('DB_HOST', 'localhost');
define('DB_NAME', 'user');


class DbConnect
{
    private $conn;

    function __construct()
    {
    }

    /**
     * Establishing database connection
     * @return database connection handler
     */
    function connect()
    {

        // Connecting to mysql database
        $this->conn = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);

        // Check for database connection error
        if(mysqli_connect_error()) 
         echo "Connection Error.\n"; 
        else
         echo "Database Connection Successfully.\n";

        // returing connection resource
        return $this->conn;
    }
}