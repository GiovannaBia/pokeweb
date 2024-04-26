<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login2.aspx.cs" Inherits="pokedex_web.Login2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Te logueaste correctamente</h1>
    <br />
    <div class="row">
        <div class="col-6">
            <asp:Button Text="Pagina 1" runat="server" id="btnPagina1"  CssClass="btn btn-primary" OnClick="btnPagina1_Click"/>
        </div>
        <div class="col-6">
            <% if (Session["usuario"] != null && ((dominio.Usuario)Session["usuario"]).TipoUsuario == dominio.TipoUsuario.ADMIN)
                { %>
            <asp:Button Text="Pagina 2" runat="server" id="btnPagina2"  CssClass="btn btn-primary" OnClick="btnPagina2_Click"/>
            <h5>Tenes que ser admin</h5>
            <% } %>
        </div>
    </div>
</asp:Content>
