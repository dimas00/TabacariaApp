<%--
  Created by IntelliJ IDEA.
  User: Aluno
  Date: 11/05/2022
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/navbars-offcanvas/">
    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Cadastro de Produtos</title>
</head>
<body>

<div class="album py-5 bg-light">
    <div class="container">

<div class="card">
    <h5 class="card-header">Cadastro de Produtos </h5>
    <div class="card-body">


<form:form method="post" action="/TabaricaApp/produto/cadastrar" modelAttribute="produto">

    <form:label path="nome">Nome</form:label>
    <form:input path="nome"  type="text"></form:input> <br>
    <br>

    <form:label path="preco">Preço</form:label>
    <form:input path="preco"  type="text"></form:input><br>
    <br>

    <form:label path="quantidade">Quantidade</form:label>
    <form:input path="quantidade"  type="text" value=""></form:input><br>
    <br>

    <form:label path="descricao">Descrição</form:label>
    <form:input path="descricao"  type="text"></form:input><br>
    <br>
    <input type="submit" value="Cadastrar" name="Cadastrar" class="btn btn-primary" >
</form:form>



            <a href="/TabaricaApp/home" class="btn btn-secondary"  > VOLTAR </a>


    </form>

        <c:if test="${not empty retorno}">
            <div class="alert alert-success" role="alert">
                    ${retorno}
            </div>
        </c:if>




    </div>
</div>
    </div>
        </div>





<div class="album py-5 bg-light">
    <div class="container">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">

            <c:forEach items="${produtos}" var="produto">

                <div class="col">

                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                            <title>

                            </title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em"> </text></svg>

                        <div class="card-body">
                            <p class="card-text"> ${produto.nome} - R$${produto.preco}0    </p>
                            <p> <small class="text-muted"> ${produto.descricao} </small> </p>
                            <div class="d-flex justify-content-between align-items-center">


<!--href="TabaricaApp/produto/editar?id=${produto.id}" -->
                              <div class="btn-group">
                                <a  class="btn btn-primary"  href="<c:url value="/produto/editar?id=${produto.id}"/>"  > Editar </a>

                                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                    Excluir
                                </button>


                                <!-- Modal -->
                                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Deseja mesmo excluir?</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                               Essa ação é irreversível.
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Cancelar</button>
                                                <a type="button" class="btn btn-danger" href="http://localhost:8080/App_Bic/excluir?id=${produto.id}" >Excluir</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy" crossorigin="anonymous"></script>
<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
