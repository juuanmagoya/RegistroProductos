using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistroProductos
{
    public partial class Precios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

   
        protected void agregar_Click(object sender, EventArgs e)
        {
            crud.InsertParameters["fecha"].DefaultValue = txtFecha.Text;
            crud.InsertParameters["idProducto"].DefaultValue = DropDownList1.SelectedValue;
            crud.InsertParameters["monto"].DefaultValue = txtMonto.Text;

            int result = crud.Insert();

            if (result != 0)
            {
                Label1.Text = "Se agrego un Precio";
                
                txtFecha.Text = ""; txtMonto.Text = "";
                GridView1.DataBind();
            }
            else
            {
                Label1.Text = "No se agregaron Precios";
            }
        }


       
    }
    }
