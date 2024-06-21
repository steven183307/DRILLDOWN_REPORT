@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Accounting Document(Header)'

@UI.headerInfo:{
    typeNamePlural: 'Accounting Document',
    typeName: 'Accounting Document',
    title.value: 'AccountingDocument',
    description: {type: #STANDARD }
    }
    
define view entity ZTDC_BKPF2 as select from ZTDI_BKPF

association [0..*] to ZTDC_BSEG as _ZTDC_BSEG on $projection.CompanyCode = _ZTDC_BSEG.CompanyCode
                                               and $projection.AccountingDocument = _ZTDC_BSEG.AccountingDocument
                                               and $projection.FiscalYear  = _ZTDC_BSEG.FiscalYear
{
    
       @UI.facet: [
       {
                   id: 'AccountingDocument',
                    purpose: #STANDARD,
                    position: 20,
                    type: #LINEITEM_REFERENCE,
                    targetElement: '_ZTDC_BSEG',
                    label: 'Accounting Document Item'
       }
       ,
       {
                   label: 'Accounting Info',
                   id: 'COLLFAC1',
                   type: #COLLECTION,
                   position: 10
       },{
                   label: 'Accounting Data',
                   parentId: 'COLLFAC1',
                   type: #IDENTIFICATION_REFERENCE,
                   position: 20,
                   targetQualifier: 'header'
       }
       ]
       @UI.identification: [{position: 10 , label: 'BCompanyCode' , qualifier: 'header'}]
       @UI.lineItem: [{position: 30,label: 'CompanyCode' }]
  key  CompanyCode,
       @UI.identification: [{position: 10 , label: 'AccountingDocument' , qualifier: 'header'}]
       @UI.lineItem: [{position: 10,label: 'AccountingDocument' }]
  key  AccountingDocument,
       @UI.identification: [{position: 10 , label: 'FiscalYear' , qualifier: 'header'}]
       @UI.lineItem: [{position: 20,label: 'FiscalYear' }]
  key  FiscalYear,
       @UI.identification: [{position: 10 , label: 'DocumentDate' , qualifier: 'header'}]
       @UI.lineItem: [{position: 40,label: 'DocumentDate' }]
       DocumentDate,
       @UI.identification: [{position: 10 , label: 'PostingDate' , qualifier: 'header'}]
       @UI.lineItem: [{position: 50,label: 'PostingDate' }]
       PostingDate,
       @UI.identification: [{position: 10 , label: 'DocumentReferenceID' , qualifier: 'header'}]
       @UI.lineItem: [{position: 60,label: 'DocumentReferenceID' }]
       DocumentReferenceID,
       @UI.identification: [{position: 10 , label: 'TransactionCurrency' , qualifier: 'header'}]
       @UI.lineItem: [{position: 70,label: 'TransactionCurrency' }]
       TransactionCurrency,
       
       ReferenceDocumentType,
       OriginalReferenceDocument,
       
       _ZTDC_BSEG
}
