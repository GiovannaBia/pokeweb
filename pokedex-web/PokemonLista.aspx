<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PokemonLista.aspx.cs" Inherits="pokedex_web.PokemonLista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <div class="container"
        <h1>Lista de pokemons</h1>
        <asp:GridView ID="dgvPokemons" DataKeyNames="Id" runat="server" CssClass="table" AutoGenerateColumns="false" 
         OnSelectedIndexChanged="dgvPokemons_SelectedIndexChanged" 
         OnPageIndexChanging="dgvPokemons_PageIndexChanging"
         AllowPaging="true" PageSize="5" >
        <Columns>
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:BoundField HeaderText="Numero" DataField="Numero" />
                <asp:BoundField HeaderText="Tipo" DataField="Tipo.Descripcion" />
                <asp:CheckBoxField HeaderText="Activo" DataField="Activo"  /> 
                <asp:CommandField ShowSelectButton="true" SelectText="✍️" HeaderText="Acción"   />
             </Columns>
        </asp:GridView>
        <asp:Button runat="server" CssClass="btn btn-primary" text="Agregar" id="btnAgregar" onclick="btnAgregar_Click"/>
        </div>
</asp:Content>
