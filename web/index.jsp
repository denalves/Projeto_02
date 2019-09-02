<%-- 
    Document   : index
    Created on : 30/08/2019, 20:22:12
    Author     : Denos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="WEB-INF/jspf/boots-trap.jspf" %>
        
        <%@include file="WEB-INF/jspf/css.jspf" %>
        <title>Home</title>
    </head>    
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        
        <h1>Grupo 01</h1>
        <br>
        <h3>Programação Orientada a Objeto</h3>
        <h3>Dante Miguel, Denis Alves, Rodrigo Yuri</h3>
        <br>
        <h4>
            Amortização é o mesmo que redução da dívida, ou seja, 
            amortizar é pagar uma parte da dívida para que ela reduza
            de tamanho até a sua eliminação.</h4>
        <br>
        
         <a class="btn btn-primary" href="amortizacao-constante.jsp">Armotização Constante</a></br></br>
         
         <a class="btn btn-primary" href="amortizacao-americana.jsp">Armotização Americana</a></br></br>
        
         <a class="btn btn-primary" href="tabela-price.jsp">Tabela Price</a>
          
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
