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
    public partial class PokemonLista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PokemonNegocio negocio = new PokemonNegocio();
            Session.Add("listaPokemon", negocio.listarConSP());
            dgvPokemons.DataSource = Session["listaPokemon"];
            dgvPokemons.DataBind();
        }

        protected void dgvPokemons_SelectedIndexChanged(object sender, EventArgs e)
        {
            var id = dgvPokemons.SelectedDataKey.Value.ToString();
            Response.Redirect("FormularioPokemon.aspx?id=" + id);  //No lo tomare para agregar poke sino para modificar,
        }                                        //luego en el back evaluo, si tengo id modifico, sino doy de alta!

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("FormularioPokemon.aspx");
        }

        protected void dgvPokemons_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvPokemons.PageIndex = e.NewPageIndex;
            dgvPokemons.DataBind();
        }

        protected void txtFiltro_TextChanged(object sender, EventArgs e)
        {
            List<Pokemon> lista = (List<Pokemon>)Session["listaPokemon"];
            List<Pokemon> listaFitrada = lista.FindAll(x => x.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper()));
            dgvPokemons.DataSource = listaFitrada;
            dgvPokemons.DataBind();
        }

        protected void chkAvanzado_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void ddlCampo_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {

        }
    }
}