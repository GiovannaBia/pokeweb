<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FormularioPokemon.aspx.cs" Inherits="pokedex_web.AgregarPokemon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager ID="script" runat="server"></asp:ScriptManager>

     <div class="row">
        <div class="col-6">
            <div class="mb-3">
                <label for="txtId" class="form-label">Id</label>
                <asp:TextBox runat="server" ID="txtId" cssclass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                 <label for="txtNombre" class="form-label">Nombre</label>
                <asp:TextBox runat="server" ID="txtNombre" cssclass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                 <label for="txtNumero" class="form-label">Número</label>
                <asp:TextBox runat="server" ID="txtNumero"  cssclass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                 <label for="ddlTipo" class="form-label">Tipo</label>
                <asp:DropDownList runat="server" ID="ddlTipo" cssclass="form-select"></asp:DropDownList>
            </div>
             <div class="mb-3">
                 <label for="ddlDebilidad" class="form-label">Debilidad</label>
                <asp:DropDownList runat="server" ID="ddlDebilidad" cssclass="form-select"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <asp:Button text="Aceptar" runat="server" ID="btnAceptar" cssclass="btn btn-primary" OnClick="btnAceptar_Click"></asp:button>
                <a href="Default.aspx">Cancelar</a>
            </div>
        </div>
         <div class="col-6">
             <div class="mb-3">
                 <label for="txtDescripcion" class="form-label">Descripción</label>
                <asp:TextBox runat="server" ID="txtDescripcion"  CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
            </div>
             <asp:UpdatePanel runat="server">
                 <ContentTemplate>
                      <div class="mb-3">
                           <label for="txtUrlImagen" class="form-label">Url Imagen</label>
                           <asp:TextBox runat="server" ID="txtUrlImagen"  CssClass="form-control" AutoPostBack="true" OnTextChanged="txtUrlImagen_TextChanged"></asp:TextBox>
                       </div>
                       <asp:Image ImageUrl="https://fotografias.correryfitness.com/clipping/cmsimages01/2019/05/29/9B89AC82-4176-4127-89A2-F38F13E0A84E/58.jpg" ID="UrlImagen" runat="server" Width="60%"/>
                 </ContentTemplate>
             </asp:UpdatePanel>
         </div>
        </div>
    <div class="row">
        <div class="col-6">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="mb-3">
                        <asp:Button text="Eliminar" runat="server" ID="btnEliminar" CssClass="btn btn-danger" OnClick="btnEliminar_Click"></asp:button>
                    </div>
                    <% if (ConfirmarEliminacion)
                        { %>
                             <div class="mb-3">
                                 <asp:CheckBox Text="Confirmar eliminación" ID="chkConfirmaEliminacion" runat="server" />
                                 <asp:Button text="Eliminar" runat="server" ID="btnConfirmaEliminar" cssclass="btn btn-outline-danger" OnClick="btnConfirmaEliminar_Click"></asp:button>
                             </div>
                    <% } %>
                </ContentTemplate>
            </asp:UpdatePanel>        
        </div>
    </div>
</asp:Content>
