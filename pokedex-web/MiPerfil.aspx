<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="pokedex_web.MiPerfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .validacion {
            color: red;
            font-size: 12px;
        }
    </style>
    <script>
        function validar() {
            const txtApellido = document.getElementById("txtApellido");
            const txtNombre = document.getElementById("txtNombre");
            const txtFechaNacimiento = document.getElementById("txtFechaNacimiento");

            if (txtApellido.value == "") {
                txtApellido.classList.add("is-invalid");
                return false;
            } else if (txtNombre.value == "") {
                txtNombre.classList.add("is-invalid");
                return false;
            } else if (txtFechaNacimiento.value == "") {
                txtFechaNacimiento.classList.add("is-invalid");
                return false;
            }

            txtApellido.classList.remove("is-invalid");
            txtNombre.classList.remove("is-invalid");
            txtFechaNacimiento.classList.remove("is-invalid");
            return true;
        }

        function markDateInteracted() {
            document.getElementById('<%= hdnDateInteracted.ClientID %>').value = 'true';
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>Mi perfil</h1>
    <div class="row">
        <div class="col-4">
            <div class="mb-3">
                <asp:Label Text="Email" runat="server" />
                <asp:TextBox CssClass="form-control" runat="server" ID="txtEmail"></asp:TextBox>
                <asp:RequiredFieldValidator CssClass="validacion" ErrorMessage="El email es requerido" ControlToValidate="txtEmail" runat="server" />
                <asp:RegularExpressionValidator CssClass="validacion" ErrorMessage="Formato de email incorrecto" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ControlToValidate="txtEmail" runat="server" />
            </div>
            <div class="mb-3">
                <asp:Label Text="Nombre" runat="server" />
                <asp:TextBox CssClass="form-control" REQUIRED ClientIDMode="Static" runat="server" ID="txtNombre"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label Text="Apellido" runat="server" />
                <asp:TextBox CssClass="form-control" REQUIRED ClientIDMode="Static" runat="server" ID="txtApellido"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label Text="Fecha de nacimiento" runat="server" />
                <asp:TextBox CssClass="form-control"  ClientIdMode="Static" runat="server" ID="txtFechaNacimiento" TextMode="Date" onfocus="markDateInteracted()" onchange="markDateInteracted()"></asp:TextBox>
                <asp:HiddenField ID="hdnDateInteracted" runat="server" Value="false" />
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Visible="false"></asp:Label>
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
             <asp:Button Text="Guardar" CssClass="btn btn-primary" ID="btnGuardar" runat="server" OnClientClick="return validar()" OnClick="btnGuardar_Click"/>
             <a href="Default.aspx">Regresar</a>
         </div>
    </div>

</asp:Content>
