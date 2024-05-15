using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;

namespace pokedex_web
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(Page is Loginpagina || Page is Default || Page is Registro || Page is Error))
            {
                if (!Seguridad.sesionActiva(Session["trainee"]))
                    Response.Redirect("Loginpagina.aspx", false);
            }
            
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("LoginPagina.aspx", false);
        }
    }
}