tableextension 50000 ExtendsSalesHeader extends "Sales Header"
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