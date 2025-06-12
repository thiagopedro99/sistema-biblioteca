# Sistema de Biblioteca - Cesumar

Sistema de gerenciamento de biblioteca desenvolvido para a disciplina de Desenvolvimento Web da Unicesumar.

## 🚀 Tecnologias Utilizadas

- **Java 11**
- **Maven** - Gerenciamento de dependências
- **JSP** - Páginas dinâmicas
- **JSTL** - Tags customizadas
- **Servlet API 4.0**
- **Apache Tomcat** - Servidor de aplicação

## 📋 Pré-requisitos

Antes de executar o projeto, certifique-se de ter instalado:

- Java JDK 11 ou superior
- Apache Maven 3.6+
- Apache Tomcat 9.0+
- IDE de sua preferência (Eclipse, IntelliJ IDEA, VSCode)

## 🛠️ Como executar

### Opção 1: Eclipse + Tomcat (Recomendado)

1. **Clone o repositório**
   ```bash
   git clone https://github.com/seu-usuario/sistema-biblioteca.git
   ```

2. **Importe no Eclipse**
   - File → Import → Existing Maven Projects
   - Selecione a pasta do projeto
   - Finish

3. **Configure o Tomcat no Eclipse**
   - Window → Preferences → Server → Runtime Environments
   - Add → Apache Tomcat v9.0
   - Aponte para sua instalação do Tomcat

4. **Execute o projeto**
   - Clique com botão direito no projeto
   - Run As → Run on Server
   - Selecione o Tomcat configurado
   - Acesse: `http://localhost:8080/sistema-biblioteca`

### Opção 2: Linha de comando

1. **Clone e compile**
   ```bash
   git clone https://github.com/seu-usuario/sistema-biblioteca.git
   cd sistema-biblioteca
   mvn clean package
   ```

2. **Deploy manual no Tomcat**
   - Copie `target/sistema-biblioteca.war` para `%TOMCAT_HOME%/webapps/`
   - Inicie o Tomcat: `%TOMCAT_HOME%/bin/startup.bat`
   - Acesse: `http://localhost:8080/sistema-biblioteca`

## 📁 Estrutura do Projeto

```
sistema-biblioteca/
├── src/
│   └── main/
│       ├── java/              # Código Java (Beans, Servlets)
│       ├── resources/          # Recursos do projeto
│       └── webapp/            # Páginas web (JSP, JSF)
│           └── WEB-INF/
│               └── web.xml    # Configurações da aplicação
├── target/                    # Arquivos gerados (não versionado)
├── pom.xml                   # Configurações do Maven
└── README.md                 # Este arquivo
```

## ⚙️ Configurações

O projeto está configurado com:
- Encoding UTF-8 para todos os arquivos
- Suporte a JSP e JSTL
- Filtro de caracteres para páginas web
- Build automatizado via Maven

## 📚 Funcionalidades

> Adicione aqui as funcionalidades implementadas no sistema

## 🎓 Sobre

Projeto desenvolvido como atividade acadêmica para a **Unicesumar** na disciplina de Desenvolvimento Web.

**Autor:** [Thiago Silva]  
**Curso:** [Análise e Desenvolvimento de Sistemas]  

## 📄 Licença

Este projeto é desenvolvido para fins acadêmicos.