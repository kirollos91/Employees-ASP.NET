using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

public partial class _Default : System.Web.UI.Page
{

    protected void createEmpTable()
    {
        DataTable tblEmp = new DataTable("Employee");

        if (Session["emp"] != null)
        {
            tblEmp = (DataTable)Session["emp"];
        }
        else
        {
            tblEmp.Columns.Add("Number", typeof(int));
            tblEmp.Columns.Add("Name", typeof(string));
            tblEmp.Columns.Add("Address", typeof(string));
            tblEmp.Columns.Add("Salary", typeof(int));

            tblEmp.Constraints.Add("emp_pk", tblEmp.Columns["Number"], true);

            Session["emp"] = tblEmp;


        }
    }

    protected void saveEmpFile()
    {
        if (Session["emp"] == null)
        {
            createEmpTable();
        }
        DataTable tbl = (DataTable)Session["emp"];

        tbl.WriteXmlSchema(Server.MapPath("~/emp_s.xml"));
        tbl.WriteXml(Server.MapPath("~/emp.xml"));

    }

    protected void readEmpFiles()
    {
        if (!File.Exists(Server.MapPath("~/emp_s.xml")) || !File.Exists(Server.MapPath("~/emp.xml")))
        {
            saveEmpFile();
        }

        DataTable tbl = new DataTable();

        tbl.ReadXmlSchema(Server.MapPath("~/emp_s.xml"));
        tbl.ReadXml(Server.MapPath("~/emp.xml"));

        Session["emp"] = tbl;

    }

    protected void showData()
    {
        if (Session["emp"] == null)
        {
            createEmpTable();
        }
        DataTable tbl = (DataTable)Session["emp"];

        gvSearch.DataSource = tbl;
        gvSearch.DataBind();
    }

    protected void clearData()
    {
        txtNumber.Text = "";
        txtName.Text = "";
        txtAddress.Text = "";
        txtSalary.Text = "";

        gvSearch.SelectedIndex = -1;

        btnAdd.Enabled = true;
        btnAdd.Style.Add("color", "#lightblue");

        btnEdit.Enabled = false;
        btnEdit.Style.Add("color", "#000");

        btnDelete.Enabled = false;
        btnDelete.Style.Add("color", "#000");

        string AutoNumber = "1";

        DataTable tbl = new DataTable();
        if (Session["emp"] != null)
        {
            tbl = (DataTable)Session["emp"];
        }
        if (tbl.Rows.Count > 0)
        {
            int autoNum = Convert.ToInt32(tbl.Compute("max(Number)", "")) + 1;
            AutoNumber = autoNum + "";
        }

        txtNumber.Text = AutoNumber;
        txtName.Focus();
        lblMsg.Text = "";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            createEmpTable();

            readEmpFiles();
            showData();
            clearData();
        }
    }

    protected void btnNew_Click(object sender, EventArgs e)
    {

        clearData();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        DataTable tbl = new DataTable();
        if (Session["emp"] != null)
        {
            tbl = (DataTable)Session["emp"];
        }
        int num = Convert.ToInt32(txtNumber.Text);
        string name = txtName.Text;
        string address = txtAddress.Text;
        int salary = Convert.ToInt32(txtSalary.Text);

        tbl.Rows.Add(num, name, address, salary);
        Session["emp"] = tbl;
        saveEmpFile();
        showData();
        clearData();
    }

    protected void gvSearch_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (gvSearch.SelectedRow != null)
        {
            txtNumber.Text = gvSearch.SelectedRow.Cells[1].Text;
            txtName.Text = gvSearch.SelectedRow.Cells[2].Text;
            txtAddress.Text = gvSearch.SelectedRow.Cells[3].Text;
            txtSalary.Text = gvSearch.SelectedRow.Cells[4].Text;

            btnAdd.Enabled = false;
            btnAdd.Style.Add("color","#000");
            
            btnEdit.Enabled = true;
            btnEdit.Style.Add("color", "#lightblue");
            
            btnDelete.Enabled = true;
            btnDelete.Style.Add("color", "#lightblue");
        }
    }

    protected void btnFind_Click(object sender, EventArgs e)
    {
        DataTable tbl = new DataTable();
        if (Session["emp"] != null)
        {
            tbl = (DataTable)Session["emp"];
        }
        DataRow rowFind = tbl.Rows.Find(Convert.ToInt32(txtNumFind.Text));
        if (rowFind != null)
        {
            txtNumber.Text = rowFind[0].ToString();
            txtName.Text = rowFind[1].ToString();
            txtAddress.Text = rowFind[2].ToString();
            txtSalary.Text = rowFind[3].ToString();

            btnAdd.Enabled = false;
            btnAdd.Style.Add("color", "#000");

            btnEdit.Enabled = true;
            btnEdit.Style.Add("color", "#lightblue");

            btnDelete.Enabled = true;
            btnDelete.Style.Add("color", "#lightblue");
            lblMsg.Text = "";
        }
        else 
        {
            lblMsg.Text = "Number not found!";
        }
        

    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        DataTable tbl = new DataTable();
        if (Session["emp"] != null)
        {
            tbl = (DataTable)Session["emp"];
        }
        DataRow row = tbl.Rows.Find(Convert.ToInt32(txtNumber.Text));
        row["Name"] = txtName.Text;
        row["Address"] = txtAddress.Text;
        row["Salary"] = Convert.ToInt32(txtSalary.Text);
        Session["emp"] = tbl;
        saveEmpFile();
        showData();
        clearData();
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        DataTable tbl = new DataTable();
        if (Session["emp"] != null)
        {
            tbl = (DataTable)Session["emp"];
        }
        DataRow row = tbl.Rows.Find(Convert.ToInt32(txtNumber.Text));
        row.Delete();
        Session["emp"] = tbl;
        saveEmpFile();
        showData();
        clearData();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        DataTable tbl = new DataTable();
        if (Session["emp"] != null)
        {
            tbl = (DataTable)Session["emp"];
        }
        //tbl.Columns[0].DataType = typeof(string);
        //tbl.Columns[3].DataType = typeof(string);

        DataRow[] rows;
        string strope = " like '%"+txtSearch.Text+"%' ";

        if (txtSearch.Text.Trim() == "")
        {
            lblResult.Text = "Result " + tbl.Rows.Count + " Row(s).";
            gvSearch.DataSource = tbl;
            gvSearch.DataBind();
        }
        else 
        {
            if (rdoSearch.SelectedIndex == 0 || rdoSearch.SelectedIndex == 3)
            {
                strope = " =" + txtSearch.Text;
            }

            rows = tbl.Select(rdoSearch.SelectedValue + strope);
            DataTable tbl2 = new DataTable("Employee");
            foreach (DataColumn col in tbl.Columns)
            {
                tbl2.Columns.Add(col.ColumnName);
            }
            foreach (DataRow row in rows)
            {
                tbl2.ImportRow(row);
            }
            lblResult.Text = "Result " + tbl2.Rows.Count + " Row(s).";
            gvSearch.DataSource = tbl2;
            gvSearch.DataBind();
        }

        

    }
}
