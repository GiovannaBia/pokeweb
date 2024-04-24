<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PokemonLista.aspx.cs" Inherits="pokedex_web.PokemonLista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">
        <h1>Lista de pokemons</h1>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                 <div class="row">
                     <div class="col-6">
                         <div class="mb-3">
                             <asp:Label runat="server" text="Filtrar" />
                             <asp:TextBox runat="server" ID="txtFiltro" AutoPostBack="true" CssClass="form-control" OnTextChanged="txtFiltro_TextChanged"/>
                         </div>
                     </div>
                 </div>
                <div class="col-6" style="display: flex; flex-direction:column; justify-content=flex-end">
                    <div class="mb-3">
                        <asp:CheckBox Text="Filtro avanzado" runat="server" AutoPostBack="true" ID="chkAvanzado" OnCheckedChanged="chkAvanzado_CheckedChanged" />
                    </div>
                </div>
                <% if (FiltroAvanzado)
                    { %>
                <div class="row">
                    <div class="col-3">
                        <div class="mb-3">
                            <asp:Label runat="server" ID="lblCampo" Text="Campo"></asp:Label>
                            <asp:DropDownList runat="server" ID="ddlCampo" AutoPostBack="true" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged" CssClass="form-control">
                                <asp:ListItem Text="Nombre" />
                                <asp:ListItem Text="Tipo" />
                                <asp:ListItem Text="Número" />
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="mb-3">
                            <asp:Label Text="Criterio" runat="server" />
                            <asp:DropDownList runat="server" ID="ddlCriterio" CssClass="form-control">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="mb-3">
                            <asp:Label Text="Filtro" runat="server" />
                            <asp:TextBox runat="server" ID="txtFiltroAvanzado" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="mb-3">
                            <asp:Label Text="Estado" runat="server" />
                            <asp:DropDownList runat="server" ID="ddlEstado" CssClass="form-control" >
                                <asp:ListItem Text="Todos" />
                                <asp:ListItem Text="Activos" />
                                <asp:ListItem Text="Inactivos" />
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-3">
                        <asp:Button Text="Buscar" runat="server" CssClass="btn btn-primary" ID="btnBuscar" OnClick="btnBuscar_Click" />
                    </div>
                </div>
                <% } %>
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
              
            </ContentTemplate>
        </asp:UpdatePanel>

    </div>
</asp:Content>
