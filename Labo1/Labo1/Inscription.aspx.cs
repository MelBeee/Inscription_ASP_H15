﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Labo1
{
   public partial class WebForm1 : System.Web.UI.Page
   {
      protected void Page_Load(object sender, EventArgs e)
      {
         if (!Page.IsPostBack) LoadForm();
         String action = Request["action"];
         if (action == "cancel")
            Response.Redirect("ListerPersonnes.aspx");
         if (action == "delete")
            DeleteCurrent();
         if (action == "edit")
            UpdateCurrent();
      }

      private void UpdateCurrent()
      {

      }

      private void DeleteCurrent()
      {

      }

      private void LoadForm()
      {

      }
      private void InsertSetValueScript(Panel panel, PersonnesTable personne)
      {
         String script = "<script>";

         script += BuildSetValueScript("Prenom", personne.Prenom);
         script += BuildSetValueScript("Nom", personne.Nom);
         script += BuildSetValueScript("Telephone", personne.Telephone);
         script += BuildSetValueScript("CodePostal", personne.CodePostal);
         script += BuildSetValueScript("Naissance", personne.Naissance.ToShortDateString());
         script += BuildSetRadioBUttonGroupValueScript("Sexe", personne.Sexe.ToString());
         script += BuildSetRadioBUttonGroupValueScript("Etatcivil", personne.EtatCivil.ToString());
         script += "</script>";
         panel.Controls.Add(new LiteralControl(script));
      }

      private string BuildSetRadioBUttonGroupValueScript(string p1, string p2)
      {
         return "";
      }

      private string BuildSetValueScript(string p1, string p2)
      {
         return "";
      }
   }

}