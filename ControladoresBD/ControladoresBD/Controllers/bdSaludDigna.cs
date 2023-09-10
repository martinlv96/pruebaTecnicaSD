using ControladoresBD.Recursos;
using Microsoft.AspNetCore.Mvc;
using System.Data;
using Newtonsoft.Json;
using ControladoresBD.Models;

namespace ControladoresBD.Controllers
{
    [ApiController]
    [Route("bdSaludDigna")]
    public class bdSaludDigna : ControllerBase
    {
        [HttpGet]
        [Route("EstudiosActivos")]
        public dynamic ListarEstudiosActivos() 
        { 
            DataTable tEstudiosActivos = DBDatos.Listar("GetEstudiosActivos");
            string jsonEstudiosActivos = JsonConvert.SerializeObject(tEstudiosActivos);

            return new
            {
                success = true,
                message = "exito",
                result = new
                {
                    estudiosActivos = JsonConvert.DeserializeObject<List<estudiosActivos>>(jsonEstudiosActivos)
                }
            };
        }

        [HttpGet]
        [Route("SucursalesActivas")]
        public dynamic ListarSucursalesActivos()
        {
            DataTable tSucursalesActivos = DBDatos.Listar("GetSucursalesActivas");
            string jsonSucursalesActivos = JsonConvert.SerializeObject(tSucursalesActivos);

            return new
            {
                success = true,
                message = "exito",
                result = new
                {
                    sucursalesActivas = JsonConvert.DeserializeObject<List<sucursalesActivas>>(jsonSucursalesActivos)
                }
            };
        }
    }
}
