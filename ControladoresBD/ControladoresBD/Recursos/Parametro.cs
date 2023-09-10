namespace ControladoresBD.Recursos
{
    public class Parametro
    {
        public Parametro(String nombre, String valor)
        { 
            Nombre= nombre;
            Valor= valor;         
        }
        public String Nombre { get; set; }
        public String Valor { get; set; }

    }
}
