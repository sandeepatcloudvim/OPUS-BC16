pageextension 50003 ExtendItemCard extends "Item Card"
{
    layout
    {
        addafter("Item Category Code")
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