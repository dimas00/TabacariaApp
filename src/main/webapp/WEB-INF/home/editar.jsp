<%--
  Created by IntelliJ IDEA.
  User: Dimas
  Date: 18/06/2022
  Time: 20:27
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page isELIgnored="false" %>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Editar Produto</title>
</head>
<body>

<h1>Editar Produto</h1>

<form:form method="post" action="/TabaricaApp/produto/editar" modelAttribute="produto">

    <form:label path="nome">Nome</form:label>
    <form:input path="nome" placeholder="email" name="nome" type="text" value="${produto.nome}"   ></form:input> <br>
    <br>

    <form:label path="preco">Preço</form:label>
    <form:input path="preco"  type="text" value="${produto.preco}" ></form:input><br>
    <br>

    <form:label path="quantidade">Quantidade</form:label>
    <form:input path="quantidade"  type="text" value="${produto.quantidade}"></form:input><br>
    <br>

    <form:label path="descricao">Descrição</form:label>
    <form:input path="descricao"  type="text" value="${produto.descricao}" ></form:input><br>
    <br>


    <form:input path="id"  type="hidden" value="${produto.id}" ></form:input><br>
    <br>
    <input type="submit" value="Cadastrar" name="Cadastrar" class="btn btn-primary" >

</form:form>



<c:if test="${not empty retorno}">

    <h6>
        <h1>${retorno}</h1>
    </h6>

</c:if>

<a href="/TabaricaApp/produto/listar"> VOLTAR </a>

</body>
</html>
