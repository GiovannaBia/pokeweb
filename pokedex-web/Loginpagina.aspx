<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Loginpagina.aspx.cs" Inherits="pokedex_web.Loginpagina" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

       <br />
    <h1>Login</h1>
    <asp:Label Text="Email" runat="server" Font-Size="Larger" Font-Bold="true" />
    <asp:TextBox runat="server"  Id="txtEmail" CssClass="form-control" />
    <br />
     <asp:Label Text="Password" runat="server" Font-Size="Larger" Font-Bold="true" />
    <asp:TextBox runat="server"  ID="txtPass" CssClass="form-control" />
    <br />
    <asp:Button ID="btnIngresar" runat="server" Text="Ingresar"  CssClass="btn btn-primary" OnClick="btnIngresar_Click" />
    <a href="Default.aspx">Cancelar</a>

</asp:Content>
