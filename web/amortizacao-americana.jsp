<%-- 
    Document   : amortizacao-americana
    Created on : 29/08/2019, 20:43:47
    Author     : rodrigoy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Americana</title>
        <%@include file="WEB-INF/jspf/boots-trap.jspf" %>
    </head>
    <body>
        
        <%@include file="WEB-INF/jspf/header.jspf" %>
        
        <%if (request.getParameter("constante") == null) { %>
            
            <div style="text-align: center">
                <h2>Amortização Americana.</h2>
                <h5><p>
                    O Sistema de Amortização Americano é uma forma de pagamento de empréstimos que se caracteriza pelo pagamento apenas dos juros da dívida,
                    deixando o valor da dívida constante, que pode ser paga em apenas um único pagamento.
                    Esse sistema de amortização tem a vantagem em relação ao sistema de pagamento único, 
                    pois nele não há incidência de juros sobre juros. 
                    Os juros sempre incidem sobre o valor original da dívida. 
                    Com isso o devedor pode quitar sua dívida quando quiser.
                </p></h5>
            </div>
            </br>
        
            <%@include file="WEB-INF/jspf/formulario.jspf" %>      
            
        
        <%} else { %>
            
            <%try { %>
            
            <%@include file="WEB-INF/jspf/totais.jspf" %>
            
            <%double valor = Double.parseDouble(request.getParameter("vf"));%>
            
            <%int meses = Integer.parseInt(request.getParameter("nm"));%>
            
            <%double taxa_juros = Double.parseDouble(request.getParameter("tj"));%>
            
            <%double amortizacao = 0;%>
            
            <%double saldo_dev = valor;%>
            
            <%double parcela = amortizacao + (taxa_juros / 100) * valor;%>
            
            <%for(int i = 0; i < 1; i++){ %>
                <table class="table table-bordered">
                    <tr>
                        <thead class="thead-dark">
                            <th>#</th>
                            <th>Parcelas</th>
                            <th>Amortização</th>
                            <th>Juros</th>
                            <th>Saldo Devedor</th>
                        </thead>
                    </tr>
                    
                    <%for(int y = 0; y < meses; y++) {%>
                        <tr>
                            <td><%=y+1%></td>
                            
                            <%if(y+1 == meses) {%>
                            
                                <%amortizacao = valor;%>
                                <%parcela = amortizacao + (taxa_juros / 100) * valor;%>
                                
                            <%}%>                                
                            
                            <td><%=d.format(parcela)%></td>
                            <td><%=amortizacao%></td>
                            <td><%=d.format(ju = (taxa_juros / 100) * valor)%></td>
                            <td><%=saldo_dev = saldo_dev - amortizacao%></td>
                            
                            <%totalp += parcela;%>
                            <%totala += amortizacao;%>
                            <%totalj += ju;%>
                            
                        </tr>
                        
                    <%}%>
                    
                    <tr>
                        <th>Total</th>
                        <th><%=totalp%></th>
                        <th><%=totala%></th>
                        <th><%=totalj%></th>
                        <th>-</th>
                    </tr>
                    
                </table>
                </br>    
            <%}%>
            
            <div style="text-align: center">
                <h2>Valor do emprestimo: <u>R$ <%= d.format(valor)%></u></h2>
                <h2>Periodo de meses: <u><%=meses%> a.m</u></h2>
                <h2>Taxa de Juros Aplicada: <u><%= j.format(taxa_juros)%>%</u></h2>
                <h2>Valor da Amortização Americana: <u>R$ <%= d.format(amortizacao)%></u></h2>
            </div>
            
            
            
            <%} catch (Exception ex) {%>
            
            <div style="text-align: center">
                
                <h2 style = 'color:red;'>Erro ao tentar efetuar o calculo</h2>
                <h2>Preencha os Campos com valores númericos validos</h2>
                <a class="btn btn-primary btn-lg" href="amortizacao-americana.jsp">Voltar</a>
            
            </div>
            
            <%}%>
        
        <%}%>
            
        <%@include file="WEB-INF/jspf/footer.jspf"%>
    </body>
</html>
