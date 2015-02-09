<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="Labo1.CreateUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        table {
            border-collapse: collapse;
        }

        table, th, td {
            font-family: Arial;
            font-size: 12px;
            padding: 5px;
        }

            table td:first-child {
                text-align: right;
            }

        .submit {
            width: 125px;
        }

        .thumbnail {
            width: 140px;
            background-color: lightblue;
        }
    </style>
    <script>
        function PreLoadImage(e) {
            var imageTarget = document.getElementById("IMG_Avatar");
            var input = document.getElementById("FU_Avatar");
            if (imageTarget != null) {
                var fReader = new FileReader();
                fReader.readAsDataURL(input.files[0]);
                fReader.onloadend = function (event) {
                    // the event.target.result contains the image data 
                    imageTarget.src = event.target.result;
                }
            }
            return true;
        }
        function BuildForm(targetFormID) {
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
            for (i = 0; i < inputObjects.length; i++) {
                inputObjects[i].onkeyup = function () {
                    ConstrainToAlpha(event);
                };
                inputObjects[i].onblur = function () {
                    HighLiteEmptyInput(event);
                };
            }
            // installation des "delegates" pour les inputs de classe "masked" 
            var maskedInputs = document.getElementsByClassName("masked");
            for (i = 0; i < maskedInputs.length; i++) {
                maskedInputs[i].onkeydown = function () {
                    return Valide_Masque(event);
                };
                maskedInputs[i].onkeyup = function () {
                    Post_Check_Masque(event);
                }; maskedInputs[i].onblur = function () {
                    Post_Check_Masque(event);
                    HighLiteIncompleteMaskedInput(event)
                };
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <script type="text/javascript" <%--src="ClientFormUtilities.js"--%>>
                 BuildForm("form1"); </script>
                         <h3>Modification...</h3>
        </div>
    </form>
</body>
</html>
