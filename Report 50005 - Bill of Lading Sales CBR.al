report 50005 "Bill of Lading Sales CBR"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Default.rdl';
    Caption = 'Bill of Lading Sales';

    dataset
    {
        dataitem(CopyLoop; "Integer")
        {
            DataItemTableView = SORTING(Number);
            column(Number; Number)
            {
            }
            column(CompanyNameText; CompNameText)
            {
            }
            column(DateText; DateTxt)
            {
            }
            dataitem("Sales Header"; "Sales Header")
            {
                DataItemTableView = SORTING("Document Type", "No.") WHERE("Document Type" = CONST(Order));
                RequestFilterFields = "No.";
                column(No_SalesHeader; "No.")
                {
                    IncludeCaption = true;
                }
                column(CustomerNo_SalesHeader; "Sell-to Customer No.")
                {
                    IncludeCaption = true;
                }
                column(CustomerName_SalesHeader; "Sell-to Customer Name")
                {
                    IncludeCaption = true;
                }
                column(Freight_on_Board; "Freight on Board")
                {

                }
                column(Shipping_Agent_Code; recShippingAgent.Name)
                {

                }
                column(Shipping_Agent_Service_Code; "Shipping Agent Service Code")
                {

                }
                column(Project; Project)
                {

                }
                column(Package_Tracking_No_; "Package Tracking No.")
                {

                }
                column(ShipmentMethodDescription; recShipmentMethod.Description)
                {

                }

                column(External_Document_No_; "External Document No.")
                {

                }
                column(CustomerAddress1; CustAddr[1])
                {
                }
                column(CustomerAddress2; CustAddr[2])
                {
                }
                column(CustomerAddress3; CustAddr[3])
                {
                }
                column(CustomerAddress4; CustAddr[4])
                {
                }
                column(CustomerAddress5; CustAddr[5])
                {
                }
                column(CustomerAddress6; CustAddr[6])
                {
                }
                column(CustomerAddress7; CustAddr[7])
                {
                }
                column(CustomerAddress8; CustAddr[8])
                {
                }
                column(ShipToAddress1; ShipToAddr[1])
                {
                }
                column(ShipToAddress2; ShipToAddr[2])
                {
                }
                column(ShipToAddress3; ShipToAddr[3])
                {
                }
                column(ShipToAddress4; ShipToAddr[4])
                {
                }
                column(ShipToAddress5; ShipToAddr[5])
                {
                }
                column(ShipToAddress6; ShipToAddr[6])
                {
                }
                column(ShipToAddress7; ShipToAddr[7])
                {
                }
                column(ShipToAddress8; ShipToAddr[8])
                {
                }
                column(Shipment_Method_Code; "Shipment Method Code")
                {

                }
                column(Salesperson_Code; SalesPerson.Name)
                {

                }

                dataitem("Sales Line"; "Sales Line")
                {
                    DataItemLink = "Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.");
                    DataItemTableView = SORTING("Document Type", "Document No.", "Line No.") WHERE(Type = CONST(Item));
                    column(LineNo_SalesLine; "Line No.")
                    {
                    }
                    column(ItemNo_SalesLine; "No.")
                    {
                        IncludeCaption = true;
                    }
                    column(ExternalDocNo; SalesHeader."External Document No.")
                    {

                    }
                    column(SeqNo; SeqNo)
                    {

                    }
                    column(Description_SalesLine; Description)
                    {
                        IncludeCaption = true;
                    }
                    column(VariantCode_SalesLine; "Variant Code")
                    {
                        IncludeCaption = true;
                    }
                    column(LocationCode_SalesLine; "Location Code")
                    {
                        IncludeCaption = true;
                    }
                    column(BinCode_SalesLine; "Bin Code")
                    {
                        IncludeCaption = true;
                    }
                    column(ShipmentDate_SalesLine; Format("Shipment Date"))
                    {
                    }
                    column(Quantity_SalesLine; Quantity)
                    {
                        IncludeCaption = true;
                    }
                    column(UnitOfMeasure_SalesLine; "Unit of Measure")
                    {
                        IncludeCaption = true;
                    }
                    column(QuantityToShip_SalesLine; "Qty. to Ship")
                    {
                        IncludeCaption = true;
                    }
                    column(QuantityShipped_SalesLine; "Quantity Shipped")
                    {
                        IncludeCaption = true;
                    }
                    column(Cross_Reference_No_; "Cross-Reference No.")
                    {

                    }
                    column(Mnfg_Part_No; ManufactureItemNo)
                    {

                    }
                    column(Customer_Text; "Customer Text")
                    {

                    }
                    column(Net_Weight; "Net Weight")
                    {

                    }
                    column(QtyToAsm; QtyToAsm)
                    {
                    }
                    column(Planned_Delivery_Date; FORMAT("Planned Delivery Date"))
                    {

                    }
                    dataitem("Assembly Line"; "Assembly Line")
                    {
                        DataItemTableView = SORTING("Document Type", "Document No.", "Line No.");
                        column(No_AssemblyLine; "No.")
                        {
                            IncludeCaption = true;
                        }
                        column(Description_AssemblyLine; Description)
                        {
                            IncludeCaption = true;
                        }
                        column(VariantCode_AssemblyLine; "Variant Code")
                        {
                            IncludeCaption = true;
                        }
                        column(Quantity_AssemblyLine; Quantity)
                        {
                            IncludeCaption = true;
                        }
                        column(QuantityPer_AssemblyLine; "Quantity per")
                        {
                            IncludeCaption = true;
                        }
                        column(UnitOfMeasure_AssemblyLine; GetUOM("Unit of Measure Code"))
                        {
                        }
                        column(LocationCode_AssemblyLine; "Location Code")
                        {
                            IncludeCaption = true;
                        }
                        column(BinCode_AssemblyLine; "Bin Code")
                        {
                            IncludeCaption = true;
                        }
                        column(QuantityToConsume_AssemblyLine; "Quantity to Consume")
                        {
                            IncludeCaption = true;
                        }

                        trigger OnPreDataItem()
                        begin
                            if not AsmExists then
                                CurrReport.Break;
                            SetRange("Document Type", AsmHeader."Document Type");
                            SetRange("Document No.", AsmHeader."No.");
                        end;


                    }

                    trigger OnAfterGetRecord()
                    var
                        AssembleToOrderLink: Record "Assemble-to-Order Link";
                    begin
                        if recItem.Get("No.") then;
                        if Type <> Type::Item then begin
                            ManufactureItemNo := ''
                        end else begin
                            ManufactureItemNo := recItem."Mnfg Part No";
                        end;

                        If SalesHeader.Get("Sales Line"."Document Type"::Order, "Sales Line"."Document No.") then;
                        //CVIM++
                        SeqNo := 0;
                        if "Line No." >= 10000 then
                            SeqNo := "Line No." / 10000;
                        //CVIM--
                        AssembleToOrderLink.Reset;
                        AssembleToOrderLink.SetCurrentKey(Type, "Document Type", "Document No.", "Document Line No.");
                        AssembleToOrderLink.SetRange(Type, AssembleToOrderLink.Type::Sale);
                        AssembleToOrderLink.SetRange("Document Type", "Document Type");
                        AssembleToOrderLink.SetRange("Document No.", "Document No.");
                        AssembleToOrderLink.SetRange("Document Line No.", "Line No.");
                        AsmExists := AssembleToOrderLink.FindFirst;
                        QtyToAsm := 0;
                        if AsmExists then
                            if AsmHeader.Get(AssembleToOrderLink."Assembly Document Type", AssembleToOrderLink."Assembly Document No.") then
                                QtyToAsm := AsmHeader."Quantity to Assemble"
                            else
                                AsmExists := false;

                    end;



                }
                trigger OnAfterGetRecord()
                begin
                    if recShipmentMethod.Get("Shipment Method Code") then;
                    if SalesPerson.get("Salesperson Code") then;
                    if recShippingAgent.get("Shipping Agent Code") then;

                    FormatAddr.GetCompanyAddr("Responsibility Center", RespCenter, CompanyInfo, CompanyAddr);
                    FormatAddr.SalesHeaderBillTo(CustAddr, "Sales Header");
                    ShowShippingAddr := FormatAddr.SalesHeaderShipTo(ShipToAddr, CustAddr, "Sales Header");
                end;

            }

            trigger OnPreDataItem()
            begin
                SetRange(Number, 1, NoOfCopies + 1);
            end;


        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field("No of Copies"; NoOfCopies)
                    {
                        ApplicationArea = Planning;
                        Caption = 'No of Copies';
                        ToolTip = 'Specifies how many copies of the document to print.';
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
        OrderPickingListCaption = 'Bill of Lading';
        PageCaption = 'Page';
        ItemNoCaption = 'Item  No.';
        OrderNoCaption = 'Order No.';
        CustomerNoCaption = 'Customer No.';
        CustomerNameCaption = 'Customer Name';
        QtyToAssembleCaption = 'Quantity to Assemble';
        QtyAssembledCaption = 'Quantity Assembled';
        ShipmentDateCaption = 'Shipment Date';
        QtyPickedCaption = 'Quantity Picked';
        UOMCaption = 'Unit of Measure';
        QtyConsumedCaption = 'Quantity Consumed';
        CopyCaption = 'Copy';
    }

    trigger OnPreReport()
    begin
        DateTxt := Format(Today);
        CompNameText := CompanyName;
    end;



    var
        AsmHeader: Record "Assembly Header";
        recItem: Record Item;
        SeqNo: Integer;
        recShipmentMethod: Record "Shipment Method";
        SalesHeader: Record "Sales Header";
        recShippingAgent: Record "Shipping Agent";
        NoOfCopies: Integer;
        DateTxt: Text;
        CompNameText: Text;
        QtyToAsm: Decimal;
        AsmExists: Boolean;
        FormatAddr: Codeunit "Format Address";
        FormatDocument: Codeunit "Format Document";
        CustAddr: array[8] of Text[100];
        ShipToAddr: array[8] of Text[100];
        CompanyAddr: array[8] of Text[100];
        ShowShippingAddr: Boolean;
        mpanyInfo: Record "Company Information";
        DummyCompanyInfo: Record "Company Information";
        CompanyInfo: Record "Company Information";
        SalesPerson: Record "Salesperson/Purchaser";
        RespCenter: Record "Responsibility Center";
        ManufactureItemNo: Text[100];

    local procedure GetUOM(UOMCode: Code[10]): Text
    var
        UnitOfMeasure: Record "Unit of Measure";
    begin
        if UnitOfMeasure.Get(UOMCode) then
            exit(UnitOfMeasure.Description);
        exit(UOMCode);
    end;

    procedure InitializeRequest(NewNoOfCopies: Integer)
    begin
        NoOfCopies := NewNoOfCopies;
    end;
}
