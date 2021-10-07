package logica;

/**
 *
 * @author ESSAR
 */
public class Antecedente_medico {
    private int id_antecedente;
    private String nombre;

    public Antecedente_medico() {
    }

    public Antecedente_medico(int id_antecedente, String nombre) {
        setId_antecedente(id_antecedente);
        setNombre(nombre);
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
