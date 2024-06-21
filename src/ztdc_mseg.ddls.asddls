@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Material Document'

@UI.headerInfo:{
    typeNamePlural: 'Material Document',
    typeName: 'Material Document',
    title.value: 'MaterialDocument',
    description: {type: #STANDARD }
    }
define view entity ZTDC_MSEG as select from ZTDI_MSEG

  association [1..*] to ZTDC_BKPF2 as _ZTDC_BKPF on  $projection.OriginalReferenceDocument = _ZTDC_BKPF.OriginalReferenceDocument
                                                     and _ZTDC_BKPF.ReferenceDocumentType          = 'MKPF'
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
                      label: 'Material Info',
                      id: 'COLLFAC1',
                      type: #COLLECTION,
                      position: 10
      },{
                      label: 'Material Data',
                      parentId: 'COLLFAC1',
                      type: #IDENTIFICATION_REFERENCE,
                      position: 20,
                      targetQualifier: 'header'
      },
      {
                      label: 'Material Detail Info',
                      id: 'COLLFAC2',
                      type: #COLLECTION,
                      position: 20
      },{
                      label: 'Material Detail Data',
                      parentId: 'COLLFAC2',
                      type: #IDENTIFICATION_REFERENCE,
                      position: 20,
                      targetQualifier: 'Detail'
      }

      ]
      @UI.identification: [{position: 10 , label: 'MaterialDocument' , qualifier: 'header'}]
      @UI.lineItem: [{position: 10,label: 'MaterialDocument' }]
  key MaterialDocument,
      @UI.identification: [{position: 20 , label: 'MaterialDocumentYear' , qualifier: 'header'}]
      @UI.lineItem: [{position: 20,label: 'MaterialDocumentYear' }]
  key MaterialDocumentYear,
      @UI.identification: [{position: 30 , label: 'MaterialDocumentItem' , qualifier: 'header'}]
      @UI.lineItem: [{position: 30,label: 'MaterialDocumentItem' }]
  key MaterialDocumentItem,
      @UI.lineItem: [{position: 40,label: 'PostingDate' }]
      PostingDate,
      @UI.lineItem: [{position: 40,label: 'PostingDate' }]
      GoodsMovementType,
      @UI.lineItem: [{position: 40,label: 'PostingDate' }]
      GoodsMovementTypeName,
      @UI.identification: [{position: 10 , label: 'Material' , qualifier: 'Detail'}]
      Material,
      @UI.identification: [{position: 20 , label: 'Plant' , qualifier: 'Detail'}]
      Plant,
      @UI.identification: [{position: 30 , label: 'PlantName' , qualifier: 'Detail'}]
      PlantName, 
      @UI.identification: [{position: 40 , label: 'StorageLocation' , qualifier: 'Detail'}]
      StorageLocation,
      @UI.identification: [{position: 50 , label: 'StorageLocationName' , qualifier: 'Detail'}]
      StorageLocationName,
      @UI.identification: [{position: 60 , label: 'QuantityInBaseUnit' , qualifier: 'Detail'}]
      QuantityInBaseUnit,
      @UI.identification: [{position: 70 , label: 'MaterialBaseUnit' , qualifier: 'Detail'}]
      MaterialBaseUnit,

      DeliveryDocument,
      DeliveryDocumentItem,

      concat( MaterialDocument , MaterialDocumentYear ) as OriginalReferenceDocument,
      _MaterialDocumentHeader,
      _ZTDC_BKPF



}
