@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Billing Document'

@UI.headerInfo:{
    typeNamePlural: 'Billing Document',
    typeName: 'Billing Document',
    title.value: 'BillingDocument',
    description: {type: #STANDARD, 
                  value : 'BillingDocumentItem'
    }
    }
define view entity ZTDC_VBRP as select from ZTDI_VBRP
  
    association [1..*] to ZTDC_BKPF as _ZTDC_BKPF on  $projection.BillingDocument  = _ZTDC_BKPF.OriginalReferenceDocument
                                         and  _ZTDC_BKPF.ReferenceDocumentType = 'VBRK'
{

      @UI.facet: [
      
                  {
                   id: 'AccountingDocument',
                    purpose: #STANDARD,
                    position: 60,
                    type: #LINEITEM_REFERENCE,
                    targetElement: '_ZTDC_BKPF',
                    label: 'Accounting Document'
        },

      {
                  label: 'Billing Info',
                  id: 'COLLFAC1',
                  type: #COLLECTION,
                  position: 10
      },{
                  label: 'Billing Data',
                  parentId: 'COLLFAC1',
                  type: #IDENTIFICATION_REFERENCE,
                  position: 10,
                  targetQualifier: 'header'
      },
            {
                  label: 'Billing Item Info',
                  id: 'COLLFAC2',
                  type: #COLLECTION,
                  position: 20
      },{
                  label: 'Billing Item Data',
                  parentId: 'COLLFAC2',
                  type: #IDENTIFICATION_REFERENCE,
                  position: 20,
                  targetQualifier: 'Item'
      }
      ]
      @UI.identification: [{position: 10 , label: 'BillingDocument' , qualifier: 'header'}]
      @UI.lineItem: [{position: 10,label: 'BillingDocument' }]
  key BillingDocument,
      @UI.identification: [{position: 20 , label: 'BillingDocumentItem' , qualifier: 'header'}]
      
  key BillingDocumentItem,
      @UI.identification: [{position: 30 , label: 'PayerParty' , qualifier: 'header'}]
      @UI.lineItem: [{position: 20,label: 'PayerParty' }]
      PayerParty,   
      @UI.identification: [{position: 40 , label: 'CustomerName' , qualifier: 'header'}]
      @UI.lineItem: [{position: 30,label: 'CustomerName' }]
      CustomerName,
      @UI.identification: [{position: 50 , label: 'BillingDocumentDate' , qualifier: 'header'}]
      @UI.lineItem: [{position: 40,label: 'BillingDocumentDate' }]
      BillingDocumentDate,
      @UI.identification: [{position: 60 , label: 'TransactionCurrency' , qualifier: 'header'}]
      @UI.lineItem: [{position: 50,label: 'TransactionCurrency' }]
      TransactionCurrency,
      
      @UI.identification: [{position: 10 , label: 'BillingDocumentItemText' , qualifier: 'Item'}]
      BillingDocumentItemText,
      @UI.identification: [{position: 20 , label: 'BillingQuantity' , qualifier: 'Item'}]
      BillingQuantity,
      @UI.identification: [{position: 30 , label: 'BillingQuantityUnit' , qualifier: 'Item'}]
      BillingQuantityUnit,
      @UI.identification: [{position: 40 , label: 'NetAmount' , qualifier: 'Item'}]
      NetAmount,
      @UI.identification: [{position: 50 , label: 'Material' , qualifier: 'Item'}]
      Material,
      
      SalesDocument,
      SalesDocumentItem,
      ReferenceSDDocument,
      ReferenceSDDocumentItem,
      
      _ZTDC_BKPF

}
