<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Email.aspx.cs" Inherits="pokedex_web.Email" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="row">
        <div class="col-2"></div>
        <div class="col">
            <div class="mb-3">
                <asp:Label class="form-label" Text="Email" runat="server" />
                <asp:TextBox runat="server" Id="txtEmail" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <asp:Label class="form-label" Text="Asunto" runat="server" />
                <asp:TextBox runat="server" Id="txtAsunto" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <asp:Label class="form-label" Text="Mensaje" runat="server" />
                <asp:TextBox runat="server" Id="txtMensaje" CssClass="form-control" TextMode="MultiLine" />
            </div>
            <asp:Button Text="Aceptar" CssClass="btn btn-primary" ID="btnAceptar" Onclick="btnAceptar_Click" runat="server" />
        </div>
        <div class="col"></div>
    </div>

</asp:Content>
