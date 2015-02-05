<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inscription.aspx.cs" Inherits="Labo1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css" />
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resources/demos/style.css" />
    <script type="text/javascript" >
        $(function () {
            $(".datepicker").datepicker(
                {
                    dateFormat: "yy-mm-dd", dayNamesMin: ["S", "M", "T", "W", "T", "F", "S"]
                });
        });
        function BuildForm(targetFormID)
        {
            // création du div qui englobe le formulaire 
            divObject = document.createElement("div");
            divObject.setAttribute("class", "main");
            divObject.appendChild(BuildTable(9, 2));
            document.getElementById(targetFormID).appendChild(divObject);
            // création des controles 
            AddInputText(0, "Prénom:", "Prenom", "ident");
            AddInputText(1, "Nom:", "Nom", "ident");
            AddMaskedInputText(2, "Téléphone:", "Telephone", "(###) ###-####");
            AddMaskedInputText(3, "Code postal:", "CodePostal", "C#C #C#");
            AddMaskedInputText(4, "Naissance:", "Naissance", "####-##-##");
            document.getElementById("Naissance").className = " masked datepicker";
            AddRadioButtonGroup(5, "Sexe:", "Sexe", "masculin", "féminin");
            AddRadioButtonGroup(6, "État civil:", "Etatcivil", "célibataire", "marié", "conjoint de fait", "séparé", "veuf");
            // la rangée 7 est volontairement sautée 
            AddSubmitButton(8, "Ajouter...");
            // installation des "delegates" pour les inputs de classe "ident" 
            var inputObjects = document.getElementsByClassName("ident");
            for (i = 0; i < inputObjects.length; i++)
            {
                inputObjects[i].onkeyup = function ()
                {
                    ConstrainToAlpha(event);
                };
                inputObjects[i].onblur = function ()
                {
                    HighLiteEmptyInput(event);
                };
            }
            // installation des "delegates" pour les inputs de classe "masked" 
            var maskedInputs = document.getElementsByClassName("masked");
            for (i = 0; i < maskedInputs.length; i++)
            {
                maskedInputs[i].onkeydown = function ()
                {
                    return Valide_Masque(event);
                };
                maskedInputs[i].onkeyup = function ()
                {
                    Post_Check_Masque(event);
                }; maskedInputs[i].onblur = function ()
                {
                    Post_Check_Masque(event);
                    HighLiteIncompleteMaskedInput(event)
                };
            }
        }
    </script>
    <style>
        table, td {
            border: 0px solid black;
            border-collapse: collapse;
            width: inherit;
            padding: 5px;
        }

        tr > td:first-child {
            text-align: right;
            vertical-align: text-top;
        }

        .main {
            width: 300px;
            margin: auto;
            border: 1px solid black;
        }

        .radio {
            width: 130px;
        }

        input.ident, input.masked {
            width: 125px;
        }

        div.ui-datepicker {
            font-size: 10px;
        }
    </style>
</head>
<body id="body">
    <form id="form1" method="get" action="CreateUser.aspx">
        <div>
            <script type="text/javascript" src="ClientFormUtilities.js">
                BuildForm("form1"); </script>
            <asp:Panel ID="PN_GridView" runat="server"></asp:Panel>
        </div>
    </form>
</body>
</html>
