<%-- 
    Document   : carrinho
    Created on : 9 de mar de 2023, 16:45:17
    Author     : Fernanda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="icon" href="../img/logotipo.png">
        <link rel="stylesheet" type="text/css" href="../_bootstrap/css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="../_bootstrap-icons/bootstrap-icons.css" />
    </head>
    <body>
        <!--Carrinho de Compras-->
        <table class="table" id="tabela-carrinho">
            <thead>
                <tr>
                    <th scope="col">Produto</th>
                    <th scope="col">Quantidade</th>
                    <th scope="col">Preço</th>
                    <th scope="col"></th>
                    <th scope="col"></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${itensCarrinho}">
                    <tr>
                        <th>${item.produto.produto}</th>
                        <th>${item.quantidade}</th>
                        <th>${item.valorTotalProduto}</th>
                        <th>
                            <form method="post">
                                <!--Botão adicionar-->
                                <button class="btn" id="${item.produto.idProduto}" qtd="1" name="btn-add">
                                    <span class="bi-plus" style="font-size: 1.5em"></span>
                                </button>

                                <!--Botão remover-->
                                <button class="btn" id="${item.produto.idProduto}" qtd="-1" name="btn-rm">
                                    <span class="bi-trash" style="font-size: 1.5em"></span>    
                                </button>
                            </form>
                        </th>
                    </tr>
                </c:forEach>
            </tbody>
        </table> 
    </body>

    <!--Scripts-->
    <script src="../_jquery/jquery.js"></script>
    <script src="../_bootstrap/js/bootstrap.min.js"></script>

    <script>
        //Script para chamar a servlet e fazer a atualização dos dados no carrinho
        //sem recarregar a pagina inteira.

        $("button").click(function (e) {
            e.preventDefault(); 
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/ServletProduto", //Url do serviço POST,
                data: {
                    id: $(this).attr("id"),
                    qtd: $(this).attr("qtd")
                },
                success: function () {
                    $("body").load("#tabela-carrinho");
                },
                error: function () {
                    console.log("Não foi possivel prosseguir com a requisição.");
                }
            });
        });
    </script>
</html>
