pageextension 50004 ExtendItemList extends "Item List"
{
    layout
    {
        addafter("Base Unit of Measure")
        {
            field("Mnfg Part No"; "Mnfg Part No")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}