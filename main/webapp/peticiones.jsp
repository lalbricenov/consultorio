<%-- 
    Document   : peticiones
    Created on : Sep 29, 2021, 9:55:33 PM
    Author     : lalbr
--%>

<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="application/json;charset=iso-8859-1" language="java"
        pageEncoding="iso-8859-1" session="true"%>

<% // Iniciando respuesta JSON. 
    String respuesta = "{";
//Lista de procesos o tareas a realizar
    List<String> tareas = Arrays.asList(new String[]{
        "guardar",
        "eliminar",
        "actualizar",
        "listar"
    });
    String proceso = "" + request.getParameter("proceso");
// Validación de parámetros utilizados en todos los procesos.
    if (tareas.contains(proceso)) {
        respuesta += "\"ok\": true,";
// -------------------------------------------------------------------------------------
//
// -----------------------------------INICIO PROCESOS-----------------------------------
//
// -------------------------------------------------------------------------------------
//
        if (proceso.equals("guardar")) {
//Solicitud de parámetros enviados desde el frontend
//, uso de request.getParameter("nombre parametro")
// creación de objeto y llamado a método guardar
            if (guardar()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
        } else if (proceso.equals("eliminar")) {
//Solicitud de parámetros enviados desde el frontned
//, uso de request.getParameter("nombre parametro")
//creación de objeto y llamado a método eliminar
            if (<llamado 
                
                
                a metodo eliminar >
            
            
            
                ) {
respuesta += "\"" + proceso + "\": true";
            }else {
respuesta += "\"" + proceso + "\": false";
}
        } else if (proceso.equals("listar")) {
//Solicitud de parámetros enviados desde el frontned
//, uso de request.getParameter("nombre parametro")
//creación de objeto y llamado al metodo listar
            try {
                List<TipoObjeto> lista = llamado a metodo que retorne lista;
                respuesta += "\"" + proceso + "\": true,\"NombreLista\":" + new Gson().toJson(lista);
            } catch (SQLException ex) {
                respuesta += "\"" + proceso + "\": true,\"NombreLista\":[]";
                Logger.getLogger(Contacto.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("actualizar")) {
//creación de objeto y llamado al metodo actualizar
            if (<llamado 
                
                
                a metodo actualizar >
            
            
            
                ) {
respuesta += "\"" + proceso + "\": true";
            }else {
respuesta += "\"" + proceso + "\": false";
}
        }
// ------------------------------------------------------------------------------------- //
// -----------------------------------FIN PROCESOS--------------------------------------
//
// -------------------------------------------------------------------------------------
//
// Proceso desconocido.
    } else {
        respuesta += "\"ok\": false,";
        respuesta += "\"error\": \"INVALID\",";
        respuesta += "\"errorMsg\": \"Lo sentimos, los datos que ha enviado,"
                + " son inválidos. Corrijalos y vuelva a intentar por favor.\"";
    }
// Responder como objeto JSON codificación ISO 8859-1.
    respuesta += "}";
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);
%>
