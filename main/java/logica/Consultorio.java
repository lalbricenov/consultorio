
package logica;
/**
 *
 * @author ESSAR
 */
public class Consultorio {
    //Atributos
    private int id_consultorio;
    private String nombre;
    private String direccion;
    private String telefono;
    //Constructores
    public Consultorio() {
        
    }

    public Consultorio(int id_consultorio, String nombre, String direccion, String telefono) {
        setId_consultorio(id_consultorio);
        setNombre(nombre);
        setDireccion(direccion);
        setTelefono(telefono);
    }

    public int getId_consultorio() {
        return id_consultorio;
    }

    public void setId_consultorio(int id_consultorio) {
        this.id_consultorio = id_consultorio;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    
    
}
