<%-- 
    Document   : cardapio
    Created on : 9 de mar de 2023, 16:41:36
    Author     : Fernanda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="icon" href="../img/logotipo.png">
        <link rel="stylesheet" type="text/css" href="../css/estilo_produtos.css"/>
        <link rel="stylesheet" type="text/css" href="../css/estilo_principal.css"/>
        <link rel="stylesheet" type="text/css" href="../_bootstrap/css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="../_bootstrap-icons/bootstrap-icons.css" />
        <title>Cardápio</title>
    </head>
    <body>
        <!--Barra de menu-->
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: rgb(139,0,0);">
            <!-- Logo e nome do projeto -->
            <div class="container-fluid">
                <nav class="navbar navbar-dark d-flex">
                    <a class="navbar-brand" href="../index.jsp">
                        <img src="../img/logotipo.png" alt="Logotipo" width="100" height="80" class="d-inline-block align-text-top">
                    </a>
                    <a href="../index.jsp" class="navbar-brand">Pizzaria TecPizza</a>
                </nav>

                <!-- Icone botão -->
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar" >
                    <span class="navbar-toggler-icon"></span>
                </button>

                <!-- Barra de navegação links -->
                <div class="collapse navbar-collapse justify-content-between" id="collapsibleNavbar">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="../paginas/cardapio.jsp" > Cardápio </a>
                        </li>

                        <c:if test="${empty usuario}">
                            <li class="nav-item">
                                <a class="nav-link" href="../paginas/loginCadastro.jsp" > Fazer login </a>
                            </li>
                        </c:if>

                        <c:if test="${not empty usuario}">
                            <li class="nav-item">
                                <a class="nav-link" href="../paginas/areaUsuario.jsp" > Sua área </a>
                            </li>
                        </c:if>
                    </ul>

                    <!--Botão abrir modal-->
                    <button disabled="true" class="btn" type="button" data-bs-toggle="modal" data-bs-target="#modal-carrinho">
                        <span class="bi-cart4" style="font-size: 2rem; color: white;"></span>
                    </button>
                </div>
            </div>
        </nav>

        <!--Itens Index-->
        <%--
        <jsp:useBean id="produto" class="Persistencia.ProdutoDAO" />
        --%>

        <div id="backgournd-container" class="container-fluid bg-image">
            <!--Itens Cardápio-->

            <div class="container">
                <h1>Cardápio</h1>
                <hr>

                <h4 class="text-center">Confira nossos sabores!</h4><br>

                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 row-cols-xl-5">
                    <c:forEach var="item" items="${produtosBD}">

                        <form action="${pageContext.request.contextPath}/ServletProduto" method="post">
                            <div class="col mb-4">
                                <div class="card">
                                    <img class="card-img-top" src="${item.caminhoImg}" alt="Imagem pizza">
                                    <div class="card-body">
                                        <h5 class="card-title">${item.produto}</h5>                                       
                                        <p class="card-text">${item.descricao}</p>
                                        <p class="card-text text-center"><fmt:formatNumber type="currency">${item.valor}</fmt:formatNumber></p>
                                        <input type="hidden" value="${item.idProduto}" name="id-produto">

                                        <input class="btn btn-danger" type="submit" value="Comprar">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </c:forEach>
                </div>
            </div>
        </div>

        <!--Rodapé-->
        <footer class="bg-dark text-lg-start">
            <div class="text-center p-3" style="background-color: rgb(139,0,0);">
                <p>© 2018. Pizzaria TecPizza Todos os direitos reservados.</p>  
            </div>
        </footer>

        <!-- Modal carrinho -->
        <div class="modal fade bd-example-modal-lg" id="modal-carrinho" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Carrinho</h5>
                        <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid">
                            <iframe src="../paginas/carrinho.jsp" style="width: 100%"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>

    <!--Scripts-->
    <script src="../_jquery/jquery.js"></script>
    <script src="../_bootstrap/js/bootstrap.min.js"></script>
</html>