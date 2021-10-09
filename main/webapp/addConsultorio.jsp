<%-- 
    Document   : addConsultorio
    Created on : Oct 6, 2021, 9:34:06 PM
    Author     : lalbr
--%>

<%@page import="logica.Consultorio"%>
<%
    String nombre = request.getParameter("nombre");
    String direccion = request.getParameter("direccion");
    String telefono = request.getParameter("telefono");
    int id = 1;

    Consultorio nuevoCons = new Consultorio(id, nombre, direccion, telefono);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
    <body>  
        <ul>
            <li>
                <%= "id_consultorio: " + nuevoCons.getId_consultorio()%>
            </li>
            <li>
                <%= "direccion: " + nuevoCons.getDireccion()%>
            </li>
            <li>
                <%= "telefono: " + nuevoCons.getTelefono()%>
            </li>
            <li>
                <%= "nombre: " + nuevoCons.getNombre()%>
            </li>
            
        </ul>


    </form>  
</body>  
</html>  
