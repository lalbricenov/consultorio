<%-- 
    Document   : Peticiones
    Created on : 28/09/2021, 8:31:11 p. m.
    Author     : BMPI
--%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="logica.Usuario"%>


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
        Map<String, String> respuesta = new HashMap<>();
        
        List<String> tareas = Arrays.asList(new String[]{
            "actualizarUsuario",
            "eliminarUsuario",
            "listarUsuarios",
            "obtenerUsuario",
            "guardarUsuario",});

        String proceso = "" + request.getParameter("proceso");

//validacion de parametros utilizando en cada uno de los procesos
        if (tareas.contains(proceso)) {
            respuesta.put("ok", "true");
            //iniciar los respectivos procesos
            if (proceso.equals("guardarUsuario")) { 
                System.out.println("Se está tratando de guardar un usuario");
                String tipo_documento = request.getParameter("tipo_documento");
                String num_documento = request.getParameter("num_documento");
                String correo = request.getParameter("correo");
                String num_telefono = request.getParameter("num_telefono");
                String password = request.getParameter("password");
                String passwordVerif = request.getParameter("passwordVerif");
                System.out.println(tipo_documento + num_documento);
                if (password.equals(passwordVerif))
                {
                    Boolean correo_verificado = false;
                    String nombres = request.getParameter("nombres");
                    String apellidos = request.getParameter("apellidos");
                    String fecha_nacimiento = request.getParameter("fecha_nacimiento");
                    u1 = new Usuario(num_documento, tipo_documento, correo, num_telefono, password, correo_verificado, nombres, apellidos, fecha_nacimiento);

                    if (u1.guardarUsuario()) {
                        respuesta.put(proceso, "true");
                    } else {
                        respuesta.put(proceso, "false");
                    }
                }else{
                    System.out.println("Error, las claves no coinciden");
                    respuesta.put(proceso, "false");
                }
                

            } else if (proceso.equals("eliminarUsuario")) {
                int id = Integer.parseInt(request.getParameter("id"));
                System.out.println("Id a eliminar "+ id);
                if (u1.borrarUsuario(id)) {
                    respuesta.put(proceso, "true");
                } else {
                    respuesta.put(proceso, "false");
                }
            } else if (proceso.equals("listarUsuarios")) {
                try {
                    System.out.println("Se está tratando de listar los usuarios");
                    List<Usuario> lista = u1.ListarUsuarios();
                    respuesta.put(proceso, "true");
                    
                    System.out.println(lista);
                    respuesta.put("data", new Gson().toJson(lista) );
                } catch (SQLException ex) {
                    respuesta.put(proceso, "false");
                    respuesta.put("data", "[]");
                    Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else if (proceso.equals("actualizarUsuario")) {
                int id = Integer.parseInt(request.getParameter("id"));
                String tipo_documento = request.getParameter("tipo_documento");
                String num_documento = request.getParameter("num_documento");
                String correo = request.getParameter("correo");
                String num_telefono = request.getParameter("num_telefono");
                String password = request.getParameter("password");
                String passwordVerif = request.getParameter("passwordVerif");
                Boolean correo_verificado = Boolean.parseBoolean(request.getParameter("correo_verificado"));
                String nombres = request.getParameter("nombres");
                String apellidos = request.getParameter("apellidos");
                String fecha_nacimiento = request.getParameter("fecha_nacimiento");
                // se crea el objeto de tipo usuario con todos los datos nuevos.
                u1 = new Usuario(id, num_documento, tipo_documento, correo, num_telefono, password, correo_verificado, nombres, apellidos, fecha_nacimiento);
                if (password.equals(passwordVerif))
                {
                    if (u1.actualizarUsuario()) {
                        respuesta.put(proceso, "true");
                    } else {
                        respuesta.put(proceso, "false");
                    }                    
                }                

            }else if (proceso.equals("obtenerUsuario")){
                try {
                    String id_usuario = request.getParameter("id");
                    System.out.println("Se está tratando de obtener un usuario");
                    u1.obtenerUsuario(id_usuario);
                    respuesta.put(proceso, "true");
                    
                    System.out.println(u1);
                    respuesta.put("data", new Gson().toJson(u1) );
                } catch (SQLException ex) {
                    respuesta.put(proceso, "false");
                    respuesta.put("data", "[]");
                    Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
                }
                
            }

        } else {
            respuesta.put("ok", "false");
            respuesta.put("error", "InvalidRequest");
            respuesta.put("errorMsg", "The type of request is invalid");
        }
    response.setContentType ("application/json;charset=utf-8");
    System.out.println("Ya se va a mandar la respuesta");
    System.out.println(respuesta);
    out.print(new Gson().toJson(respuesta));
%>   
