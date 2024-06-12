xmlport 50400 "DYF XMLExport"
{
    Caption = 'XMLExport';
    Format = Xml;
    UseRequestPage = false;
    Direction = Export;

    schema
    {
        textelement(RootNodeName)
        {
            tableelement(DYFTestTable; "DYF TestTable")
            {
                fieldelement(No; DYFTestTable."No.")
                {
                }
                fieldelement(Name; DYFTestTable.Name)
                {
                }
                fieldelement(Surname; DYFTestTable.Surname)
                {
                }
                fieldelement(Dateofbirth; DYFTestTable."Date of birth")
                {
                }
                fieldelement(FiscalCode; DYFTestTable."Fiscal Code.")
                {
                }
            }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
}
