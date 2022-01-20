<%@ Page Language="C#" %>
<%@ import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<!DOCTYPE html>

<script runat="server">
    SqlConnection con = new SqlConnection("");

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("main.aspx");
    }
    void fill()
    {
        string sql = "select * from info";
        SqlCommand cms = new SqlCommand(sql, con);
        SqlDataAdapter da = new SqlDataAdapter(sql, con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        grid_edit.DataSource = dt;
        grid_edit.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {
            fill();
        }
         if (Session["user"] == null)
        {
            Response.Redirect("login.aspx");
        }
    }

    protected void grid_edit_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grid_edit.EditIndex = e.NewEditIndex;
        fill();

    }

    protected void grid_edit_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {


    }

    protected void grid_edit_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grid_edit.EditIndex = -1;
        fill();
    }

    protected void grid_edit_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "eedit")
        {
            int j = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = grid_edit.Rows[j];
            Response.Redirect("new_maint.aspx?id="+row.Cells[1].Text);
        }
    }

    protected void grid_edit_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int j = Convert.ToInt32(e.RowIndex);
        GridViewRow row = grid_edit.Rows[j];
        SqlCommand cmd = new SqlCommand("delete from info where id="+row.Cells[1].Text,con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        fill();
    }
      void fill_search()
    {
        string sql = "select * from info where ( client like N'%" + TextBox1.Text.ToString() + "%' or Governorate like N'%" + TextBox1.Text.ToString() +
              "%' or location like N'%" + TextBox1.Text.ToString() + "%' or date like N'%" + TextBox1.Text.ToString() + "%' or Warranty_expire_date like N'%" + TextBox1.Text.ToString() +
              "%'   or phone like N'%" + TextBox1.Text.ToString() + "%' or ScrNum like N'%" + TextBox1.Text.ToString()
              + "%'  or hangsTall like N'%" + TextBox1.Text.ToString() + "%' or LCDnum like N'%" + TextBox1.Text.ToString() +
              "%' or oprCircle like'%" + TextBox1.Text.ToString() + "%' or Motherborder like '%" + TextBox1.Text.ToString() + "%' or printer_type like '%" +
              TextBox1.Text.ToString() + "%'"+
              "or pwrSuplly like '%" + TextBox1.Text.ToString() + "%' or headset_num like'%" + TextBox1.Text.ToString() + "%' or Amplifire like '%" +
              TextBox1.Text.ToString() + "%' or headset_loc like '%" + TextBox1.Text.ToString() + "%');";
        SqlCommand cms = new SqlCommand(sql, con);
        SqlDataAdapter da = new SqlDataAdapter(sql, con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        grid_edit.DataSource = dt;
        grid_edit.DataBind();
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        fill_search();
    }
</script>
<link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style>
        #grid_edit{
            background-color: rgba(0, 0, 0,0.5);
              position:relative;
            margin-left:auto;
            margin-right:auto;
            width:80vw;
            margin-top:10px
            }
    body {
        margin: 0px;
        width: 100%;
        padding: 0px;
    }

    html {
        background: url(images/back.jpg) no-repeat center center fixed;
        background-size: 100% 100%;
    }

    #header {
        margin-top: 0px;
        padding: 0px;
        height: 140px;
        width: 100%;
        background-color: rgba(0, 0, 0,0.2);
        border-bottom: 3px solid white;
    }

    .auto-style1 {
        text-align: center;
    }
          .btn {
            color: white;
            margin: 10px;
            background-color: rgba(0, 0, 0,0.6);
            border: 2px solid white;
            transition: 0.5s;
            font-weight: bold;
            font-size: 15px;
            border-radius: 15px;
            width: 100px;
            height: 60px;
            margin: 20px 40px;
            text-align: center;
            line-height:60px
        }

            .btn:hover {
                color: rgba(0, 0, 0,0.6);
                background-color: white;
                border: 2px solid rgba(0, 0, 0,0.6);
            }

        #new {
            list-style: none;
            display: none;
            margin: 0px;
            position: relative;
            right: 62px;
            bottom:40px;
        }

            #new li {
                transition: 0.5s;
                margin: 0px;
            }

        .btn1 {
            color: white;
            margin: 10px;
            background-color: rgba(0, 0, 0,0.6);
            border: 2px solid white;
            transition: 0.5s;
            font-weight: bold;
            font-size: 15px;
            border-radius: 15px;
            width: 70px;
            height: 30px;
            margin: 20px 40px;
            text-align: center;
            line-height: 30px;
        }

            .btn1:hover {
                color: rgba(0, 0, 0,0.6);
                background-color: white;
                border: 2px solid rgba(0, 0, 0,0.6);
            }

        #new li a {
            text-decoration: none;
            color: white
        }

            #new li a:hover {
                color: rgba(0, 0, 0,0.6);
            }

        nav:hover #new {
            display: block
        }
        
        #new0 {
            list-style: none;
            display: none;
            margin: 0px;
            position: relative;
            right: 62px;
            bottom:40px;
        }

            nav:hover #new0 {
            display: block
        }
        </style>
    </head>
<body>
    <form id="form1" runat="server">
        <div id="header" class="auto-style1">
            <br />
            <asp:ImageButton ID="ImageButton1" Style="outline: none" runat="server" Height="96px" ImageUrl="~/images/logo2.png" Width="493px" OnClick="ImageButton1_Click" />
        </div>
          <input type="checkbox" id="check">
    <label for="check">
      <i class="fas fa-bars" id="btn"></i>
      <i class="fas fa-times" id="cancel"></i>
    </label>
    <div class="sidebar">
   
    <ul>
        <li class="sp">تركيب</li>
        <li><a href="add_client.aspx">اضافة جديد<i class="fas fa-plus"></i></a></li>
        <li><a href="add_edit.aspx">تعديل<i class="fas fa-edit"></i></a></li>
        <li><a href="report1.aspx">طباعة تقرير<i class="fas fa-print"></i></a></li>
        <li class="sp">صيانة</li>
        <li><a href="add_maint.aspx">اضافة جديد<i class="fas fa-plus"></i></a></li>
        <li><a href="edit_maint.aspx">تعديل<i class="fas fa-edit"></i></a></li>
        <li><a href="report2.aspx">طباعة تقرير<i class="fas fa-print"></i></a></li>
    </ul>
</div>
        <p class="auto-style1">
            <asp:TextBox ID="TextBox1" runat="server" style="text-align:center" Placeholder="بحــث" OnTextChanged="TextBox1_TextChanged" AutoPostBack="True"></asp:TextBox>
        </p>
       
        
                    <div class="auto-style1">
       
        
                    <asp:GridView ID="grid_edit" runat="server" AutoGenerateColumns="False" CssClass="auto-style3" OnRowEditing="grid_edit_RowEditing" OnRowUpdating="grid_edit_RowUpdating" OnRowCancelingEdit="grid_edit_RowCancelingEdit" OnRowCommand="grid_edit_RowCommand" OnRowDeleting="grid_edit_RowDeleting" Width="508px" PageSize="15" CellPadding="4" ForeColor="#333333" GridLines="Both" RowStyle-BorderWidth="2">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:ButtonField ButtonType="Button" CommandName="eedit" Text="اضافة" />
                            <asp:BoundField DataField="id" ReadOnly="True" />
                            <asp:BoundField DataField="client" HeaderText="اسم العميل" />
                            <asp:BoundField DataField="Governorate" HeaderText="المحافظة" />
                            <asp:BoundField DataField="location" HeaderText="الموقع" />
                            <asp:BoundField DataField="phone" HeaderText="رقم التواصل" />
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
              
               
       
        </div>
              
               
       
    </form>
</body>
</html>
