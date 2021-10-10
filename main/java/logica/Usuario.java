
package logica;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import persistencia.ConexionBD;

/**
 * @author lalbr
 */
public class Usuario {
     // Configuracion de la conexion a la base de datos 
    private String id_usuario;
    private String correo;
    private String num_telefono;
    private String password;
    private boolean correo_verificado;
    private String nombres;
    private String apellidos;
    private String fechaNacimiento;
    //Constructor sin parmetros		

    public Usuario() {
        this.correo_verificado = false;
    }
     public Usuario getUsuario(String usuario)throws SQLException{
        this.id_usuario=usuario;
        return this.getUsuario();
     }
    public Usuario(String id, String correo, String numTel, String pass, boolean corrVerif, String nombres, String apellidos, String fechaNacimiento) {
        setId_usuario(id);
        setCorreo(correo);
        setNum_telefono(numTel);
        setPassword(pass);
        setCorreo_verificado(corrVerif);
        setNombres(nombres);
        setApellidos(apellidos);
        setFechaNacimiento(fechaNacimiento);
    }
     @Override
    public String toString() {
        String stringToPrint= String.format(java.util.Locale.US,"{id_usuario:%s, correo:%s, num_telefono:%s, password:%s, correo_verificado:%b, nombres:%s, apellidos:%s, fechaNacimiento:%s};",getId_usuario(), getCorreo(), getNum_telefono(), getPassword(), getCorreo_verificado(), getNombres(), getApellidos(), getFechaNacimiento());
        return stringToPrint;
    }
     public String getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(String id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getNum_telefono() {
        return num_telefono;
    }

    public void setNum_telefono(String num_telefono) {
        this.num_telefono = num_telefono;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getCorreo_verificado() {
        return correo_verificado? 1 : 0;
    }

    public void setCorreo_verificado(boolean correo_verificado) {
        this.correo_verificado = correo_verificado;
    }
    public String getFechaNacimiento(){
        return this.fechaNacimiento;
    }
    public void setFechaNacimiento(String fechaNac){
        this.fechaNacimiento = fechaNac;
    }
    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }
    
    // public void llenarUsuario(String id, String correo, String numTel, String pass, boolean corrVerif, String nombres, String apellidos){
    //     this.id_usuario=id;
    //     this.correo=correo;
    //     this.num_telefono=numTel;
    //     this.password=pass;
    //     this.correo_verificado=corrVerif;
    //     this.nombres=nombres;
    //     this.apellidos=apellidos;
        
    // }
    public boolean guardarUsuario(){
        System.out.println("se intenta guardar");
        ConexionBD conexion=new ConexionBD();
        String sentencia="INSERT INTO usuarios(id_usuario,correo,num_telefono,password,correo_verificado,nombres,apellidos, fecha_nacimiento) "
                +"VALUE('"+getId_usuario()+"','"+getCorreo()+"','"+getNum_telefono()+"','"+getPassword()+"','"+getCorreo_verificado()+"',"
                +"'"+getNombres()+"','"+getApellidos()+"', '"+getFechaNacimiento() + "'); ";
        System.out.println(sentencia);
        if (conexion.setAutoCommitBD(false)){
            if(conexion.insertarBD(sentencia)){
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }
        } else {
            conexion.cerrarConexion();
            return false;
        }
    }
    
    public boolean borrarUsuario(String id_usuario){
        System.out.println("se intenta borrar");
        String sentencia="DELETE FROM 'usuarios' WHERE 'id_usuario'='"+id_usuario+"'";
        ConexionBD conexion=new ConexionBD();
        if (conexion.setAutoCommitBD(false)){
            if(conexion.actualizarBD(sentencia)){
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }
        } else {
            conexion.cerrarConexion();
            return false;
        }
    }
    
    public boolean actualizarUsuario(){
        System.out.println("se intenta actualizar");
        ConexionBD conexion=new ConexionBD();
        String sentencia="UPDATE 'usuarios' SET correo='" +this.correo+ "',num_telefono='"+this.num_telefono+"',password='"+this.password+"',correo_verificado='"+correo_verificado+"',"
                +"nombres='"+this.nombres+"',apellidos='"+this.apellidos+"' WHERE id_usuario=" +this.id_usuario+";";
        if (conexion.setAutoCommitBD(false)){
            if(conexion.actualizarBD(sentencia)){
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }
        } else {
            conexion.cerrarConexion();
            return false;
        }
    }
    
    public List<Usuario> ListarUsuarios() throws SQLException{
        System.out.println("se intenta consultar");
        ConexionBD conexion=new ConexionBD();
        List<Usuario> listaUsuarios = new ArrayList<>();
        String sql="select * from usuarios order by apellidos asc";
        System.out.println("Aqui");
        ResultSet rs=conexion.consultarBD(sql);
        Usuario u;
        while (rs.next()){
            u=new Usuario();
            u.setId_usuario(rs.getString("id_usuario"));
            u.setCorreo(rs.getString("correo"));
            u.setCorreo_verificado(Boolean.parseBoolean(rs.getString("correo_verificado")));
            u.setNum_telefono(rs.getString("num_telefono"));
            u.setPassword(rs.getString("password"));
            u.setNombres(rs.getString("nombres"));
            u.setApellidos(rs.getString("apellidos"));
            u.setFechaNacimiento(rs.getString("fecha_nacimiento"));
            listaUsuarios.add(u);
        }
        conexion.cerrarConexion();
        return listaUsuarios;    
    }
    
    public Usuario getUsuario() throws SQLException{
        ConexionBD conexion=new ConexionBD();
        String sql="select * from usuarios where id_usuarios='"+this.id_usuario+"'";
        ResultSet rs=conexion.consultarBD(sql);
        if (rs.next()){
            this.id_usuario=rs.getString("id_usuario");
            this.correo=rs.getString("correo");
            this.num_telefono=rs.getString("num_telefono");
            this.password=rs.getString("password");
            this.nombres=rs.getString("nombres");
            this.apellidos=rs.getString("apellidos");
            conexion.cerrarConexion();
            return this;        
        } else {
            conexion.cerrarConexion();
            return null;
        }
    }

}
