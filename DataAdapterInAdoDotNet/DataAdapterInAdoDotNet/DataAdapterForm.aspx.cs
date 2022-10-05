using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace DataAdapterInAdoDotNet
{
    public partial class DataAdapterForm : System.Web.UI.Page
    {
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnDataTable_Click(object sender, EventArgs e)
        {
            PutGridToNull();
            string connection = "Data Source=ST-02\\SQLEXPRESS; Initial Catalog=master; Integrated Security=SSPI";
            SqlConnection con = new SqlConnection(connection);
            string query = "SELECT * FROM Orders";
            SqlDataAdapter da = new SqlDataAdapter(query, con);

            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            Label1.Text = "DataTable";
        }

        protected void btnDataSet_Click(object sender, EventArgs e)
        {
            PutGridToNull();
            string connection = "Data Source=ST-02\\SQLEXPRESS; Initial Catalog=master; Integrated Security=SSPI";
            SqlConnection con = new SqlConnection(connection);
            

            string query1 = "SELECT * FROM Orders";
            SqlDataAdapter da = new SqlDataAdapter(query1, con);
            da.Fill(ds,"tableOrders");

            string query2 = "SELECT * FROM People";
            da = new SqlDataAdapter(query2, con);
            da.Fill(ds, "tablePeople");

            BindedTablesForDataSet();

            Label1.Text = "DataSet";
        }

        protected void PutGridToNull()
        {
            GridView1.DataSource = null;
            GridView1.DataBind();
            GridView2.DataSource = null;
            GridView2.DataBind();
        }

        protected void BindedTablesForDataSet()
        {
            GridView1.DataSource = ds.Tables["tableOrders"];
            GridView1.DataBind();
            GridView2.DataSource = ds.Tables["tablePeople"];
            GridView2.DataBind();
        }
    }
}