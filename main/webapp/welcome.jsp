<%-- 
    Document   : welcome
    Created on : Sep 29, 2021, 10:09:46 PM
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
                    String name = request.getParameter("uname");
                    out.print("welcome " + name);
                %>
            </li>
            <li>
                <%= "Hello" + name%>
            </li>
            <li>
                Current Time: <%= java.util.Calendar.getInstance().getTime() %>
            </li>
        </ul>
            
        <p>
            Ahora tratamos de crear un usuario con los datos dados
        </p>
        <%
            
            //Usuario prueba = newUsuario(id, correo, numTel, pass, corrVerif, nombres, apellidos);
        %>

    </form>  
</body>  
</html>  
