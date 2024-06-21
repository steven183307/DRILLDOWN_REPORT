@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Schedule line date'

@UI.headerInfo:{
    typeNamePlural: 'Schedule line date',
    typeName: 'Schedule line date',
    title.value: 'SalesDocument',
    description: {type: #STANDARD }
    }

define view entity ZTDC_VBEP
  as select from ZTDI_VBEP
{
      @UI.facet: [
        {
                 label: 'Header Info',
                 id: 'HeaderInfo',
                 type: #COLLECTION,
                 position: 10
        }
        ,
                {
        label: 'Schedule line date',
        type: #IDENTIFICATION_REFERENCE,
        purpose: #STANDARD,
        parentId: 'HeaderInfo',
        position: 10,
        targetQualifier: 'date'
        }
        ]

      @UI.identification: [{position: 10 , label: 'SalesDocument' , qualifier: 'Header'}]
      @UI.lineItem: [{position: 10,label: 'SalesDocument'}]
  key SalesDocument,

      @UI.identification: [{position: 10 , label: 'SalesDocument' , qualifier: 'Header'}]
      @UI.lineItem: [{position: 20,label: 'SalesDocumentItem'}]
  key SalesDocumentItem,

      @UI.identification: [{position: 10 , label: 'SalesDocument' , qualifier: 'Header'}]
      @UI.lineItem: [{position: 30,label: 'DeliveryDate'}]
      DeliveryDate
}
