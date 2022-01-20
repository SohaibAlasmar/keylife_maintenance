using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class add_user : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("workstation id=keylife.mssql.somee.com;packet size=4096;user id=keylife_SQLLogin_1;pwd=8il9c3meyk;data source=keylife.mssql.somee.com;persist security info=False;initial catalog=keylife");
    // SqlConnection con = new SqlConnection("server=DESKTOP-4A34169;database=maintenance;integrated security=sspi");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("login.aspx");
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd_check = new SqlCommand("select * from users where user_name='" + txt_email.Text.ToString()+"';", con);
        con.Open();
        SqlDataReader dr;
        dr = cmd_check.ExecuteReader();
        if(!dr.Read())
        {
            con.Close();
            String sql = "insert into users (user_name,password,name) values (@username,@pass,@name)";
            SqlCommand cmd = new SqlCommand(sql, con);
            if (txt_name.Text != "")
            {
                if (txt_email.Text != "")
                {
                    if (txt_pass.Text != "")
                    {
                        if (txt_pass.Text.Length > 7)
                        {
                            if (txt_pass.Text == txt_passconfirm.Text)
                            {
                                
                                cmd.Parameters.AddWithValue("@username", txt_email.Text);
                                cmd.Parameters.AddWithValue("@pass", txt_pass.Text);
                                cmd.Parameters.AddWithValue("@name", txt_name.Text);
                                con.Open();
                                cmd.ExecuteNonQuery();
                                con.Close();
                                lbl_message.Text = "تمت اضافة المستخدم";
                            }
                            else
                            {
                                lbl_message.Text = "كلمات المرور لا تتطابقان";
                            }
                        }
                        else
                        {
                            lbl_message.Text = "يجب ان لا تقل كلمة المرور عن 8 خانات";
                        }
                    }
                    else
                    {
                        lbl_message.Text = "ادخل الرقم السري";
                    }
                    
                }
                else
                {
                    lbl_message.Text = "ادخل البريد الاكتروني";
                }
            }
            else
            {
                lbl_message.Text = "ادخل الاسم";
            }

        }
        else
        {
            lbl_message.Text = "اسم المستخدم موجود مسبقا";
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("main.aspx");
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("main.aspx");
    }
}