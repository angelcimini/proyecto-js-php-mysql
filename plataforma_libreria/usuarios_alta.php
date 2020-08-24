<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>alta usuarios</title>
	<link rel="stylesheet" href="assets/css/estilos.css">
	<script src='assets/js/altausuarios.js'></script>
	<script>
		//activar el listener del botón de alta
		window.onload=function() {
			document.getElementById('alta').onclick=altausuario
		}
	</script>
</head>
<body>
	<nav><?php include 'include/nav.html' ?></nav>
	<h2>ALTA USUARIOS</h2>
	<form id='formulario'>
		<label>NIF</label>
		<input type="text" id='nif'><br>
		<label>NOMBRE</label>
		<input type="text" id='nombre'><br>
		<label>APELLIDOS</label>
		<input type="text" id='apellidos'><br>
		<label>DIRECCION</label>
		<input type="text" id='direccion'><br>
		<label>CP</label>
		<input type="text" id='cp'><br>
		<label>EMAIL</label>
		<input type="text" id='email'><br>
		<label>TELEFONO</label>
		<input type="text" id='telefono'><br><br>
		<label></label>
		<input type="button" id='alta' value='Alta usuario'>
	</form>
</body>
</html>