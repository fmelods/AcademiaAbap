CLASS zcl_fabap_jul2025_exer13_fms DEFINITION
                                   PUBLIC
                                   FINAL
                                   CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_fabap_jul2025_exer13_fms IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    " Inline Declarations
    ##NO_TEXT
    DATA(lv_carrid) = 'AA'.
    ##NO_TEXT
    out->write( |New Version - Carrier ID: { lv_carrid }| ).

    DATA(lt_flights) = VALUE ty_flight_tt(
                         ( carrid = 'LH' connid = '0400' flight_date = '20250725' ) ).
    LOOP AT lt_flights INTO DATA(ls_flight).
      ##NO_TEXT
      out->write( |New Version - Flight: { ls_flight-carrid }-{ ls_flight-connid }| ).
    ENDLOOP.

    SELECT * FROM /dmo/flight WHERE carrier_id = 'LH' ORDER BY flight_date INTO TABLE @DATA(lt_selected) UP TO 2 ROWS.
    ##NO_TEXT
    out->write( |New Version - Flights found (SELECT): { lines( lt_selected ) }| ).

    " Table Expressions
    TRY.
        DATA(ls_first) = lt_flights[ 1 ].
        ##NO_TEXT
        out->write( |New Version - First Flight: { ls_first-carrid }-{ ls_first-connid }| ).
      CATCH cx_sy_itab_line_not_found.
      ##NO_TEXT
      out->write( 'Não foi encontrado' ).
    ENDTRY.

    TRY.
        ##NO_TEXT
        DATA(ls_flight_lh) = lt_flights[ carrid = 'LH' connid = '0400' ].
        ##NO_TEXT
        out->write( |New Version - Flight LH-0400: { ls_flight_lh-carrid }-{ ls_flight_lh-connid }| ).
      CATCH cx_sy_itab_line_not_found.
      ##NO_TEXT
      out->write( 'Não foi encontrado' ).
    ENDTRY.

    " Conversion Operator CONV
    DATA(lv_char) = '12345'.
    DATA(lv_int) = CONV i( lv_char ).
    ##NO_TEXT
    out->write( |New Version - Converted to INT: { lv_int }| ).

    " VALUE Operator
    DATA(ls_connection) = VALUE /dmo/connection(
                            airport_from_id = 'FRA'
                            airport_to_id   = 'JFK' ).
    ##NO_TEXT
    out->write( |New Version - Connection: { ls_connection-airport_from_id }-{ ls_connection-airport_to_id }| ).

    DATA(lt_flights_value) = VALUE ty_flight_sorted_tt(
                                ( carrid = 'UA' connid = '0001' flight_date = '20250725' )
                                ( carrid = 'DL' connid = '0002' flight_date = '20250801' ) ).
    ##NO_TEXT
    out->write( |New Version - Flights count (VALUE): { lines( lt_flights_value ) }| ).

    " FOR expression
    DATA(lt_flights_ua) = VALUE ty_flight_sorted_tt(
                            FOR flight IN lt_flights_value
                            WHERE ( carrid = CONV /dmo/carrier_id( 'UA' ) )
                            ( carrid = flight-carrid
                              connid = flight-connid
                              flight_date = flight-flight_date ) ).
    ##NO_TEXT
    out->write( |New Version - Flights for UA (FOR): { lines( lt_flights_ua ) }| ).

    " REDUCE operator
    DATA(lt_numbers) = VALUE ty_int_tt( ( 1 ) ( 2 ) ( 3 ) ).
    DATA(lv_sum) = REDUCE i( INIT x = 0 FOR n IN lt_numbers NEXT x = x + n ).
    ##NO_TEXT
    out->write( |New Version - Sum: { lv_sum }| ).

    " COND and SWITCH
    DATA(lv_status_cond) = COND string(
                             ##NO_TEXT
                             WHEN 1 = 1 THEN 'Success'
                             ##NO_TEXT
                             WHEN 2 = 1 THEN 'Warning'
                             ##NO_TEXT
                             ELSE 'Error' ).
    ##NO_TEXT
    out->write( |New Version - Status (COND): { lv_status_cond }| ).

    ##NO_TEXT
    DATA(lv_status_switch) = SWITCH string( 2
                                            WHEN 1 THEN 'Success'
                                            WHEN 2 THEN 'Warning'
                                            ELSE 'Error' ).
    ##NO_TEXT
    out->write( |New Version - Status (SWITCH): { lv_status_switch }| ).

    " String Template
    ##NO_TEXT
    DATA(lv_template) = |Welcome to ABAP 7.40!|.
    ##NO_TEXT
    out->write( |New Version - String Template (Strings): { lv_template }| ).

    ##NO_TEXT
    DATA(lv_delivery) = |{ '0080003371' ALPHA = OUT }|.
    ##NO_TEXT
    out->write( |New Version - Embedded Expression (ALPHA) (Strings): { lv_delivery }| ).

    " Loop at GROUP BY
    DATA(lt_flight_prices) = VALUE ty_group_tt(
                                ( carrid = 'LH' connid = '0400' price = '100' )
                                ( carrid = 'LH' connid = '0401' price = '150' )
                                ( carrid = 'UA' connid = '0001' price = '200' ) ).

    LOOP AT lt_flight_prices INTO DATA(ls_price)
         GROUP BY ls_price-carrid INTO DATA(lv_group).
      DATA(lv_total_price) = REDUCE /dmo/flight_price(
                               INIT total = 0
                               FOR item IN GROUP lv_group
                               NEXT total = total + item-price ).
      ##NO_TEXT
      out->write( |New Version - Carrier { lv_group } Total Price (Group By): { lv_total_price }| ).
    ENDLOOP.

    " Filter
    DATA(lt_filtered) = FILTER ty_flight_sorted_tt(
                          lt_flights_value
                          WHERE carrid = CONV /dmo/carrier_id( 'LH' ) ).
    ##NO_TEXT
    out->write( |New Version - Filtered flights (LH): { lines( lt_filtered ) }| ).

  ENDMETHOD.

ENDCLASS.

