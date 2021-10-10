<%-- 
    Document   : peticiones
    Created on : Sep 29, 2021, 9:55:33 PM
    Author     : lalbr
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="logica.Usuario"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="application/json;charset=iso-8859-1" language="java"
        pageEncoding="iso-8859-1" session="true"%>

<%//iniciar respuesta JSon
        Usuario u1 = new Usuario();
        Map<String, String> respuesta = new HashMap<>();
        
        List<String> tareas = Arrays.asList(new String[]{
            "actualizarUsuario",
            "eliminarUsuario",
            "listarUsuarios",
            "guardarUsuario",});
        String proceso = "" + request.getParameter("proceso");
//validacion de parametros utilizando en cada uno de los procesos
        if (tareas.contains(proceso)) {
            respuesta.put("ok", "true");
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
                if (u1.borrarUsuario("id")) {
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
                String correo = request.getParameter("correo");
                String num_telefono = request.getParameter("num_telefono");
                String password = request.getParameter("password");
                Boolean correo_verificado = Boolean.parseBoolean(request.getParameter("correo_verificado"));
                String nombres = request.getParameter("nombres");
                String apellidos = request.getParameter("apellidos");
                int edad = Integer.parseInt(request.getParameter("edad"));
                
                u1.actualizarUsuario();
                
                if (u1.actualizarUsuario()) {
                    respuesta.put(proceso, "true");
                } else {
                    respuesta.put(proceso, "false");
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
