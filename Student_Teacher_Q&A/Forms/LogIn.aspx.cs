using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Student_Teacher_Q_A.Forms
{
    public partial class LogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindUserCategories();
            }
            //lblMessage.Text = ""; // Clear the message on page load.
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            // Here you can implement authentication logic.
            // For demonstration, let's assume the username is 'admin' and the password is 'password'.
            if (username == "admin" && password == "password")
            {
                Response.Redirect("Home.aspx"); // Redirect to another page after successful login.
            }
            else
            {
                lblMessage.Text = "Invalid username or password";
            }
        }

        protected void btnRegistration_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtUsername.Text = "";
            ddlUserCategory.SelectedIndex = 0;
            txtPassword.Text = "";
        }

        private void BindUserCategories()
        {
            // Define the connection string from the web.config file
            string connectionString = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

            // SQL query to fetch user categories
            string query = "SELECT RoleId, RoleName FROM roles";

            using (MySqlConnection con = new MySqlConnection(connectionString))
            {
                using (MySqlCommand cmd = new MySqlCommand(query, con))
                {
                    try
                    {
                        con.Open();
                        MySqlDataReader reader = cmd.ExecuteReader();

                        // Bind the dropdown list with the data
                        ddlUserCategory.DataSource = reader;
                        ddlUserCategory.DataTextField = "RoleName";  // Display text in dropdown (e.g., Admin, Teacher, etc.)
                        ddlUserCategory.DataValueField = "RoleId";   // The underlying value (ID) that you use for logic
                        ddlUserCategory.DataBind();

                        // Insert a default item at the top
                        ddlUserCategory.Items.Insert(0, new ListItem("--Select User Category--", ""));
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = "Error: " + ex.Message;
                    }
                }
            }
        }

    }
}