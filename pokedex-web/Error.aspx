<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="pokedex_web.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Hubo un problema</h1>
    <asp:Label Text="text" ID="lblMensaje" runat="server" />
    <br />
    <asp:Button Text="Volver" runat="server" ID="btnVolver" OnClick="btnVolver_Click" CssClass="btn btn-dark" />
</asp:Content>
