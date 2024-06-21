@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Accounting Document(Item)'

@UI.headerInfo:{
    typeNamePlural: 'Accounting Document Item',
    typeName: 'Accounting Document Item',
    title.value: 'AccountingDocument',
    description: {type: #STANDARD,
                  value:'AccountingDocumentItem' 
    }
    }

define view entity ZTDC_BSEG as select from ZTDI_BSEG

{
      @UI.facet: [

      {
                  label: 'Accounting Info',
                  id: 'COLLFAC1',
                  type: #COLLECTION,
                  position: 10
      },{
                  label: 'Accounting Data',
                  parentId: 'COLLFAC1',
                  type: #IDENTIFICATION_REFERENCE,
                  position: 10,
                  targetQualifier: 'header'
      },
        {
                  label: 'Accounting Item Info',
                  id: 'COLLFAC2',
                  type: #COLLECTION,
                  position: 20
      },{
                  label: 'Accounting Data',
                  parentId: 'COLLFAC2',
                  type: #IDENTIFICATION_REFERENCE,
                  position: 20,
                  targetQualifier: 'Item'
      }
      ]
      @UI.identification: [{position: 30 , label: 'CompanyCode' , qualifier: 'header'}]
      @UI.lineItem: [{position: 30,label: 'CompanyCode' }]
  key CompanyCode,
      @UI.identification: [{position: 10 , label: 'AccountingDocument' , qualifier: 'header'}]
      @UI.lineItem: [{position: 30,label: 'AccountingDocument' }]
  key AccountingDocument,
      @UI.identification: [{position: 20 , label: 'FiscalYear' , qualifier: 'header'}]
      @UI.lineItem: [{position: 30,label: 'FiscalYear' }]
  key FiscalYear,
      @UI.identification: [{position: 40 , label: 'AccountingDocumentItem' , qualifier: 'header'}]
      @UI.lineItem: [{position: 10,label: 'AccountingDocumentItem' }]
  key AccountingDocumentItem,
  
      @UI.identification: [{position: 10 , label: 'PostingKey' , qualifier: 'Item'}]
      @UI.lineItem: [{position: 20,label: 'PostingKey' }]
      PostingKey,
      
      @UI.identification: [{position: 20 , label: 'GLAccount' , qualifier: 'Item'}]
      @UI.lineItem: [{position: 30,label: 'GLAccount' }]
      GLAccount,

      @UI.identification: [{position: 30 , label: 'AmountInTransactionCurrency' , qualifier: 'Item'}]
      @UI.lineItem: [{position: 40,label: 'AmountInTransactionCurrency' }]
      AmountInTransactionCurrency,
      
      @UI.identification: [{position: 40 , label: 'DebitCreditCode' , qualifier: 'Item'}]
      @UI.lineItem: [{position: 60,label: 'DebitCreditCode' }]
      DebitCreditCode,

      TransactionCurrency
}
