<%-- 
    Document   : loginCadastro
    Created on : 9 de mar de 2023, 16:46:34
    Author     : Fernanda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="icon" href="../imgs/logo_final.png">
        <link rel="stylesheet" type="text/css" href="../css/estilo_principal.css"/>
        <link rel="stylesheet" type="text/css" href="../_bootstrap/css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="../_bootstrap-icons/bootstrap-icons.css" />
        <title>Login / Cadastro</title>
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
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
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
                    <button disabled="true" type="button" class="btn" data-bs-toggle="modal" data-bs-target="#modal-carrinho">
                        <span class="bi-cart4" style="font-size: 2rem; color: white;"></span>
                    </button>
                </div>
            </div>
        </nav>

        <!--Itens Index-->
        <div id="backgournd-container" class="container-fluid bg-image">
            <div class="w-50 m-auto p-4">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item w-50" role="presentation">
                        <button class="nav-link active text-dark" id="login-tab" data-bs-toggle="tab" data-bs-target="#login" type="button" role="tab" aria-controls="login" aria-selected="true">
                            Entrar
                        </button>
                    </li>
                    <li class="nav-item w-50" role="presentation">
                        <button class="nav-link text-dark" id="register-tab" data-bs-toggle="tab" data-bs-target="#register" type="button" role="tab" aria-controls="register" aria-selected="false">
                            Registre-se
                        </button>
                    </li>
                </ul>

                <div class="tab-content" id="myTabContent">

                    <!--Formulário de Login-->

                    <div class="tab-pane fade show active" id="login" role="tabpanel" aria-labelledby="login-tab">
                        <form class="m-4" action="${pageContext.request.contextPath}/ServletAutenticar" method="post">
                            <div class="form-group">
                                <label for="inputEmail1">E-mail</label>
                                <input type="email" name="param-email" class="form-control" id="inputEmail1" aria-describedby="emailHelp" placeholder="E-mail">
                                <small id="emailHelp" class="form-text text-muted">Nunca compartilharemos seu e-mail com mais ninguém.</small>
                            </div>
                            <br>
                            <div class="form-group">
                                <label for="inputPassword1">Senha</label>
                                <input type="password" name="param-senha" class="form-control" id="inputPassword1" placeholder="Senha">
                            </div>
                            <br>
                            <div class="form-check">
                                <input type="checkbox" class="form-check-input" id="check">
                                <label class="form-check-label" for="check">Lembrar senha</label>
                            </div>
                            <br>
                            <button type="submit" class="btn btn-danger">Enviar</button>
                        </form>
                    </div>

                    <!--Formulário de Cadastro-->

                    <div class="tab-pane fade" id="register" role="tabpanel" aria-labelledby="register-tab">
                        <form class="m-4" action="${pageContext.request.contextPath}/ClienteCadController" method="post">
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="inputName">Nome Completo</label>
                                    <input type="text" name="param-nome" class="form-control" id="inputName" placeholder="Nome">
                                </div>
                                <div class="form-group">
                                    <label for="inputEmail2">E-mail</label>
                                    <input type="email" name="param-email" class="form-control" id="inputEmail2" placeholder="E-mail">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputPhone">Celular</label>
                                    <input type="tel" name="param-tel" class="form-control" id="inputPhone" placeholder="Telefone">
                                    <small class="form-text text-muted">Ex:(ddd)x xxxx-xxxx</small>
                                </div>
                            </div>
                            <hr>
                            <div class="form-group">
                                <label for="inputAddress">Endreço</label>
                                <input type="text" name="param-end" class="form-control" id="inputAddress" placeholder="Ex: Rua das Flores">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="inputNumber">Número</label>
                                <input type="number" name="param-casa" class="form-control" id="inputNumber" placeholder="Ex: 388">
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputCity">Cidade</label>
                                    <input type="text" name="param-cidade" class="form-control" id="inputCity">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputDistrict">Bairro</label>
                                    <input type="text" name="param-bairro" class="form-control" id="inputDistrict">
                                </div>
                                <hr>
                                <div class="form-group col-md-6">
                                    <label for="inputPassword2">Defina uma senha para acesso</label>
                                    <input type="password" name="param-senha" class="form-control" id="inputPassword2" placeholder="******">
                                </div>
                            </div>
                            <br>
                            <button type="submit" class="btn btn-danger">Enviar</button>
                        </form>
                    </div>
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

