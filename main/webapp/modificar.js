function enviarDatosModificar(form){
    let data = new URLSearchParams();
    for(const pair of new FormData(form)){
        data.append(pair[0], pair[1]);
    }
    console.log(idUsuarioSeleccionado)
    data.append('id_usuario', idUsuarioSeleccionado);

    httpPost('peticiones.jsp?proceso=actualizarUsuario', data, finalizarModificacion)
}
function finalizarModificacion(response){
    console.log(response);
    if (response.actualizarUsuario == 'true'){
        console.log("Se finalizo la modificación del usuario correctamente")
        window.location.href = 'lista.html';
    }
    else{
        alert("Hubo algún error al hacer la modificación")
    }
}

