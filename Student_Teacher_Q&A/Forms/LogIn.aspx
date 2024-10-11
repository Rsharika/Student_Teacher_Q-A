<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="Student_Teacher_Q_A.Forms.LogIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset="utf-8" />
    <title>Login Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .login-container {
            width: 400px;
            margin: 100px auto;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .login-container h2 {
            text-align: center;
        }

        .form-control {
            margin-bottom: 15px;
        }

        .btn-group {
            display: flex;
            justify-content: space-between;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <div class="login-container">
            <h2>Login</h2>
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

            <div class="mb-3">
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" Placeholder="Username"></asp:TextBox>
            </div>
            <%-- <div class="mb-3">
                <asp:TextBox ID="txtUserCategory" runat="server" CssClass="form-control" Placeholder="Log In As"></asp:TextBox>
            </div>--%>
            <div class="mb-3">
                <asp:DropDownList ID="ddlUserCategory" runat="server" CssClass="form-control">
                    <asp:ListItem Text="--Select User Category--" Value="" />
                </asp:DropDownList>
            </div>

            <div class="mb-3">
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Password"></asp:TextBox>
            </div>

            <div class="btn-group">
                <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary" Text="Login" OnClick="btnLogin_Click" />
                <asp:Button ID="btnRegister" runat="server" CssClass="btn btn-success" Text="Register" OnClick="btnRegistration_Click" />
                <asp:Button ID="btnClear" runat="server" CssClass="btn btn-danger" Text="Clear" OnClick="btnClear_Click" />
            </div>
        </div>
    </form>


    <script>
        // Clear the input fields when "Clear" button is clicked
        document.getElementById('<%= btnClear.ClientID %>').addEventListener('click', function() {
            document.getElementById('<%= txtUsername.ClientID %>').value = '';
            document.getElementById('<%= ddlUserCategory.ClientID %>').value = '';
            document.getElementById('<%= txtPassword.ClientID %>').value = '';
        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

</body>
</html>
