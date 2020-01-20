
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>Gestionar Butacas - Cine Wolke</title>
    <link rel="stylesheet" href="css/variables.css">
    <link rel="stylesheet" href="css/encabezados.css">
    <link rel="stylesheet" href="css/navegacion.css">
    <link rel="stylesheet" href="css/tabla.css">
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,500,700|Roboto:400,500&display=swap"
rel="stylesheet">
</head>
<body>

	<nav class="navbar navbar-expand-md navbar-light bg-blanco">
        <div class="container h-100 d-flex justify-content-between align-items-center">
            <a class="navbar-brand" href='<c:url value="/cartelera" />'>
                <div class="brand">
                    <img class="brand-img" src="cine-wolke.svg" alt="">
                    <span class="brand-text ml-2">cine wolke</span>
                </div>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse bg-blanco" id="navbarNav">
                <ul class="navbar-nav bg-blanco ml-md-auto text-center p-3 p-md-0">
                    <li class="nav-item">
                        <a class="nav-link" href='<c:url value="/reportes" />'>Reportes </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href='<c:url value="/gestion_tarifas" />'>Tarifas</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href='<c:url value="/gestion_salas" />'>Salas</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link active" href='<c:url value="/gestion_butacas" />'>Butacas</a>
                    </li>
                    <a class="nav-link btn-inverso rounded ml-md-4" href="#">Cerrar Sesi�n</a>
                </ul>
            </div>
        </div>
    </nav>
    
    <!-- Mensajes -->
    <c:if test="${success != null}">
    	<div class="alert alert-success text-center">${success}</div>
    </c:if>
    
    <c:if test="${error != null}">
    	<div class="alert alert-danger text-center">${error}</div>
    </c:if>
    
    <c:if test="${warning != null}">
    	<div class="alert alert-warning text-center">${warning}</div>
    </c:if>
    
    <c:if test="${info != null}">
    	<div class="alert alert-info text-center">${info}</div>
    </c:if>

    <div class="container">
        <h1 class="mt-5">Gesti�n de Butacas</h1>
        <div class="row">
            <div class="col-12">
                <div class="formulario-main bg-blanco-border rounded px-4 py-4">
                    <a href='<c:url value="/gestion_butacas" />' class="btn btn-inverso btn-inline mb-3">Nuevo registro</a>
                    <hr class="mt-2">
                    <form:form  method="post" modelAttribute="butaca"  class="needs-validation" >
                        <div class="form-row justify-content-between">
                            <div class="col-md-6 mb-3">
                                <label>Id</label>
                                <form:input path="id" type="text" class="form-control" value="" readonly="true" />
                            </div>
                            <div class="col-md-6 mb-3">
                                <label>Sala</label>
                                <form:select class="custom-select"  path="sala">
                                    <form:option value="">Selecciona una opci�n</form:option>
                                    <form:options items="${Salas}" itemLabel="nombre" itemValue="id" />
                                </form:select>
                                <form:errors path="sala" cssClass="form-text text-danger" />
                            </div>
                            <div class="col-md-6 mb-3">
                                <label>Fila</label>
                                <form:input path="fila" type="text" class="form-control" placeholder="A-Z" />
                                <form:errors path="fila" cssClass="form-text text-danger" />
                            </div>
                            <div class="col-md-6 mb-3">
                                <label>Columna</label>
                                <form:input path="columna" type="text" class="form-control" placeholder="1-99" />                                
                                <form:errors path="columna" cssClass="form-text text-danger" />
                            </div>
                            <div class="col-md-6 offset-6">
                                <button class="btn btn-principal btn-block" type="submit">Guardar</button>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>

            <div class="col-12">
                <hr>
                <div class="tabla-main bg-blanco-border rounded px-4 py-4 mb-4">
                    <h2 class="mt-2">Butacas</h2>
                    <table class="table table-bordered table-hover table-responsive-md">
                        <thead class="bg-principal">
                            <tr>
                                <th>Id</th>
                                <th>Sala</th>
                                <th>Fila</th>
                                <th>Columna</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${Butacas}" var="but">
                            <tr>
                                <td>${but.id}</td>
                                <td>${but.sala.nombre}</td>
                                <td>${but.fila}</td>
                                <td>${but.columna}</td>
                                <td>
	                        			<a class="link-text" href='<c:url value="/gestion_butacas?id=${but.id}" />'>Editar </a>
	                        			<span class="px-2 px-md-3">|</span>
										<a class="link-text" href='<c:url value="/eliminar_butaca/${but.id}"/>' onclick="return confirm('�Est�s seguro de eliminar?')" >Eliminar</a>
	                        		</td>
                            </tr>
						</c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>



    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
crossorigin="anonymous"></script>

</body>
</html>