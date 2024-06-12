pageextension 50404 "DYF JsonExport" extends "DYF TestPageList"
{
    actions
    {
        addlast(Navigation)
        {
            action("DYF JsonExport")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Category4;
                Image = ExportElectronicDocument;
                Caption = 'Export Data in to JSON File', Comment = 'ITA="Esportare dati in file JSON "';

                trigger OnAction()
                begin
                    MyCodunit.ExportJSON();
                end;
            }
        }
    }
    var
        MyCodunit: Codeunit "DYF MyCodeunit";

    // local procedure ExportJSON()
    // var
    //     TestTable: Record "DYF TestTable";
    //     exctablejson: JsonObject;
    //     exctablearray: JsonArray;
    //     tempblob: Codeunit "Temp Blob";
    //     ins: InStream;
    //     outs: OutStream;
    //     exportfilename: Text;


    // begin

    //     //TestTable.SetRange("No.");
    //     exctablejson.Add(TestTable.FieldCaption("No."), TestTable."No.");
    //     exctablejson.Add(TestTable.FieldCaption(Name), TestTable.Name);
    //     exctablejson.Add(TestTable.FieldCaption(Surname), TestTable.Surname);
    //     exctablejson.Add(TestTable.FieldCaption("Date of birth"), TestTable."Date of birth");
    //     exctablejson.Add(TestTable.FieldCaption("Fiscal Code."), TestTable."Fiscal Code.");
    //     exctablearray.add(exctablejson);


    //     if TestTable.FindSet() then
    //         repeat
    //             Clear(exctablejson);
    //             exctablejson.Add(TestTable.FieldCaption("No."), TestTable."No.");
    //             exctablejson.Add(TestTable.FieldCaption(Name), TestTable.Name);
    //             exctablejson.Add(TestTable.FieldCaption(Surname), TestTable.Surname);
    //             exctablejson.Add(TestTable.FieldCaption("Date of birth"), TestTable."Date of birth");
    //             exctablejson.Add(TestTable.FieldCaption("Fiscal Code."), TestTable."Fiscal Code.");
    //             exctablearray.add(exctablejson);
    //         until TestTable.Next() = 0;
    //     TestTable.Reset();
    //     TestTable.FindSet();
    //     tempblob.CreateOutStream(outs);
    //     if exctablearray.WriteTo(outs) then begin
    //         exportfilename := 'exctable.json';
    //         tempblob.CreateInStream(ins);
    //         DownloadFromStream(ins, '', '', '', exportfilename);
    //     end;
    // end;
}
