package com.cesumar.biblioteca.model;


public class Livro   {
	
	
	private int id;
	private String titulo;
	private String autor;
	private int anoPublicacao;
	private String isbn;
	
	public Livro() {
		
	}
	
	public Livro(String titulo, String autor, int anoPublicacao, String isbn) {
		this.titulo = titulo;
		this.autor = autor;
		this.anoPublicacao = anoPublicacao;
		this.isbn = isbn;
	}
	
	public Livro(int id, String titulo, String autor, int anoPublicacao, String isbn) {
		this.id = id;
		this.titulo = titulo;
		this.autor = autor;
		this.anoPublicacao = anoPublicacao;
		this.isbn = isbn;
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getTitulo() {
		return titulo;
	}
	
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	
	public String getAutor() {
		return autor;
	}
	
	public void setAutor(String autor) {
		this.autor = autor;
	}
	
	public int getAnoPublicacao() {
		return anoPublicacao;
	}
	
	public void setAnoPublicacao(int anoPublicacao) {
		this.anoPublicacao = anoPublicacao;
	}
	
	public String getIsbn() {
		return isbn;
	}
	
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	
	
	
	public boolean isValido() {
		return titulo != null && !titulo.trim().isEmpty() &&
	           autor != null && !autor.trim().isEmpty() &&
	           anoPublicacao > 0 && anoPublicacao <= java.time.Year.now().getValue() &&
	           isbn != null && !isbn.trim().isEmpty() && isIsbnValido(isbn);
	}
	
	private boolean isIsbnValido(String isbn) {
	    if (isbn == null) return false;
	        String isbnLimpo = isbn.replaceAll("[\\s-]", "");    
	        return isbnLimpo.matches("\\d{9}[\\dX]") || isbnLimpo.matches("\\d{13}");
	}
	 

}
