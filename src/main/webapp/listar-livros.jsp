<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Livros - Sistema Biblioteca Cesumar</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 1000px;
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
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .acoes a:hover {
            background-color: #0056b3;
        }
        .acoes .btn-novo {
            background-color: #28a745;
        }
        .acoes .btn-novo:hover {
            background-color: #1e7e34;
        }
        .alert {
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 5px;
            text-align: center;
        }
        .alert-success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        .alert-error {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f8f9fa;
            font-weight: bold;
            color: #333;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        .btn-excluir {
            background-color: #dc3545;
            color: white;
            padding: 5px 10px;
            text-decoration: none;
            border-radius: 3px;
            font-size: 12px;
        }
        .btn-excluir:hover {
            background-color: #c82333;
        }
        .sem-livros {
            text-align: center;
            padding: 40px;
            color: #666;
            font-style: italic;
        }
        .info {
            background-color: #e9ecef;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
            text-align: center;
        }
    </style>
    <script>
        function confirmarExclusao(titulo, id) {
            if (confirm('Tem certeza que deseja excluir o livro "' + titulo + '"?')) {
                window.location.href = 'livros?acao=excluir&id=' + id;
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>📚 Lista de Livros</h1>
        
        <div class="acoes">
            <a href="index.jsp">🏠 Início</a>
            <a href="livros?acao=novo" class="btn-novo">➕ Cadastrar Novo Livro</a>
        </div>
        
        <c:if test="${param.sucesso == 'cadastrado'}">
            <div class="alert alert-success">
                ✅ Livro cadastrado com sucesso!
            </div>
        </c:if>
        
        <c:if test="${param.sucesso == 'excluido'}">
            <div class="alert alert-success">
                ✅ Livro excluído com sucesso!
            </div>
        </c:if>
        
        <c:if test="${param.erro == 'nao_encontrado'}">
            <div class="alert alert-error">
                ❌ Livro não encontrado para exclusão!
            </div>
        </c:if>
        
        <c:if test="${param.erro == 'exclusao'}">
            <div class="alert alert-error">
                ❌ Erro ao excluir livro!
            </div>
        </c:if>
        
        <div class="info">
            <strong>Total de livros cadastrados:</strong> ${totalLivros}
        </div>
        
        <c:choose>
            <c:when test="${not empty livros}">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Título</th>
                            <th>Autor</th>
                            <th>Ano</th>
                            <th>ISBN</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="livro" items="${livros}">
                            <tr>
                                <td>${livro.id}</td>
                                <td><strong>${livro.titulo}</strong></td>
                                <td>${livro.autor}</td>
                                <td>${livro.anoPublicacao}</td>
                                <td>${livro.isbn}</td>
                                <td>
                                    <a href="javascript:void(0)" 
                                       onclick="confirmarExclusao('${livro.titulo}', ${livro.id})" 
                                       class="btn-excluir">
                                        🗑️ Excluir
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <div class="sem-livros">
                    <h3>📖 Nenhum livro cadastrado ainda</h3>
                    <p>Clique em "Cadastrar Novo Livro" para adicionar o primeiro livro!</p>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>