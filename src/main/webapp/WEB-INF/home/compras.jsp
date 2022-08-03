<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@page isELIgnored="false" %>
<%@page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <title>Produtos</title>

</head>

<body>
<main>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark" aria-label="Offcanvas navbar large">
        <div class="container-fluid">


            <a href="/TabaricaApp/home"><img src="<c:url value="/img/icon.png"/>" /><a/>
            <c:if test="${ empty usuario_logado}">
                <a class="navbar-brand" href="#">Olá Cliente</a>
            </c:if>

            <c:if test="${not empty usuario_logado}">
                <a class="navbar-brand" href="#">Olá  ${usuario_logado.nome} </a>
            </c:if>

            <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar2" aria-controls="offcanvasNavbar2">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="offcanvas offcanvas-end text-white bg-dark" tabindex="-1" id="offcanvasNavbar2" aria-labelledby="offcanvasNavbar2Label">
                <div class="offcanvas-header">
                    <h5 class="offcanvas-title" id="offcanvasNavbar2Label">Offcanvas</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body">
                    <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                        <c:if test="${empty usuario_logado}">
                        <li class="nav-item">
                            <a class="nav-link " aria-current="page" href="/TabaricaApp/login/">Fazer login </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value="/cadastro/redirect"/>"> Cadastre-se</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value="/compra/produto/compras?id_usuario=${usuario_logado.id}"/>"> Compras</a>
                        </li>
                        </c:if>

                        <c:if test="${ usuario_logado.permissao == 1}">

                        <li class="nav-item">
                            <a class="nav-link" href="/TabaricaApp/produto/listar"> CADASTRAR PRODUTO</a>
                        </li>
                        </c:if>

                        <c:if test="${not empty usuario_logado}">
                        <li class="nav-item">
                            <a class="nav-link"href="/TabaricaApp/login/sair"> Sair</a>
                        </li>
                        </c:if>


                        <%--                        <li class="nav-item dropdown">--%>
                        <%--                            <a class="nav-link dropdown-toggle" href="#" id="offcanvasNavbarLgDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">--%>
                        <%--                                Dropdown--%>
                        <%--                            </a>--%>
                        <%--                            <ul class="dropdown-menu" aria-labelledby="offcanvasNavbarLgDropdown">--%>
                        <%--                                <li><a class="dropdown-item" href="#">Action</a></li>--%>
                        <%--                                <li><a class="dropdown-item" href="#">Another action</a></li>--%>
                        <%--                                <li>--%>
                        <%--                                    <hr class="dropdown-divider">--%>
                        <%--                                </li>--%>
                        <%--                                <li><a class="dropdown-item" href="/TabaricaApp/login/sair">Sair</a></li>--%>
                        <%--                            </ul>--%>
                        <%--                        </li>--%>
                        <%--                    </ul>--%>
                        <%--                    <form class="d-flex mt-3 mt-lg-0" role="search">--%>
                        <%--                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">--%>
                        <%--                        <button class="btn btn-outline-success" type="submit">Search</button>--%>
                        <%--                    </form>--%>
                </div>
            </div>
        </div>
    </nav>

    <c:if test="${ empty produtos}">
        <h1>Você não possui compras</h1>

    <a href="/TabaricaApp/home"> <button type="button"  class="btn btn-success" >Comprar</button> <a/>
    </c:if>


    <div class="album py-5 bg-light">
        <div class="container">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">

                <c:forEach var = "produto" items="${produtos}">
                    <div class="col">
                        <div class="card shadow-sm">

                            <img src="<c:url value="/img/logo-cathafire.png"/>">



                            <div class="card-body">
                                <p class="card-text"> ${produto.nome} - R$${produto.preco}0 </p>
                                <p> <small class="text-muted">${produto.descricao} </small> </p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <small class="text-muted">9 mins</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>
        </div>
    </div>
</main>

</body>
</html>
