<?php




class Db
{

  private $conn;


function __construct()
{
        require_once dirname(__FILE__) . '/connect.php';
        // opening db connection
        $db = new DbConnect();
        $this->conn = $db->connect();
 }   


function insert_into_db($username, $password){
    $connection = $this->conn;
    $stmt = $connection->prepare("INSERT INTO user(username, password) values(?, ?)");
    $stmt->bind_param("ss", $username, $password);
    $result = $stmt->execute();
    $stmt->close();
    $this->CloseCon();
    if ($result) {
        return true;
    } else {
        return false;
    }
}


function find_user($username, $password){
    $connection = $this->conn;
    $stmt = $connection->prepare("SELECT username,password FROM user WHERE username = ? AND password = ?");
    $stmt->bind_param("ss", $username, $password);
    $result = $stmt->execute();
    while($row = $stmt->fetch()) {
        $stmt->close();
        $this->CloseCon();
        if(sizeof($row) > 0){
            return true;
        }
        return false;
    }

}
 
function CloseCon()
 {
    mysqli_close($this->conn);
}
    


}


    

    
    
    
    

$response = array();
if($_SERVER['REQUEST_METHOD']=='POST'){

   //getting values
   $username = $_POST['username'];
   $password = $_POST['password'];
   $db = Db();
   $user = $db->find_user($username, $password);
   $response['message'] = $user;
   echo json_encode($response);

}
else{
    $response['message'] = "error";
    echo json_encode($response);

}

   
?>
