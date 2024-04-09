<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="pokedex_web.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <h1>Bienvenidos a POKEWEB</h1>
            <p>sjdjdiqiofjiewjfiep>

            <div class="row row-cols-1 row-cols-md-3 g-4">
                
               <asp:Repeater runat="server" id="repRepetidor">
                   <ItemTemplate>
                        <div class="col">
                            <div class="card">
                                <img src=" <%#Eval("UrlImagen")%> " class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title"> <%#Eval("Nombre")%> </h5>
                                    <p class="card-text"> <%#Eval("Descripcion" )%> </p>
                                    <a href="PokemonDetalles.aspx?id=<%#Eval("Id")%>">Ver detalles</a>
                                    <asp:Button text="Ejemplo" CssClass="btn btn-primary" runat="server" Id="btnEjemplo" CommandArgument='<%#Eval("Id")%>' CommandName="PokemonId" OnClick="btnEjemplo_Click"/>
                                </div>
                            </div>
                        </div>  
                   </ItemTemplate>
               </asp:Repeater>
                

             </div>

</asp:Content>
