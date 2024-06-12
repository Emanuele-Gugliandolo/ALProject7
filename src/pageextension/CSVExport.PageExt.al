pageextension 50403 "DYF CSVExport" extends "DYF TestPageList"
{
    actions
    {
        addlast(Navigation)
        {
            action("DYF ExporCSV")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Category4;
                Image = Export;
                Caption = 'Export Data in to CSV File', Comment = 'ITA="Esportare dati in file CSV"';

                trigger OnAction()

                begin
                    MyCodunit.exportcsv();
                end;
            }
        }
    }

    var
        MyCodunit: Codeunit "DYF MyCodeunit";

    // local procedure exportcsv()
    // var
    //     tempblob: Codeunit "Temp Blob";
    //     ins: InStream;
    //     outs: OutStream;
    //     filename: Text;
    //     textbuilder: TextBuilder;
    //     TestTable: Record "DYF TestTable";

    // begin
    //     filename := 'Testfile_' + UserId + '_' + Format(CurrentDateTime) + '.csv';
    //     textbuilder.AppendLine('No.' + ';' + 'Name' + ';' + 'Surname' + ';' + 'Data of Bith' + ';' + 'Fiscal Code.' + ';;');
    //     if TestTable.FindSet() then
    //         repeat
    //             textbuilder.AppendLine(Format(TestTable."No.") + ';' + Format(TestTable.Name) + ';' + Format(TestTable.Surname) + ';' + Format(TestTable."Date of birth") + ';' + Format(TestTable."Fiscal Code.") + ';;');

    //         until TestTable.Next() = 0;
    //     tempblob.CreateOutStream(outs);
    //     outs.Write(textbuilder.ToText());
    //     tempblob.CreateInStream(ins);
    //     DownloadFromStream(ins, '', '', '', filename);
    // end;
}
