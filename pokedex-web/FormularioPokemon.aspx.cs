using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pokedex_web
{
    public partial class AgregarPokemon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ddlTipo.Items.Add("Fuego");
            ddlTipo.Items.Add("Tierra");

            ddlDebilidad.Items.Add("Agua");
        }

        protected void btnAceptar_Click (object sender, EventArgs e)
        {

        }
    }
}