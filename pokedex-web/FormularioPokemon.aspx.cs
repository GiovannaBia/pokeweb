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
    public partial class AgregarPokemon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtId.Enabled = false;
            var id = 0;

            try
            {
                if (!IsPostBack)
                {
                    List<Elemento> elemento = new List<Elemento>();
                    ElementoNegocio nego = new ElementoNegocio();
                    ddlTipo.DataSource = nego.listar();
                    ddlTipo.DataValueField = "Id";
                    ddlTipo.DataTextField = "Descripcion";
                    ddlTipo.DataBind();
                    ddlDebilidad.DataSource = nego.listar();
                    ddlDebilidad.DataValueField = "Id";
                    ddlDebilidad.DataTextField = "Descripcion";
                    ddlDebilidad.DataBind();
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex);
                throw;
            }

            //if (id != 0)
            //{
            //    PokemonNegocio negocio = new PokemonNegocio();
            //    Pokemon poke = negocio.buscarPorId(id);
            //    txtNombre.Text = poke.Nombre;
            //    txtDescripcion.Text = poke.Descripcion;
            //    ddlTipo.Text = poke.Tipo.Descripcion;
            //    ddlDebilidad.Text = poke.Debilidad.Descripcion;
            //}
        }

        protected void btnAceptar_Click (object sender, EventArgs e)
        {
            try
            {
                Pokemon nuevo = new Pokemon();
                PokemonNegocio negocio = new PokemonNegocio();

                nuevo.Numero = int.Parse(txtNumero.Text);
                nuevo.Nombre = txtNombre.Text;
                nuevo.Descripcion = txtDescripcion.Text;
                nuevo.UrlImagen = txtUrlImagen.Text;
                nuevo.Tipo = new Elemento();
                nuevo.Tipo.Id = int.Parse(ddlTipo.SelectedValue);
                nuevo.Debilidad = new Elemento();
                nuevo.Debilidad.Id = int.Parse(ddlDebilidad.SelectedValue);

                negocio.agregarConSP(nuevo);
                Response.Redirect("PokemonLista.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex);
                throw;
            }
        }

        protected void txtUrlImagen_TextChanged(object sender, EventArgs e)
        {
            UrlImagen.ImageUrl = txtUrlImagen.Text;
        }
    }
}