<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="pokedex_web.MiPerfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>Mi perfil</h1>
    <div class="row">
        <div class="col-4">
            <div class="mb-3">
                <asp:Label Text="Email" runat="server" />
                <asp:TextBox CssClass="form-control" runat="server" ID="txtEmail"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label Text="Nombre" runat="server" />
                <asp:TextBox CssClass="form-control" runat="server" ID="txtNombre"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label Text="Apellido" runat="server" />
                <asp:TextBox CssClass="form-control" runat="server" ID="txtApellido"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label Text="Fecha de nacimiento" runat="server" />
                <asp:TextBox CssClass="form-control" runat="server" ID="txtFechaNacimiento" TextMode="Date"></asp:TextBox>
            </div>
        </div>
        <div class="col-4">
            <div class="mb-3">
                <label class="form-label">Imagen Perfil</label>
                <input type="file" ID="txtImagen" runat="server" class="form-control" />
            </div>
            <asp:Image ID="imgNuevoPerfil" ImageUrl="https://www.palomacornejo.com/wp-content/uploads/2021/08/no-image.jpg"
                runat="server" CssClass="img-fluid mb-3" />
        </div>
    </div>
    <div class="row">
         <div class="col-4">
             <asp:Button Text="Guardar" CssClass="btn btn-primary" ID="btnGuardar" runat="server" OnClick="btnGuardar_Click"/>
             <a href="Default.aspx">Regresar</a>
         </div>
    </div>

</asp:Content>
