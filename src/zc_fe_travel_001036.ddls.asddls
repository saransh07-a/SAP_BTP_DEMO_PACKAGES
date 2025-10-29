@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View forTravel'
@ObjectModel.semanticKey: [ 'TravelID' ]
@Search.searchable: true
define root view entity ZC_FE_TRAVEL_001036
  provider contract transactional_query
  as projection on ZI_FE_TRAVEL_001036 as Travel
{
  key TravelUUID,
  @Search.defaultSearchElement: true
  @Search.fuzzinessThreshold: 0.90 
  @EndUserText.label: 'Travel'
  @ObjectModel.text.element:  [ 'Description' ]
  TravelID,
  @Consumption.valueHelpDefinition: [ {
    entity: {
      name: '/DMO/I_Agency', 
      element: 'AgencyID'
    }
  } ]
  @EndUserText.label: 'Agency'
  @ObjectModel.text.element: ['AgencyName']
  AgencyID,
  @EndUserText.label: 'Customer'
@ObjectModel.text.element: ['LastName']
@Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Customer', element: 'CustomerID'  } }]
  CustomerID,
  BeginDate,
  EndDate,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  BookingFee,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  TotalPrice,
  @Consumption.valueHelpDefinition: [ {
    entity: {
      name: 'I_Currency', 
      element: 'Currency'
    }
  } ]
  CurrencyCode,
  Description,
  @EndUserText.label: 'Status'
  @ObjectModel.text.element: ['TravelStatusText']
  @Consumption.valueHelpDefinition: [{ entity : {name: 'ZI_FE_STAT_001036', element: 'TravelStatusId'  } }]
  OverallStatus,
  OverallStatusCriticality,
  CreatedBy,
  CreatedAt,
  LastChangedBy,
  LastChangedAt,
  @EndUserText.label: 'Last Changed At'
  LocalLastChangedAt,
  _Booking : redirected to composition child ZC_FE_BOOKING_001036,
  _Agency,
  _Agency.Name as AgencyName,
  _Currency,
  _Customer,
  _Customer.LastName as LastName,
  _TravelStatus.TravelStatusText as TravelStatusText,
  _TravelStatus
  
}
