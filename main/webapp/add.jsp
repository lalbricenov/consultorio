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
                    String tipoDoc = request.getParameter("tipoDoc");
                    String numDoc = request.getParameter("numDoc");
                    String id = tipoDoc + numDoc;
                    String correo = request.getParameter("correo");
                    String numTel = request.getParameter("numTel");
                    String pass = request.getParameter("pass");
                    String passVerif = request.getParameter("passVerif");
                    String nombres = request.getParameter("nombres");
                    String apellidos = request.getParameter("apellidos");
                    
                    Usuario prueba = new Usuario(id, correo, numTel, pass, false, nombres, apellidos);
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
