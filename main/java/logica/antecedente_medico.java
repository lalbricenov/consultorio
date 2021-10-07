package logica;

/**
 *
 * @author ESSAR
 */
public class antecedente_medico {
    private int id_antecedente;
    private String nombre;

    public antecedente_medico() {
    }

    public antecedente_medico(int id_antecedente, String nombre) {
        this.id_antecedente = id_antecedente;
        this.nombre = nombre;
    }

    public int getId_antecedente() {
        return id_antecedente;
    }

    public void setId_antecedente(int id_antecedente) {
        this.id_antecedente = id_antecedente;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    
}
