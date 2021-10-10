<%-- 
    Document   : welcome
    Created on : Oct 4, 2021, 10:09:46 PM
    Author     : lalbr
--%>

<%@page import="logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
    <body>  
        <ul>
            <li>
                <%
                    String tipo_documento = request.getParameter("tipo_documento");
                    String num_documento = request.getParameter("num_documento");
                    String id = tipo_documento + num_documento;
                    String correo = request.getParameter("correo");
                    String num_telefono = request.getParameter("num_telefono");
                    String password = request.getParameter("password");
                    String passwordVerif = request.getParameter("passwordVerif");
                    String nombres = request.getParameter("nombres");
                    String apellidos = request.getParameter("apellidos");
                    
                    Usuario prueba = new Usuario(id, correo, num_telefono, password, false, nombres, apellidos);
                %>
            </li>
            <li>
                <%= "Hello" + prueba.getCorreo()%>
            </li>
            <li>
                Current Time: <%= java.util.Calendar.getInstance().getTime() %>
            </li>
        </ul>
            
        <p>
            Ahora tratamos de crear un usuario con los datos dados
        </p>

    </form>  
</body>  
</html>  
