let tablaLlena = false;
let tablaUsuarios = document.querySelector("#tablaUsuarios")
let encabezadoTablaUsuarios = "<tr><th>ID usuario</th><th>Tipo documento</th> <th>Número documento</th><th>Correo</th> <th>Número de teléfono</th> <th>Contraseña</th><th>Correo Verificado</th><th>Nombres</th><th>Apellidos</th><th>Fecha de nacimiento</th></tr>";
let nombresColumnasDB = ['id_usuario', 'tipo_documento', 'num_documento', 'correo', 'num_telefono', 'password', 'correo_verificado', 'nombres', 'apellidos', 'fecha_nacimiento']
// [{'id_usuario':"ID usuario", 'tipo_documento':'Tipo documento', 'num_documento':'Número documento', 'correo':'Correo', 'num_telefono':'Número de teléfono', 'password':'Contraseña', 'correo_verificado':'Correo verificado', 'nombres':'Nombres', 'apellidos':'Apellidos', 'fecha_nacimiento':'Fecha de nacimiento'}]
function construirFila(row){
    // console.log(Object.keys(row))
    let fila = "<tr>"
    
    for (let key of nombresColumnasDB){
        // console.log(row[key])
        fila += `<td>${row[key]}</td>`
    }
    fila += "</tr>"
    return fila;
}



function llenarTabla(response){
    let datos = JSON.parse(response.data);
    ocultarBotones();
    let contenidoTabla = encabezadoTablaUsuarios;
    // console.log(datos)
    for (let row of datos){
        // console.log(row)
        contenidoTabla += construirFila(row);
    }
    tablaUsuarios.innerHTML = contenidoTabla;

    tablaLlena = true;
    seleccionarFilas();
}

let body = document.querySelector("body")
body.onload = () => httpGet('peticiones.jsp?proceso=listarUsuarios', llenarTabla)