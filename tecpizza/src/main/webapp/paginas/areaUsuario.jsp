<%-- 
    Document   : areaUsuario
    Created on : 9 de mar de 2023, 16:46:05
    Author     : Fernanda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="icon" href="../img/logotipo.png">
        <link rel="stylesheet" type="text/css" href="../css/estilo_principal.css"/>
        <link rel="stylesheet" type="text/css" href="../_bootstrap/css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="../_bootstrap-icons/bootstrap-icons.css" />
        <title>Área do Usuário</title>
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
        <div id="backgournd-container" class="container-fluid bg-image">

            <!--Painel Lateral-->

            <div class="row">
                <div class="col-3" style="background-color: rgb(139,0,0,0.6);">
                    <div class="nav flex-column nav-tabs" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                        <a class="nav-link text-black active" id="v-pills-profile-tab" data-bs-toggle="tab" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="true">Perfil</a>
                        <a class="nav-link text-black" id="v-pills-requests-tab" data-bs-toggle="tab" href="#v-pills-requests" role="tab" aria-controls="v-pills-requests" aria-selected="false">Pedidos</a>
                        <a class="nav-link text-black" id="v-pills-settings-tab" data-bs-toggle="tab" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">Configurações</a>

                        <a class="nav-link text-black" name="param-sair" href="${pageContext.request.contextPath}/ServletDesconectar">
                            <span class="bi-arrow-left-square"></span>   Sair
                        </a>
                    </div>
                </div>

                <div class="col-9">
                    <div class="tab-content" id="v-pills-tabContent">

                        <!--Formulário de exibição-->

                        <div class="tab-pane fade show active" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                            <form class="m-4">
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="inputName">Nome Completo</label>
                                        <input type="text" name="param-nome" class="form-control" id="inputName" value="${usuario.nome}" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputEmail2">E-mail</label>
                                        <input type="email" name="param-email" class="form-control" id="inputEmail2" value="${usuario.email}" readonly>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPhone">Celular</label>
                                        <input type="tel" name="param-tel" class="form-control" id="inputPhone" value="${usuario.numTelefone}" readonly>
                                    </div>
                                </div>
                                <hr>
                                <div class="form-group">
                                    <label for="inputAddress">Endreço</label>
                                    <input type="text" name="param-end" class="form-control" id="inputAddress" value="${usuario.endereco}" readonly>
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="inputNumber">Número</label>
                                    <input type="text" name="param-casa" class="form-control" id="inputNumber" value="${usuario.numCasa}" readonly>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputCity">Cidade</label>
                                        <input type="text" name="param-cidade" class="form-control" id="inputCity" value="${usuario.cidade}" readonly>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="inputDistrict">Bairro</label>
                                        <input type="text" name="param-bairro" class="form-control" id="inputDistrict" value="${usuario.bairro}" readonly>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <!--Tabela de pedido-->

                        <div class="tab-pane fade" id="v-pills-requests" role="tabpanel" aria-labelledby="v-pills-requests-tab">
                            <%-- <jsp:useBean id="pedido" class="Persistencia.PedidoDAO" /> --%>
                            <c:forEach var="item" items="${pedido.BuscaPedidosBanco()}">
                                <div class="col mb-4">
                                    <div class="card">
                                        <img class="card-img-top" src="" alt="Imagem pizza">
                                        <div class="card-body">
                                            <h5 class="card-title">${item.idPedido}</h5>                                       
                                            <p class="card-text">${item.quantidade}</p>
                                            <p class="card-text text-center"><fmt:formatNumber type="currency">${item.valorTotal}</fmt:formatNumber></p>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                        <!--Formulário de alteração-->

                        <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                            <form class="m-4" action="${pageContext.request.contextPath}/ClienteAltController" method="post">
                                <input id="input" type="hidden" name="param-id" value="${usuario.idCliente}"/>
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="inputName">Nome Completo</label>
                                        <input type="text" name="param-nome" class="form-control" id="inputName" value="${usuario.nome}">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputEmail2">E-mail</label>
                                        <input type="email" name="param-email" class="form-control" id="inputEmail2" value="${usuario.email}">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPhone">Celular</label>
                                        <input type="tel" name="param-tel" class="form-control" id="inputPhone" value="${usuario.numTelefone}">
                                        <small class="form-text text-muted">Ex:(ddd)x xxxx-xxxx</small>
                                    </div>
                                </div>
                                <hr>
                                <div class="form-group">
                                    <label for="inputAddress">Endreço</label>
                                    <input type="text" name="param-end" class="form-control" id="inputAddress" value="${usuario.endereco}">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="inputNumber">Número</label>
                                    <input type="number" name="param-casa" class="form-control" id="inputNumber" value="${usuario.numCasa}">
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputCity">Cidade</label>
                                        <input type="text" name="param-cidade" class="form-control" id="inputCity" value="${usuario.cidade}">
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="inputDistrict">Bairro</label>
                                        <input type="text" name="param-bairro" class="form-control" id="inputDistrict" value="${usuario.bairro}">
                                    </div> 
                                </div>
                                <hr>
                                <div class="form-group col-md-6">
                                    <label for="inputPassword2">Redefinir senha de acesso</label>
                                    <input type="password" name="param-senha" class="form-control" id="inputPassword2" value="${usuario.senha}">
                                </div>
                                <br>
                                <input type="submit" name="acao" value="Alterar" class="btn btn-success">
                                <input type="submit" name="acao" value="Excluir" class="btn btn-danger">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--Rodapé-->
        <footer class="footer navbar-fixed-bottom">
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
