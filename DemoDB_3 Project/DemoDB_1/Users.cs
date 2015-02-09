using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace DemoDB_1
{
    public class Users:SqlExpressUtilities.SqlExpressWrapper
    {
        // Membres portant les mêmes identificateurs et mêmes types
        // que la table MainDB.USERS
        public long ID { get; set; }
        public String FullName{get; set;}
        public String UserName{get; set;}
        public String Password{get; set;}
        public String Email{get; set;}
        public String Avatar { get; set; }
        public Users(String connexionString, System.Web.UI.Page Page) :
               base(connexionString, Page)
        {
            // Il faut spécifier le nom de la table
            SQLTableName = "USERS";
        }

        public override void GetValues()
        {
            // Transfert entre les membres de la classe et la collection de valeurs
            // colligées pas la classe de base
            ID = long.Parse(FieldsValues[0]);
            FullName = FieldsValues[1];
            UserName = FieldsValues[2];
            Password = FieldsValues[3];
            Email = FieldsValues[4];
            Avatar = FieldsValues[5];
        }

        public override void InitVisibility()
        {
            base.InitVisibility();
            // Choisir l'index des colonnes qui seront masquées
            // dans la GridView
            SetVisibility(3, false);
            SetVisibility(5, false);
        }
        public override void Insert()
        {
            // énumérer ici dans l'ordre les membres sans ID puisqu'il est automatiquement calculé
            InsertRecord(FullName, UserName, Password, Email, Avatar);
        }

        public override void Update()
        {
            // énumérer tous les membres dans l'ordre 
            UpdateRecord(ID, FullName, UserName, Password, Email, Avatar);
        }
    }
}