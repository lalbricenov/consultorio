<%-- 
    Document   : Peticiones
    Created on : 28/09/2021, 8:31:11 p. m.
    Author     : BMPI
--%><%@page import="logica.Usuario"%>

//importar librerias
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="logica.Usuario"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%//iniciar respuesta JSon
        Usuario u1 = new Usuario();
        String respuesta = "{";
        List<String> tareas = Arrays.asList(new String[]{
            "actualizarUsuario",
            "eliminarUsuario",
            "listarUsuario",
            "guardarUsuario",});

        String proceso = "" + request.getParameter("proceso");

//validacion de parametros utilizando en cada uno de los procesos
        if (tareas.contains(proceso)) {
            respuesta += "\"ok\": true,";
            //iniciar los respectivos procesos
            if (proceso.equals("guardarUsuario")) { 
                System.out.println("Se está tratando de guardar un usuario");
                String tipoDoc = request.getParameter("tipoDoc");
                String numDoc = request.getParameter("numDoc");
                String id = tipoDoc + numDoc;
                String correo = request.getParameter("correo");
                String num_telefono = request.getParameter("numTel");
                String password = request.getParameter("pass");
                String passVerif = request.getParameter("passVerif");
                
                if (password.equals(passVerif))
                {
                    Boolean correo_verificado = false;
                    String nombres = request.getParameter("nombres");
                    String apellidos = request.getParameter("apellidos");
                    String fechaNacimiento = request.getParameter("fechaNacimiento");
                    u1 = new Usuario(id, correo, num_telefono, password, correo_verificado, nombres, apellidos, fechaNacimiento);

                    if (u1.guardarUsuario()) {
                        respuesta += "\"" + proceso + "\": true";
                    } else {
                        respuesta += "\"" + proceso + "\": false";
                    }
                }else{
                    System.out.println("Error, las claves no coinciden");
                    respuesta += "\"" + proceso + "\": false";
                }
                

            } else if (proceso.equals("eliminarUsuario")) {
                int id = Integer.parseInt(request.getParameter("id"));
                if (u1.borrarUsuario("id")) {
                    respuesta += "\"" + proceso + "\": true";
                } else {
                    respuesta += "\"" + proceso + "\": false";
                }
            } else if (proceso.equals("listarUsuario")) {
                try {
                    List<Usuario> lista = u1.ListarUsuarios();
                    respuesta += "\"" + proceso + "\": true,\"Usuarios\":" + new Gson().toJson(lista);
                } catch (SQLException ex) {
                    respuesta += "\"" + proceso + "\": true,\"Usuarios\":[]";
                    Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else if (proceso.equals("actualizarUsuario")) {
                int id = Integer.parseInt(request.getParameter("id"));
                String correo = request.getParameter("correo");
                String num_telefono = request.getParameter("num_telefono");
                String password = request.getParameter("password");
                Boolean correo_verificado = Boolean.parseBoolean(request.getParameter("correo_verificado"));
                String nombres = request.getParameter("nombres");
                String apellidos = request.getParameter("apellidos");
                int edad = Integer.parseInt(request.getParameter("edad"));
                
                u1.actualizarUsuario();
                

                if (u1.actualizarUsuario()) {
                    respuesta += "\"" + proceso + "\": true";
                } else {
                    respuesta += "\"" + proceso + "\": false";
                }
            }

        } else {
            respuesta += "\"ok\":false,";
            respuesta += "\"error\": \"INVALID\",";
            respuesta += "\"errorMsg\": \"lo sentimos, los datos que ha enviado,"
                    + " son invalidos. Corijalos y vuelva a intentar por favor. \"";
        }

    respuesta += "}" ;
    response.setContentType ("application/json;charset=iso-8859-1");
    out.print (respuesta);
%>   
