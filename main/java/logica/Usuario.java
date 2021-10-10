
package logica;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import persistencia.ConexionBD;

/**
 * @author lalbr
 */
public final class Usuario {
     // Configuracion de la conexion a la base de datos 
    private String num_documento;
    private int id_usuario;
    private String tipo_documento;
    private String correo;
    private String num_telefono;
    private String password;
    private boolean correo_verificado;
    private String nombres;
    private String apellidos;
    private String fecha_nacimiento;
    //Constructor sin parmetros		

    public Usuario() {
        this.correo_verificado = false;
    }

    public Usuario(int id, String num_documento, String tipo_documento, String correo, String num_telefono, String password, boolean corrVerif, String nombres, String apellidos, String fecha_nacimiento) {
        setId_usuario(id);
        setTipo_documento(tipo_documento);
        setNum_documento(num_documento);
        setCorreo(correo);
        setNum_telefono(num_telefono);
        setPassword(password);
        setCorreo_verificado(corrVerif);
        setNombres(nombres);
        setApellidos(apellidos);
        setFecha_nacimiento(fecha_nacimiento);
    }
    public Usuario(String num_documento, String tipo_documento, String correo, String num_telefono, String password, boolean corrVerif, String nombres, String apellidos, String fecha_nacimiento) {
        // Este constructor crea un usuario con id igual a -1
        setId_usuario(-1);
        setTipo_documento(tipo_documento);
        setNum_documento(num_documento);
        setCorreo(correo);
        setNum_telefono(num_telefono);
        setPassword(password);
        setCorreo_verificado(corrVerif);
        setNombres(nombres);
        setApellidos(apellidos);
        setFecha_nacimiento(fecha_nacimiento);
    }
    
    @Override
    public String toString() {
        String stringToPrint= String.format(java.util.Locale.US,"{id_usuario:%d, tipo_documento:%s, num_documento:%s, correo:%s, num_telefono:%s, password:%s, correo_verificado:%b, nombres:%s, apellidos:%s, fecha_nacimiento:%s};",getId_usuario(), getTipo_documento(), getNum_documento(), getCorreo(), getNum_telefono(), getPassword(), getCorreo_verificado(), getNombres(), getApellidos(), getFecha_nacimiento());
        return stringToPrint;
    }
    
    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }
    public String getNum_documento() {
        return num_documento;
    }

    public void setNum_documento(String num_documento) {
        this.num_documento = num_documento;
    }
    
    public String getTipo_documento() {
        return tipo_documento;
    }

    public void setTipo_documento(String tipo_documento) {
        this.tipo_documento = tipo_documento;
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

    public boolean getCorreo_verificado() {
        return correo_verificado;
    }
    public int getCorreo_verificadoInt() {
        return correo_verificado? 1 : 0;
    }

    public void setCorreo_verificado(boolean correo_verificado) {
        this.correo_verificado = correo_verificado;
    }
    public String getFecha_nacimiento(){
        return this.fecha_nacimiento;
    }
    public void setFecha_nacimiento(String fechaNac){
        this.fecha_nacimiento = fechaNac;
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
    
    // public void llenarUsuario(String id, String correo, String num_telefono, String password, boolean corrVerif, String nombres, String apellidos){
    //     this.id_usuario=id;
    //     this.correo=correo;
    //     this.num_telefono=num_telefono;
    //     this.password=password;
    //     this.correo_verificado=corrVerif;
    //     this.nombres=nombres;
    //     this.apellidos=apellidos;
        
    // }
    public boolean guardarUsuario(){
        ConexionBD conexion=new ConexionBD();
        String sentencia="INSERT INTO usuarios(tipo_documento, num_documento, correo,num_telefono,password,correo_verificado,nombres,apellidos, fecha_nacimiento) "
                +"VALUE('"+getTipo_documento()+"','"+getNum_documento()+"','"+getCorreo()+"','"+getNum_telefono()+"','"+getPassword()+"','"+getCorreo_verificadoInt()+"',"
                +"'"+getNombres()+"','"+getApellidos()+"', '"+getFecha_nacimiento() + "'); ";
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
    
    public boolean borrarUsuario(int id_usuario){
        String sentencia="DELETE FROM usuarios WHERE id_usuario='"+id_usuario+"'";
        System.out.println(sentencia);
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
        ConexionBD conexion=new ConexionBD();
        String sentencia="UPDATE 'usuarios' SET correo='" +this.correo+ "',tipo_documento='"+this.tipo_documento+ "',num_documento='"+this.num_documento+ "',num_telefono='"+this.num_telefono+"',password='"+this.password+"',correo_verificado='"+correo_verificado+"',"
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
        ConexionBD conexion=new ConexionBD();
        List<Usuario> listaUsuarios = new ArrayList<>();
        String sql="select * from usuarios order by apellidos asc";
        ResultSet rs=conexion.consultarBD(sql);
        Usuario u;
        while (rs.next()){
            u=new Usuario();
            u.setId_usuario(rs.getInt("id_usuario"));
            u.setNum_documento(rs.getString("num_documento"));
            u.setTipo_documento(rs.getString("tipo_documento"));
            u.setCorreo(rs.getString("correo"));
            u.setCorreo_verificado(rs.getBoolean("correo_verificado"));
            u.setNum_telefono(rs.getString("num_telefono"));
            u.setPassword(rs.getString("password"));
            u.setNombres(rs.getString("nombres"));
            u.setApellidos(rs.getString("apellidos"));
            u.setFecha_nacimiento(rs.getString("fecha_nacimiento"));
            listaUsuarios.add(u);
        }
        conexion.cerrarConexion();
        return listaUsuarios;    
    }
    public Usuario obtenerUsuario(String id_usuario) throws SQLException{
        ConexionBD conexion=new ConexionBD();
        
        String sql="select * from usuarios where id_usuario= '"+ id_usuario + "'";
        //System.out.print(sql);
        ResultSet rs=conexion.consultarBD(sql);
        
        if (rs.next()){
            setId_usuario(rs.getInt("id_usuario"));
            setNum_documento(rs.getString("num_documento"));
            setTipo_documento(rs.getString("tipo_documento"));
            setCorreo(rs.getString("correo"));
            setCorreo_verificado(rs.getBoolean("correo_verificado"));
            setNum_telefono(rs.getString("num_telefono"));
            setPassword(rs.getString("password"));
            setNombres(rs.getString("nombres"));
            setApellidos(rs.getString("apellidos"));
            setFecha_nacimiento(rs.getString("fecha_nacimiento"));
            conexion.cerrarConexion();
            return this;    
        }else{
            conexion.cerrarConexion();
            return null;
        }
        
    }
    /*
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
*/
    
}