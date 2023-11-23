<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Precios.aspx.cs" Inherits="RegistroProductos.Precios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Productos.aspx">Gestionar Productos</asp:HyperLink>
            <br />
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Fecha:"></asp:Label>
            <asp:TextBox ID="txtFecha" runat="server" AutoPostBack="True" TextMode="Date"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="productos" DataTextField="descripcion" DataValueField="id">
            </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Monto:"></asp:Label>
&nbsp;&nbsp;
            <asp:TextBox ID="txtMonto" runat="server" AutoPostBack="True"></asp:TextBox>
        </div>
        <asp:Button ID="agregar" runat="server" BackColor="#99FF66" Font-Bold="True" OnClick="agregar_Click" Text="Agregar" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <asp:Label ID="Label1" runat="server"></asp:Label>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="id" DataSourceID="SqlDataSource2" EmptyDataText="No hay registros de datos para mostrar." ForeColor="Black" GridLines="None" Width="658px">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="fecha" HeaderText="fecha" SortExpression="fecha" />
                <asp:BoundField DataField="monto" HeaderText="monto" SortExpression="monto" />
                <asp:BoundField DataField="descripcion" HeaderText="descripcion" SortExpression="descripcion" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="idProducto" HeaderText="idProducto" SortExpression="idProducto" />
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" DeleteCommand="DELETE FROM [precios] WHERE [id] = @id" InsertCommand="INSERT INTO [precios] ([fecha], [monto], [idProducto]) VALUES (@fecha, @monto, @idProducto)" ProviderName="<%$ ConnectionStrings:cadena.ProviderName %>" SelectCommand="SELECT precios.fecha, precios.monto, productos.descripcion, precios.id, precios.idProducto FROM precios INNER JOIN productos ON precios.idProducto = productos.id" UpdateCommand="UPDATE [precios] SET [fecha] = @fecha, [monto] = @monto, [idProducto] = @idProducto WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter DbType="Date" Name="fecha" />
                <asp:Parameter Name="monto" Type="Int32" />
                <asp:Parameter Name="idProducto" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter DbType="Date" Name="fecha" />
                <asp:Parameter Name="monto" Type="Int32" />
                <asp:Parameter Name="idProducto" Type="Int32" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:SqlDataSource ID="productos" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT * FROM [productos]"></asp:SqlDataSource>
        <br />
        <asp:SqlDataSource ID="crud" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" DeleteCommand="DELETE FROM [precios] WHERE [id] = @id" InsertCommand="INSERT INTO [precios] ([fecha], [monto], [idProducto]) VALUES (@fecha, @monto, @idProducto)" SelectCommand="SELECT * FROM [precios]" UpdateCommand="UPDATE [precios] SET [fecha] = @fecha, [monto] = @monto, [idProducto] = @idProducto WHERE [id] = @id">
            <InsertParameters>
                <asp:ControlParameter ControlID="txtFecha" DbType="Date" Name="fecha" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtMonto" Name="monto" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="DropDownList1" Name="idProducto" PropertyName="SelectedValue" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter DbType="Date" Name="fecha" />
                <asp:Parameter Name="monto" Type="Int32" />
                <asp:Parameter Name="idProducto" Type="Int32" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <br />
        <br />
    </form>
</body>
</html>
