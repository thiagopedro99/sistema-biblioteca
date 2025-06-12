<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cadastrar Livro - Sistema Biblioteca Cesumar</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
        }
        .acoes {
            margin-bottom: 20px;
            text-align: center;
        }
        .acoes a {
            display: inline-block;
            padding: 10px 20px;
            margin: 0 10px;
            background-color: #6c757d;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .acoes a:hover {
            background-color: #545b62;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #333;
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
        }
        input:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0 0 5px rgba(0,123,255,0.3);
        }
        .btn-submit {
            background-color: #28a745;
            color: white;
            padding: 12px 30px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s;
        }
        .btn-submit:hover {
            background-color: #218838;
        }
        .alert-error {
            background-color: #f8d7da;
            color: #721c24;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
            border: 1px solid #f5c6cb;
            text-align: center;
        }
        .form-info {
            background-color: #e9ecef;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
            font-size: 14px;
            color: #6c757d;
        }
        .required {
            color: #dc3545;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>➕ Cadastrar Novo Livro</h1>
        
      
        <div class="acoes">
            <a href="index.jsp">🏠 Início</a>
            <a href="livros?acao=listar">📚 Ver Lista de Livros</a>
        </div>
        
        <c:if test="${not empty erro}">
            <div class="alert-error">
                ❌ ${erro}
            </div>
        </c:if>
        
        <div class="form-info">
            <strong>ℹ️ Instruções:</strong><br>
            • Todos os campos são obrigatórios<br>
            • O ISBN deve ser único (não pode repetir)<br>
            • Ano deve ser um número válido
        </div>
        
        <form action="livros" method="post">
            <input type="hidden" name="acao" value="cadastrar">
            
            <div class="form-group">
                <label for="titulo">Título <span class="required">*</span></label>
                <input type="text" 
                       id="titulo" 
                       name="titulo" 
                       placeholder="Digite o título do livro"
                       value="${param.titulo}"
                       maxlength="200"
                       required>
            </div>
            
            <div class="form-group">
                <label for="autor">Autor <span class="required">*</span></label>
                <input type="text" 
                       id="autor" 
                       name="autor" 
                       placeholder="Digite o nome do autor"
                       value="${param.autor}"
                       maxlength="150"
                       required>
            </div>
            
            <div class="form-group">
                <label for="anoPublicacao">Ano de Publicação <span class="required">*</span></label>
                <input type="number" 
                       id="anoPublicacao" 
                       name="anoPublicacao" 
                       placeholder="Ex: 2023"
                       value="${param.anoPublicacao}"
                       min="1000" 
                       max="2025"
                       required>
            </div>
            
            <div class="form-group">
                <label for="isbn">ISBN <span class="required">*</span></label>
                <input type="text" 
                       id="isbn" 
                       name="isbn" 
                       placeholder="Ex: 978-85-7522-XXX-X"
                       value="${param.isbn}"
                       maxlength="20"
                       required>
            </div>
            
            <button type="submit" class="btn-submit">
                💾 Cadastrar Livro
            </button>
        </form>
    </div>
    
    <script>
        // Validação simples no frontend
        document.querySelector('form').addEventListener('submit', function(e) {
            const titulo = document.getElementById('titulo').value.trim();
            const autor = document.getElementById('autor').value.trim();
            const ano = document.getElementById('anoPublicacao').value;
            const isbn = document.getElementById('isbn').value.trim();
            
            if (!titulo || !autor || !ano || !isbn) {
                e.preventDefault();
                alert('Por favor, preencha todos os campos obrigatórios!');
                return;
            }
            
            if (ano < 1000 || ano > 2025) {
                e.preventDefault();
                alert('Ano de publicação deve estar entre 1000 e 2025!');
                return;
            }
        });
    </script>
</body>
</html>