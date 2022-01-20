using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("");
  
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        String sql = "select * from users where user_name=@username and password=@pass";
        SqlCommand cmd = new SqlCommand(sql, con);
        if (textuser.Text != "") { 
        if (textpass.Text != "")
        {
            cmd.Parameters.AddWithValue("@username", textuser.Text);
            cmd.Parameters.AddWithValue("@pass", textpass.Text);
            SqlDataReader r;
            con.Open();
            r = cmd.ExecuteReader();
            if (r.HasRows)
            {
                
                while (r.Read())
                {
                    Session["User"] = r["id"].ToString();
                    
                }
                con.Close();
                    Response.Redirect("main.aspx");
            }
            else
                    lbl_eror.Text = "تحقق من البريد الاكتروني او كلمه السر";
            }
        else
            lbl_eror.Text = "ادخل كلمة المرور";
        }
        else
            lbl_eror.Text = "ادخل البريد الاكتروني";
    }
}