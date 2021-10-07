
package logica;

/**
 *
 * @author ESSAR
 */
public class medicamento {
    private int id_medicamentos;
    private String nombre;
    private String presentacion;

    public medicamento() {
    }

    public medicamento(int id_medicamentos, String nombre, String presentacion) {
        this.id_medicamentos = id_medicamentos;
        this.nombre = nombre;
        this.presentacion = presentacion;
    }

    public int getId_medicamentos() {
        return id_medicamentos;
    }

    public void setId_medicamentos(int id_medicamentos) {
        this.id_medicamentos = id_medicamentos;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPresentacion() {
        return presentacion;
    }

    public void setPresentacion(String presentacion) {
        this.presentacion = presentacion;
    }
    
    
}
