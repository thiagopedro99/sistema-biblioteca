package com.cesumar.biblioteca.controller;

import com.cesumar.biblioteca.dao.LivroDAO;
import com.cesumar.biblioteca.model.Livro;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet("/livros")
public class LivroController extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    private LivroDAO livroDAO;
    
    @Override
    public void init() throws ServletException {
        // Inicializar o DAO
        livroDAO = new LivroDAO();
    }
    

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        String acao = request.getParameter("acao");
        
        if (acao == null || acao.equals("listar")) {
            listarLivros(request, response);
            
        } else if (acao.equals("novo")) {
            mostrarFormularioCadastro(request, response);
            
        } else if (acao.equals("excluir")) {
            excluirLivro(request, response);
            
        } else {
            response.sendRedirect("livros?acao=listar");
        }
    }
    

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        String acao = request.getParameter("acao");
        
        if ("cadastrar".equals(acao)) {
            cadastrarLivro(request, response);
        } else {
            response.sendRedirect("livros?acao=listar");
        }
    }

    private void listarLivros(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            List<Livro> livros = livroDAO.listarTodos();
            
            request.setAttribute("livros", livros);
            request.setAttribute("totalLivros", livros.size());
            
            request.getRequestDispatcher("/listar-livros.jsp").forward(request, response);
            
        } catch (Exception e) {
            request.setAttribute("erro", "Erro ao carregar lista de livros: " + e.getMessage());
            request.getRequestDispatcher("/erro.jsp").forward(request, response);
        }
    }
    
 
    private void mostrarFormularioCadastro(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.getRequestDispatcher("/cadastrar-livro.jsp").forward(request, response);
    }
    
  
    private void cadastrarLivro(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            String titulo = request.getParameter("titulo");
            String autor = request.getParameter("autor");
            String anoStr = request.getParameter("anoPublicacao");
            String isbn = request.getParameter("isbn");
            
            if (titulo == null || titulo.trim().isEmpty() ||
                autor == null || autor.trim().isEmpty() ||
                anoStr == null || anoStr.trim().isEmpty() ||
                isbn == null || isbn.trim().isEmpty()) {
                
                request.setAttribute("erro", "Todos os campos são obrigatórios!");
                request.getRequestDispatcher("/cadastrar-livro.jsp").forward(request, response);
                return;
            }
            
            int anoPublicacao;
            try {
                anoPublicacao = Integer.parseInt(anoStr);
            } catch (NumberFormatException e) {
                request.setAttribute("erro", "Ano de publicação deve ser um número válido!");
                request.getRequestDispatcher("/cadastrar-livro.jsp").forward(request, response);
                return;
            }
            
            Livro novoLivro = new Livro(titulo.trim(), autor.trim(), anoPublicacao, isbn.trim());
            
            if (!novoLivro.isValido()) {
                request.setAttribute("erro", "Dados do livro são inválidos!");
                request.getRequestDispatcher("/cadastrar-livro.jsp").forward(request, response);
                return;
            }
            
            boolean sucesso = livroDAO.adicionarLivro(novoLivro);
            
            if (sucesso) {
                response.sendRedirect("livros?acao=listar&sucesso=cadastrado");
            } else {
                request.setAttribute("erro", "Já existe um livro cadastrado com este ISBN!");
                request.getRequestDispatcher("/cadastrar-livro.jsp").forward(request, response);
            }
            
        } catch (Exception e) {
            request.setAttribute("erro", "Erro ao cadastrar livro: " + e.getMessage());
            request.getRequestDispatcher("/cadastrar-livro.jsp").forward(request, response);
        }
    }
    

    private void excluirLivro(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            String idStr = request.getParameter("id");
            String isbn = request.getParameter("isbn");
            
            boolean sucesso = false;
            
            if (idStr != null && !idStr.trim().isEmpty()) {
                try {
                    int id = Integer.parseInt(idStr);
                    sucesso = livroDAO.removerPorId(id);
                } catch (NumberFormatException e) {
                }
                
            } else if (isbn != null && !isbn.trim().isEmpty()) {
                sucesso = livroDAO.removerPorIsbn(isbn);
            }
            
            if (sucesso) {
                response.sendRedirect("livros?acao=listar&sucesso=excluido");
            } else {
                response.sendRedirect("livros?acao=listar&erro=nao_encontrado");
            }
            
        } catch (Exception e) {
            response.sendRedirect("livros?acao=listar&erro=exclusao");
        }
    }
}