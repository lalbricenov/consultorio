function httpGet(url, callback){
    fetch(url)
    .then(response =>{
        if (!response.ok){
            throw new Error(`Request failed with status ${response.status}`)
        }
        // console.log(response)
        return response.json();
    })
    .then(response =>{
        let data = JSON.parse(response.data);
        // console.log(data)
        callback(tablaUsuarios, encabezadoTablaUsuarios, data);
    })
    .catch(error => console.log(error))
}

// let but = document.querySelector("#solicitud")
let tablaUsuarios = document.querySelector("#tablaUsuarios")
let encabezadoTablaUsuarios = "<tr><th>ID usuario</th> <th>Correo</th> <th>Número de teléfono</th> <th>Contraseña</th><th>Correo Verificado</th><th>Nombres</th><th>Apellidos</th><th>Fecha de nacimiento</th></tr>";

function construirFila(row){
    // console.log(Object.keys(row))
    let fila = "<tr>"
    for (let key of Object.keys(row)){
        // console.log(row[key])
        fila += `<td>${row[key]}</td>`
    }
    fila += "</tr>"
    return fila;
}



function llenarTabla(tabla, encabezado, datos){
    let contenidoTabla = encabezado;
    // console.log(datos)
    for (let row of datos){
        // console.log(row)
        contenidoTabla += construirFila(row);
    }
    tabla.innerHTML = contenidoTabla;
}

let body = document.querySelector("body")
body.onload = () => httpGet('peticiones.jsp?proceso=listarUsuarios', llenarTabla)
