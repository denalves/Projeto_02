<%-- 
    Document   : amortizacao-constante
    Created on : 31/08/2019, 01:01:26
    Author     : Denos
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Constante</title>
        <link href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/flatly/bootstrap.min.css" rel="stylesheet" integrity="sha384-T5jhQKMh96HMkXwqVMSjF3CmLcL1nT9//tCqu9By5XSdj7CwR0r+F3LTzUdfkkQf" crossorigin="anonymous">
    </head>
    <style>
        body{
            text-align: center;   
         }
        table{
            margin: 0 auto;
        }
             
    </style>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        
        <h1>Amortização constante</h1>
        <p>Sistema de Amortização Constante (SAC) é uma forma de amortização de um empréstimo por
           prestações que incluem os juros, amortizando assim partes iguais do valor total do
           empréstimo.</p>
        
        <form>
            Empréstimo R$ <input type="text" name="valor">
            Prazo em Meses <input type="text" name="meses">
            Taxa de Juros % <input type="text" name="taxa">
            <input type="submit" value="Calcular" name="calcular">
                
        </form>
        <% if (request.getParameter("calcular")!= null ){ %>
            <%try{ %>
                <%
                    double valor = Double.parseDouble(request.getParameter("valor"));
                    int meses = Integer.parseInt(request.getParameter("meses"));
                    double taxa = Double.parseDouble(request.getParameter("taxa"));
                    
                    DecimalFormat formatar = new DecimalFormat("0.##");

                    double juros = taxa/100;
                    double amortizacao = valor/meses; 
                    double taxaJuros;
                    double prestacao;
                        
                    double prestacaoTotal=0;
                    double jurosTotal=0;
                    double amortizacaoTotal=0;
                %>
                <br>
                <br>
                <table border='1'>                        
                    <tr>
                        <th>meses</th>
                        <th>parcelas</th>
                        <th>amortizações</th>
                        <th>juros</th>
                        <th>saldo Devedor</th>                        
                    </tr>
                    
                    <% for(int i=1; i<= meses; i++){ %>
                        <% taxaJuros =valor * juros; %>
                        <% valor = valor - amortizacao; %>

                        <% prestacao = taxaJuros + amortizacao; %>
                        <% prestacaoTotal += prestacao; %>
                        <% jurosTotal += taxaJuros; %>
                        <% amortizacaoTotal += amortizacao; %>
                                                    
                        <tr>
                            <td><%=i%></td>
                            <td><%=formatar.format(prestacao)%></td>
                            <td><%=formatar.format(amortizacao)%></td>
                            <td><%=formatar.format(taxaJuros)%></td>
                            <td><%=formatar.format(valor)%></td>                              
                        </tr>
                    <%}%>
                    <tr>
                        <td><%="total"%></td>
                        <td><%=formatar.format(prestacaoTotal)%></td>
                        <td><%=formatar.format(amortizacaoTotal)%></td>
                        <td><%=formatar.format(jurosTotal)%></td>
                        <td><%='-'%></td>                              
                    </tr>                        
                </table>
                        
            <% }catch (Exception ex) { %>
              
                <h2 style = 'color:red;'> Erro ao fazer amortazição constante</h2>
            <% } %> 
        <% } %>
           
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
