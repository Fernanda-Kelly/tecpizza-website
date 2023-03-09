<%-- 
    Document   : index
    Created on : 9 de mar de 2023, 16:24:20
    Author     : Fernanda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="icon" href="img/logotipo.png">
        <link rel="stylesheet" type="text/css" href="css/estilo_principal.css"/>
        <link rel="stylesheet" type="text/css" href="_bootstrap/css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="_bootstrap-icons/bootstrap-icons.css" />
        <title>Página Inicial</title>
    </head>
    <body>
        <!--Barra de menu-->
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: rgb(139,0,0);">
            <!-- Logo e nome do projeto -->
            <div class="container-fluid">
                <nav class="navbar navbar-dark d-flex">
                    <a class="navbar-brand" href="index.jsp">
                        <img src="img/logotipo.png" alt="Logotipo" width="100" height="80" class="d-inline-block align-text-top">
                    </a>
                    <a href="index.jsp" class="navbar-brand">Pizzaria TecPizza</a>
                </nav>

                <!-- Icone botão -->
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <!-- Barra de navegação links -->
                <div class="collapse navbar-collapse justify-content-between" id="collapsibleNavbar">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="paginas/Cardapio.jsp" > Cardápio </a>
                        </li>

                        <c:if test="${empty usuario}">
                            <li class="nav-item">
                                <a class="nav-link" href="paginas/LoginCadastro.jsp" > Fazer login </a>
                            </li>
                        </c:if>

                        <c:if test="${not empty usuario}">
                            <li class="nav-item">
                                <a class="nav-link" href="paginas/AreaUsuario.jsp" > Sua área </a>
                            </li>
                        </c:if>
                    </ul>

                    <!--Botão abrir modal-->
                    <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#modal-carrinho">
                        <span class="bi-cart4" style="font-size: 2rem; color: white;"></span>
                    </button>
                </div>
            </div>
        </nav>

        <!--Carrossel-->
        <div id="simple-carousel" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="img/carrossel-img-1.jpg" class="d-block w-100">
                    <div class="carousel-caption d-none d-md-block">
                        <h3>Venha saborear nossas deliciosas pizzas!</h3>
                        <p>Aqui você encontra a verdadeira pizza assada no forno a lenha.</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="img/carrossel-img-2.jpg" class="d-block w-100">
                    <div class="carousel-caption d-none d-md-block">
                        <h3>Venha saborear nossas deliciosas pizzas!</h3>
                        <p>Aqui você encontra um ambiente gostoso e agradável.</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="img/carrossel-img-3.jpg" class="d-block w-100">
                    <div class="carousel-caption d-none d-md-block">
                        <h3>Venha saborear nossas deliciosas pizzas!</h3>
                        <p>Aqui você encontra uma família!.</p>
                    </div>
                </div>
            </div>
        </div>

        <!--Borda Carrossel-->
        <nav class="navbar justify-content-center" style="background-color: rgb(139,0,0);">
            <ul class = "nav nav-item">
                <div class="text-center">
                    <a class="navbar-brand" href="#">
                        <img src="img/logotipo.png" alt="Logotipo" width="30%" height="100%">
                    </a>
                </div>
            </ul>
        </nav>

        <!--Itens Index-->
        <div id="backgournd-container" class="container-fluid bg-image">
            <div class="clearfix">
                <img src="img/banner.jpg" class="col-md-6 float-md-start mb-3 ms-md-3">
                <h5 class="text-center">Sobre Nós</h5>
                <hr>
                <p class="text-end">
                    Desde 2019 a Pizzaria TecPizza, está localizada em um dos principais bairros de São Paulo, com muito orgulho em fazer parte do coração da Liberdade, levamos como principal conceito, a satisfação dos nossos clientes e também aquela interação diferenciada e duradoura.
                    E para você que almeja saborear uma bela pizza,. Venha conhecer à Pizzaria TecPizza, que tem como opção de atendimento, o nosso salão de atendimento na Liberdade. Aguardamos por você e sua família.
                </p>
            </div>
            <div class="clearfix">
                <img src="img/banner-2.jpg" class="col-md-6 float-md-end mb-3 ms-md-3">
                <h5 class="text-center">Nossos Valores</h5>
                <hr>
                <p class="text-start">
                    Queremos compartilhar nossa paixão pelo forno a lenha. Nele nós cozinhamos nossas pizzas com os ingredientes mais frescos, e somos especializados nessa culinária, tudo isso em um ambiente acolhedor e amigável.
                </p>
            </div>
            <hr>
            <div class="clearfix">
                <h5 class="text-center">Horário de Funcionamento</h5>
                <ul class="list-unstyled text-center">
                    <li>Segunda á Sábado</li>
                    <li>Almoço - 10:00 às 14:00</li>
                    <li>Jantar - 19:00 às 00:00</li>
                </ul>
                <ul class="list-unstyled text-center mb-0 pb-2">
                    <li>Domingo</li>
                    <li>Almoço - 12:00 às 15:00</li>
                    <li>Jantar - 18:00 às 23:00</li>
                </ul>
            </div>
        </div>

        <!--Rodapé-->
        <footer class="bg-dark text-lg-start">
            <div class="text-center p-2" style="background-color: rgb(139,0,0);">
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
                            <iframe src="paginas/Carrinho.jsp" style="width: 100%"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>

    <!--Scripts-->
    <script src="_jquery/jquery.js"></script>
    <script src="_bootstrap/js/bootstrap.min.js"></script>
</html>

