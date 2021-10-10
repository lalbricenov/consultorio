let idUsuarioSeleccionado = null;
let filasConId = []
let botones = document.querySelectorAll("button")
let elimButton = document.querySelector("#elimButton")
let modifButton = document.querySelector("#modifButton")
elimButton.onclick = eliminarUsuario
modifButton.onclick = modificarUsuario
function seleccionarFilas(){
    let filas = document.querySelectorAll("#tablaUsuarios tr")
    for (let i = 1; i < filas.length; i++)
    {
        // con esta linea se lee el id que se encuentra en la fila en la tabla
        let id = filas[i].querySelector("td:first-child").innerHTML
        filas[i].onclick = () => seleccionarFila(id);
        filasConId.push({"id": id, "fila":filas[i]})
    }
}

function seleccionarFila(id){
    // Si se hace click sobre una fila ya seleccionada, se deselecciona
    if (idUsuarioSeleccionado != id){
        idUsuarioSeleccionado = id;
        // console.log(id)
        for (let i = 0; i < filasConId.length; i++){
            // se quita el color azul a todas las filas y se pone a la que tiene el id seleccionado
            if (filasConId[i].id == id){
                filasConId[i].fila.classList.add("table-primary");
                // console.log(`Se le va a añadir color a la fila con id ${filasConId[i].id}`)
            }
            else{
                // console.log(`Se le va a quitar color a la fila con id ${filasConId[i].id}`)
                filasConId[i].fila.classList.remove("table-primary");
            }
        }
        mostrarBotones();
    }
    else{
        idUsuarioSeleccionado = null;
        let filaADeseleccionar = filasConId.find(obj => obj.id == id)
        filaADeseleccionar.fila.classList.remove("table-primary");
        ocultarBotones();
    }

}

function ocultarBotones(){
    // console.log(botones)
    for (button of botones){
        button.style.display = 'none';
    }
}
function mostrarBotones(){
    // console.log(botones)
    for (button of botones){
        // poner la propiedad display igual a una cadena de caracteres vacia hace que tome el valor por defecto
        button.style.display = '';
    }
}

function eliminarUsuario(){
    if (idUsuarioSeleccionado != null)
        httpGet(`peticiones.jsp?proceso=eliminarUsuario&id=${idUsuarioSeleccionado}`, actualizarLista)
}

let modifDiv = document.querySelector("#modificarUsuarioDiv")
function modificarUsuario(){
    console.log(`Modificando un usuario${idUsuarioSeleccionado}`)
    if (idUsuarioSeleccionado != null)
        httpGet(`peticiones.jsp?proceso=obtenerUsuario&id=${idUsuarioSeleccionado}`, llenarFormulario);
}
function llenarFormulario(response){
    document.querySelector("#lista").style.opacity = "50%";
    // Se le pone el event listener al boton
    let cancelButton = document.querySelector("#cancelButton")
    cancelButton.onclick = ()=>window.location.href = 'lista.html';
    let datos = JSON.parse(response.data)

    console.log(datos)
    datos['passwordVerif'] = datos['password']

    let inputsYSelects = document.querySelectorAll("#modificarUsuarioDiv input, #modificarUsuarioDiv select");
    for (let elemento of inputsYSelects){
        if(elemento.type != 'submit'){
            let name = elemento.name;
            elemento.value = datos[name];

        }
    }
    modifDiv.style.display = "block";

}
function actualizarLista(){
    window.location.href = 'lista.html'
}

seleccionarFilas();
