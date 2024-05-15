using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace pokedex_web
{
    public partial class Loginpagina : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Trainee trainee = new Trainee();
            TraineeNegocio traineeNegocio = new TraineeNegocio();
            try
            {
                trainee.Email = txtEmail.Text;
                trainee.Pass = txtPass.Text;
                if (traineeNegocio.Login(trainee))
                {
                    Session.Add("trainee", trainee);
                    Response.Redirect("MiPerfil.aspx", false);
                }
                else
                {
                    Session.Add("error", "User o pass incorrectos");
                    Response.Redirect("Error.aspx", false);
                }
                
            }
            catch (Exception ex) 
            {

                throw ex;
            }
        }
    }
}