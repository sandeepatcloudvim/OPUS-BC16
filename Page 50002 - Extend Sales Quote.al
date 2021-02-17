pageextension 50002 ExtendSalesQuote extends "Sales Quote"
{
    layout
    {
        addafter("Requested Delivery Date")
        {
            field("Freight on Board"; "Freight on Board")
            {
                ApplicationArea = All;
            }
            field(Project; Project)
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