package com.cesumar.biblioteca.dao;
import com.cesumar.biblioteca.model.Livro;
import java.util.*;

public class LivroDAO {
	
	 private static List<Livro> livros = new ArrayList<>();
	 private static int proximoId = 1;
	 
	 static {
	        livros.add(new Livro(proximoId++, "Clean Code", "Robert C. Martin", 2008, "978-0132350884"));
	        livros.add(new Livro(proximoId++, "Java: Como Programar", "Paul Deitel", 2017, "978-8543004792"));
	        livros.add(new Livro(proximoId++, "Padrões de Projetos", "Gang of Four", 1994, "978-8573076103"));
	 }
	 
	 
	 public boolean adicionarLivro(Livro livro) {
		 try {
			 
			 if(buscarPorIsbn(livro.getIsbn()) != null ) {
				 return false;
			 }
			 
			 livro.setId(proximoId++);
			 livros.add(livro);
			 
			 return true;
			
		} catch (Exception e) {
			System.err.println("Erro ao adicionar livro" + e.getMessage());
			return false;
		}
	 }
	 
	 
	 public List<Livro> listarTodos(){
		 return new ArrayList<>(livros);
	 }
	 
	
	 
	 public Livro buscarPorIsbn(String isbn) {
		 if(isbn == null || isbn.trim().isEmpty()) {
			 return null;
		 }
		 
		 return livros.stream().filter(livro -> isbn.equals(livro.getIsbn()))
				 .findFirst()
				 .orElse(null);	 
	 }
	 
	 
	 public boolean removerPorId(int id) {
		 return livros.removeIf(livro -> livro.getId() == id);
	 }
	 
	 
	 public boolean removerPorIsbn(String isbn) {
		 return livros.removeIf(livro -> isbn.equals(livro.getIsbn()));
	 }
	 
	 public boolean atualizarLivro(Livro livro){
		 if(livro == null || livro.getId() <= 0) {
			 return false;
		 }
		 
		 for(int i = 0; i < livros.size(); i++) {
			 if(livros.get(i).getId() == livro.getId()) {
				 livros.set(i, livro);
				 return true;
			 }
		 }
		 
		 return false;
	 }
	 
	 
	 public int contarLivros() {
		 return livros.size();
	 }
	 
	 public boolean temLivros() {
		 return !livros.isEmpty();
	 }
	    
	 public void limprTodos() {
		 livros.clear();
		 proximoId = 1;
	 }  
	 
}
