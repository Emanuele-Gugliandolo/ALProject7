pageextension 50405 "DYF XMLExport" extends "DYF TestPageList"
{
    actions
    {
        addlast(Navigation)
        {
            action("DYF XMLExport")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Category4;
                Image = XMLFile;
                Caption = 'Export Data in XML File', Comment = 'ITA="Esportare dati in file XML"';

                trigger OnAction()
                begin
                    //Xmlport.Run(50400, true, false);
                    MyCodeunit.XMLExport();
                end;
            }
        }
    }
    var
        MyCodeunit: Codeunit "DYF MyCodeunit";

}