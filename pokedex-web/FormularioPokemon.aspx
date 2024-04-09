<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FormularioPokemon.aspx.cs" Inherits="pokedex_web.AgregarPokemon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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
                 <label for="txtDescripcion" class="form-label">Número</label>
                <asp:TextBox runat="server" ID="txtDescripcion"  cssclass="form-control"></asp:TextBox>
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

</asp:Content>
