tableextension 50001 ExtendsSalesInvoiceHeader extends "Sales Invoice Header"
{
    fields
    {
        field(50000; "Freight on Board"; Text[30])
        {

        }
        field(50001; Project; Text[50])
        {

        }
    }

    var
        myInt: Integer;
}