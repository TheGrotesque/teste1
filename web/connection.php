<?php
    $connection = new mysqli('localhost', 'root', '', 'loja_moto', '3307');
        if ($connection->connect_error) {
            die("ERRO: " . $con->connect_error);
        }    
?>