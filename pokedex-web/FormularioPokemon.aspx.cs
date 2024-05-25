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
        public bool ConfirmarEliminacion { get; set;  }
        protected void Page_Load(object sender, EventArgs e)
        {
            ConfirmarEliminacion = false;
            txtId.Enabled = false;

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

                string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                if (id != null && !IsPostBack)  //Quiere decir que vamos a modificar! 
                {
                    PokemonNegocio negocio = new PokemonNegocio();
                    List<Pokemon> lista = negocio.listar((id));
                    Pokemon seleccionado = lista[0];

                    //guardo objeto en session
                    Session.Add("pokeSeleccionado", seleccionado);

                    txtId.Text = seleccionado.Id.ToString();
                    txtNumero.Text = seleccionado.Numero.ToString();
                    txtNombre.Text = seleccionado.Nombre;
                    txtDescripcion.Text = seleccionado.Descripcion;
                    ddlTipo.SelectedValue = seleccionado.Tipo.Id.ToString();
                    ddlDebilidad.SelectedValue = seleccionado.Debilidad.Id.ToString();
                    txtUrlImagen_TextChanged(sender, e);

                    //dependiendo del estado activo o no
                    if (!seleccionado.Activo)
                    {
                        btnInactivar.Text = "Reactivar";
                    }
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());               
                Response.Redirect("Error.aspx", false);
            }

            
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

                if(Request.QueryString["id"] != null)
                {
                    nuevo.Id = int.Parse(Request.QueryString["id"]);
                    negocio.modificarConSP(nuevo);
                }
                else
                {
                    negocio.agregarConSP(nuevo);
                }
                    
                Response.Redirect("PokemonLista.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void txtUrlImagen_TextChanged(object sender, EventArgs e)
        {
            UrlImagen.ImageUrl = txtUrlImagen.Text;
        }

        protected void btnEliminar_Click (object sender, EventArgs e)
        {
            ConfirmarEliminacion = true;
        }

        protected void btnConfirmaEliminar_Click(object sender, EventArgs e)
        {

        }

        protected void btnInactivar_Click(object sender, EventArgs e)
        {
            try
            {

                PokemonNegocio negocio = new PokemonNegocio();
                //recupero el objeto seleccionado guardado en la sesion
                Pokemon seleccionado = (Pokemon)Session["pokeSeleccionado"];
                negocio.eliminarLogico(seleccionado.Id, !seleccionado.Activo);
                Response.Redirect("PokemonLista.aspx");
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    }

    
}