function enviarDatos(form){
    let data = new URLSearchParams();
    for(const pair of new FormData(form)){
        data.append(pair[0], pair[1]);
    }

    httpPost('peticiones.jsp?proceso=guardarUsuario', data, finalizarAdicion)
}
function finalizarAdicion(response){
    console.log(response);
    if (response.guardarUsuario == 'true'){
        console.log("Se finalizo la adicion a la base de datos correctamente")
        window.location.href = 'lista.html';
    }
    else{
        alert("Hubo algún error al hacer la adición")
    }
}
