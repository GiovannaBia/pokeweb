using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;
using dominio;

namespace pokedex_web
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id = int.Parse(Request.QueryString["Id"]);

                PokemonNegocio negocio = new PokemonNegocio();
                Pokemon poke = negocio.buscarPorId(id);

                if (poke != null)
                {
                    txtNombre.Text = poke.Nombre;
                    txtDescripcion.Text = poke.Descripcion;
                    txtTipo.Text = poke.Tipo.Descripcion;
                    txtDebilidad.Text = poke.Debilidad.Descripcion;
                }
            }
           
        }
            
            
    }
 }
