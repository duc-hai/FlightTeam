<?php    
    class connection {
        //Config your database here
        private $host = 'localhost';
        private $username = 'root';
        private $password = '';
        private $dbName = 'air_ticket_management';
        
        //Not use
        public function __construct ($host, $username, $password, $dbName) {
            $this->host = $host;
            $this->username = $username;
            $this->password = $password;
            $this->dbName = $dbName;
        }

        //The way to call connect database:
        //$conn = connection::connectToDatabase ();
        public function connectToDatabase () {
            $conn = new mysqli ($this->host, $this->username, $this->password, $this->dbName);
            //Check connection status later
            // if ($conn -> connect_error) {
            //     die ("Unable to connect database");
            // }    
            return $conn;
        }

        public function get_host () {
            return $this->host;
        }

        public function get_username () {
            return $this->username;
        }

        public function get_password () {
            return $this->password;
        }

        public function get_dbName () {
            return $this->dbName;
        }

        public function set_host ($host) {
            $this->host = $host;
        }

        public function set_username ($username) {
            $this->username = $username;
        }

        public function set_password ($password) {
            $this->password = $password;
        }

        public function set_dbName ($dbName) {
            $this->dbName = $dbName;
        }
    }
?>