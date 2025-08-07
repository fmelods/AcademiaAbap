*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

* Tipificações Locais
  TYPES: BEGIN OF ty_flight,
           carrid      TYPE /dmo/carrier_id,
           connid      TYPE /dmo/connection_id,
           flight_date TYPE /dmo/flight_date,
         END OF ty_flight.

  TYPES ty_flight_tt        TYPE STANDARD TABLE OF ty_flight WITH EMPTY KEY.
*****************************************************************************************
  TYPES ty_flight_sorted_tt TYPE SORTED TABLE OF ty_flight WITH UNIQUE KEY carrid connid.
*****************************************************************************************
  TYPES ty_int_tt TYPE STANDARD TABLE OF i WITH EMPTY KEY.
*****************************************************************************************
  TYPES: BEGIN OF ty_group,
           carrid TYPE /dmo/carrier_id,
           connid TYPE /dmo/connection_id,
           price  TYPE /dmo/flight_price,
         END OF ty_group.
  TYPES ty_group_tt TYPE STANDARD TABLE OF ty_group WITH EMPTY KEY.
