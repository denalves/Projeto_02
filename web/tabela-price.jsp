<%-- 
    Document   : tabela-price
    Created on : Sep 1, 2019, 1:53:21 PM
    Author     : Dante
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Price</title>
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
        
        <h1>Tabela Price</h1>
        <p>Tabela Price, também chamado de <b>sistema francês de amortização</b>,
            é um método usado em amortização de empréstimo cuja principal característica é apresentar prestações (ou parcelas) iguais.
            O método foi apresentado em 1771 por Richard Price em sua obra "Observações sobre Pagamentos Remissivos", idealizado pelo seu autor para
            pensões e aposentadorias.</p>
        
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
                    double jurosTotal=0;
                    double taxaJuros;
                    
                    double prestacao;
                    double prestacaoTotal=0;
                    
                    double amortizacao;
                    double amortizacaoTotal=0;      
                    
                    double aux = 1+juros;
                    double conta = Math.pow(aux,meses); 
                    double conta1 = Math.pow(aux,meses);
                    
                %>
                <br>
                <br>
                <table border='1'>                        
                    <tr>
                        <th>Meses</th>
                        <th>Prestação</th>
                        <th>Juros</th>
                        <th>Amortizações</th>                       
                        <th>Saldo Devedor</th>                        
                    </tr>
                    
                    <% conta = conta * juros; %>
                    <% conta1 = conta1 - 1; %>
                    <% prestacao = valor * (conta/conta1); %>
                   
                    
                  
                    <% for(int i=1; i<= meses; i++){ %>
                        
                        <% taxaJuros = valor * juros; %>
                        <% amortizacao = prestacao - taxaJuros; %>                      
                        <% valor = valor - amortizacao; %>                        
                        
                        <% amortizacaoTotal += amortizacao; %>
                        <% prestacaoTotal += prestacao; %>
                        <% jurosTotal += taxaJuros; %>
                        
                                                    
                        <tr>
                            <td><%=i%></td>
                            <td><%=formatar.format(prestacao)%></td>
                            <td><%=formatar.format(taxaJuros)%></td>
                            <td><%=formatar.format(amortizacao)%></td>
                            <td><%=formatar.format(valor)%></td>                              
                        </tr>
                    <%}%>
                    <tr>
                        <td><%="Total"%></td>
                        <td><%=formatar.format(prestacaoTotal)%></td>
                        <td><%=formatar.format(jurosTotal)%></td>
                        <td><%=formatar.format(amortizacaoTotal)%></td>
                        <td><%='-'%></td>                              
                    </tr>                        
                </table>
                        
            <% }catch (Exception ex) { %>
              
                <h2>Erro! Verifique os dados inseridos e tente novamente.</h2>
            <% } %> 
        <% } %>
           
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>