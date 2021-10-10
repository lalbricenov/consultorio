function enviarDatosModificar(form){
    let data = new URLSearchParams();
    for(const pair of new FormData(form)){
        data.append(pair[0], pair[1]);
    }
    
    data.append('id_usuario', idUsuarioSeleccionado);
    console.log(data.toString())

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

let fondo = document.querySelector("#lista")
fondo.onclick = ()=> {
    modifDiv.style.display = "none";
    fondo.style.opacity = "100%";
}
