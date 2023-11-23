using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistroProductos
{
    public partial class Productos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                actualizarLabel();
            }
        }

        protected void actualizarLabel()
        {
            Label2.Text = "";
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView dr in dv)
            {
                DataRow row = dr.Row;
                Label2.Text += row["descripcion"].ToString() + " -  ";

            }

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            int result = SqlDataSource1.Insert();

            if (result != 0)
            {
                Label1.Text = "Se agrego un Producto";
                actualizarLabel();
                TextBox1.Text = "";
            }
            else {
                Label1.Text = "No se agregaron productos";
            }
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataSource2.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader reader = (SqlDataReader)SqlDataSource2.Select(DataSourceSelectArguments.Empty);

            if(reader.Read())
            {
                TextBox2.Text = reader["descripcion"].ToString();
            }
        }

        protected void eliminar_Click(object sender, EventArgs e)
        {
            SqlDataSource1.DeleteParameters["id"].DefaultValue = ListBox1.SelectedValue;
            int result = SqlDataSource1.Delete();

            if (result != 0)
            {
                Label1.Text = "Se eliminado un Producto";
                actualizarLabel();
                TextBox1.Text = "";
            }
            else
            {
                Label1.Text = "No se eliminaron productos";
            }
        }

        protected void modificar_Click(object sender, EventArgs e)
        {
            SqlDataSource1.UpdateParameters["id"].DefaultValue = ListBox1.SelectedValue;
            SqlDataSource1.UpdateParameters["descripcion"].DefaultValue = TextBox2.Text;
            int result = SqlDataSource1.Update();

            if (result != 0)
            {
                Label1.Text = "Se Modificó un Producto";
                actualizarLabel();
                TextBox1.Text = "";
            }
            else
            {
                Label1.Text = "No se Modificaron productos";
            }
        }
    }
}