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
        <link href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/flatly/bootstrap.min.css" rel="stylesheet" integrity="sha384-T5jhQKMh96HMkXwqVMSjF3CmLcL1nT9//tCqu9By5XSdj7CwR0r+F3LTzUdfkkQf" crossorigin="anonymous">
        <title>Home</title>
    </head>
    
    <style>
        body{
            text-align: center;
            }
    </style>
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
        
         <a <button type="button" class="btn btn-primary" href="amortizacao-constante.jsp">
            Armotização Constante</button></a>
        
         <a <button type="button" class="btn btn-primary" href="tabela-price.jsp">
            Tabela Price</button></a>
          
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
