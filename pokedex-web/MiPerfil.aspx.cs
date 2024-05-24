using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;
using dominio;

namespace pokedex_web
{
    public partial class MiPerfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Seguridad.sesionActiva(Session["trainee"]))
                {
                    Trainee user = (Trainee)Session["trainee"];
                    txtEmail.Text = user.Email;
                    txtNombre.Text = user.Nombre;
                    txtApellido.Text = user.Apellido;
                    imgNuevoPerfil.ImageUrl = "~/Images/" + user.ImagenPerfil;
                    txtFechaNacimiento.Text = (user.FechaNacimiento.ToString("yyyy-MM-dd")) ;
                }
                else
                {
                    Response.Redirect("LoginPagina.aspx", false);
                }
                

               
              
              
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                TraineeNegocio negocio = new TraineeNegocio();
               
                Trainee user = (Trainee)Session["trainee"];

                if(txtImagen.PostedFile.FileName != "") //escribir imagen solo si se cargo algo, sino sigue como estaba la db (con imagen o sin nada, si no hacia esta validacion me cargaba cualquier cosa, me cambiaba lo que ya tenia)
                {
                    string ruta = Server.MapPath("./Images/");
                    txtImagen.PostedFile.SaveAs(ruta + "perfil-" + user.Id + ".jpg");
                    user.ImagenPerfil = "perfil-" + user.Id + ".jpg";

                }
                user.Nombre = txtNombre.Text;
                user.Apellido = txtApellido.Text;
                user.Email = txtEmail.Text;
                user.FechaNacimiento = DateTime.Parse(txtFechaNacimiento.Text);

                negocio.Actualizar(user);

                // Verificar que la master page no sea nula
                if (Master != null)
                {
                    Image img = (Image)Master.FindControl("imagenAvatar");
                    if (img != null)
                    {
                        // Añadir un parámetro aleatorio para evitar caché
                        img.ImageUrl = "~/Images/" + user.ImagenPerfil + "?t=" + DateTime.Now.Ticks;
                    }
                    else
                    {
                        throw new Exception("Control imgAvatar no encontrado en la Master Page.");
                    }
                }

                Response.Redirect("Default.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
            }
        }
    }
}
