table 50400 "DYF TestTable"
{
    Caption = 'TestTable';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.', Comment = 'ITA="Nr."';
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name', Comment = 'ITA="Nome"';
        }
        field(3; Surname; Text[100])
        {
            Caption = 'Surname', Comment = 'ITA="Cognome"';
        }
        field(4; "Date of birth"; Date)
        {
            Caption = 'Date of birth', Comment = 'ITA="Data di Nascita"';
        }
        field(5; "Fiscal Code."; Text[16])
        {
            Caption = 'Fiscal Code.', Comment = 'ITA="Codice Fiscale"';
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
