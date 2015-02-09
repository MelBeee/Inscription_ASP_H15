using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DemoDB_1
{
    public partial class Inscription : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        public void AddUsers()
        {
            // Création d'une nouvelle instance de Users (reliée à la table MainDB.Users)
            Users users = new Users((String)Application["MaindDB"], this);

            String Avatar_Path = "";
            String avatar_ID = "";
            if (FU_Avatar.FileName != "")
            {
                avatar_ID = Guid.NewGuid().ToString();
                Avatar_Path = Server.MapPath(@"~\Avatars\") + avatar_ID + ".png";
                FU_Avatar.SaveAs(Avatar_Path);
            }

            users.InsertRecord( TB_FullName.Text, 
                                TB_Username.Text,
                                TB_Password.Text,
                                TB_Email.Text,
                                avatar_ID);
        }

        protected void BTN_Submit_Click(object sender, EventArgs e)
        {
            AddUsers();
            Response.Redirect("ListUsers.aspx");
        }

        protected void BTN_Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListUsers.aspx");
        }
    }
}