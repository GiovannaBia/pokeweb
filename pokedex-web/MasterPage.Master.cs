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
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //arranca ccon la imagen en anonimo digamos, luego evalua si hay sesion o nó
            imagenAvatar.ImageUrl = "https://simg.nicepng.com/png/small/202-2022264_usuario-annimo-usuario-annimo-user-icon-png-transparent.png";
            if (!(Page is Loginpagina || Page is Default || Page is Registro || Page is Error))
            {
                if (!Seguridad.sesionActiva(Session["trainee"]))
                    Response.Redirect("Loginpagina.aspx", false);
            }

            if (Seguridad.sesionActiva(Session["trainee"]))
            {
                Trainee user = new Trainee();
                user = (Trainee)Session["trainee"];
                imagenAvatar.ImageUrl = "~/Images/" + ((Trainee)Session["trainee"]).ImagenPerfil;
                lblUser.Text = user.Email;
            }
            else
            {
                imagenAvatar.ImageUrl = "https://www.palomacornejo.com/wp-content/uploads/2021/08/no-image.jpg";
            }
            
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("LoginPagina.aspx", false);
        }
    }
}