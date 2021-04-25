<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="https://kit.fontawesome.com/517e6af943.js" crossorigin="anonymous"></script>
</head>

<?php
    // Fazendo Cadastro
    require 'connection.php';
    if (isset($_POST['nome']) and !empty($_POST['nome'])) {
        $nome = $_POST['nome'];
        $email = $_POST['email'];
        $senha = $_POST['senha'];
        // Fazendo uma validação no campo email, verificar se ja não foi cadastrado
        $verificar_email = "SELECT * FROM funcionario WHERE email = '$email'";
        $exec_email = $connection->query($verificar_email);

        if(mysqli_num_rows($exec_email) > 0) {
            echo "<script>alert(' Este e-mail ja foi cadastrado, por favor, tente outro!');</script>";
        }
        else {
            $sql = "INSERT INTO funcionario (id, nome, email, senha) VALUES (null, '$nome', '$email', '$senha')";
            $exec = $connection->query($exec); 
        }
                  
    } 
    // Login
    if (isset($_POST['emaill']) and !empty($_POST['emaill'])) {
        $emaill = mysqli_real_escape_string($connection, $_POST['emaill']);
        $password = mysqli_real_escape_string($connection, $_POST['password']);

        $sql = "SELECT email,senha FROM funcionario WHERE email = '$emaill' and senha='$password'";
        $result = mysqli_query($connection, $sql);

        if (mysqli_num_rows($result) > 0) {
            header('Location: insert.php');
            exit();
        }
        else {
            echo "<script>alert('E-mail ou Senha inválidos!');</script>";
        }
    }    
?>

<body>
    <div class="container">
        <div class="content first-content">
            <div class="first-column">
                <h2 class="title title-primary">Bem-vindo</h2>
                <p class="description">Fique conectado</p>
                <p class="description">por favor, faça seu login</p>
                <button id="signin" class="btn btn-primary">Login</button>
            </div><!-- first-column -->
            
            
            <!--Criar Conta -->
            <div class="second-column">
                <h2 class="title title-second">Criar Conta</h2>
                <form class="form" method="POST">
                    <label class="label-input" for="">
                        <i class="far fa-user icon-modify"></i>
                        <input type="text" placeholder="Nome" name="nome" required>
                    </label>
                    
                    <label class="label-input" for="">
                        <i class="far fa-envelope icon-modify"></i>
                        <input type="email" placeholder="E-mail" name="email" required>
                    </label>
                    
                    <label class="label-input" for="">
                        <i class="fas fa-lock icon-modify"></i>
                        <input type="password" placeholder="Senha" name="senha" required>
                    </label>
                    
                    <button class="btn btn-second">Cadastrar</button>
                </form>
            </div><!-- second-column -->
        </div><!-- first-content -->
        
        
        
        <div class="content second-content">
            <div class="first-column">
                <h2 class="title title-primary">hello, friend!</h2>
                <p class="description">Entre com seus dados pessoais</p>
                <p class="description">e faça seu registro</p>
                <button id="signup" class="btn btn-primary">Cadastrar</button>
            </div><!-- first-column -->
            
            <!--Logar Conta -->
            <div class="second-column">
                <h2 class="tittle title-second">Faça seu Login</h2>
                <form class="form" method="POST">
                    <label class="label-input" for="">
                        <i class="far fa-envelope icon-modify"></i>
                        <input type="email" placeholder="E-mail" name="emaill">
                    </label>

                    <label class="label-input" for="">
                        <i class="fas fa-lock icon-modify"></i>
                        <input type="password" placeholder="Senha" name="password">
                    </label>

                    
                    <button class="btn btn-second" name="entrar">Logar</button>
                </form>
            </div><!-- second-column -->
        </div><!-- second-content -->
    </div>
    <script src="js/app.js"></script>
</body>
</html>

