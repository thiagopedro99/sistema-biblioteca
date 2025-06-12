<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sistema Biblioteca Cesumar</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 50px;
            background-color: #f4f4f4;
        }
        .container {
            background: white;
            padding: 30px;
            margin: 0 auto;
            width: 60%;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            margin-bottom: 30px;
        }
        .menu {
            margin-top: 20px;
        }
        .menu a {
            display: inline-block;
            padding: 10px 20px;
            margin: 0 10px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .menu a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>📚 Sistema Biblioteca Cesumar</h1>
        <p>Bem-vindo ao sistema de gerenciamento de livros!</p>
        
        <div class="menu">
            <a href="livros?acao=listar">📚 Listar Livros</a>
            <a href="livros?acao=novo">➕ Cadastrar Livro</a>
        </div>
        
        <p style="margin-top: 30px; color: #666;">
            <strong>Status:</strong> Sistema funcionando! ✅<br>
            <small>Data: <%= new java.util.Date() %></small>
        </p>
    </div>
</body>
</html>