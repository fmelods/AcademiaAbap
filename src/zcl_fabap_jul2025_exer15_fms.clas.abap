CLASS zcl_fabap_jul2025_exer15_fms DEFINITION
                                   PUBLIC
                                   FINAL
                                   CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_fabap_jul2025_exer15_fms IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    " 1. SELECT Específico - Selecionar apenas as colunas necessárias
    " 2. Minimizar Acessos ao Banco - Usar JOIN em vez de SELECT dentro de LOOP
    " 3. Estruturas de Dados Otimizadas - Filtrar dados específicos

    " Seleciona apenas os campos necessários com JOIN
    TYPES: BEGIN OF ty_flight_data,
             carrier_id    TYPE /dmo/carrier_id,
             connection_id TYPE /dmo/connection_id,
             price         TYPE /dmo/flight_price,
             distance      TYPE /dmo/flight_distance,
           END OF ty_flight_data.

    DATA lt_flight_data TYPE SORTED TABLE OF ty_flight_data
     WITH NON-UNIQUE KEY carrier_id connection_id.

    SELECT flight~carrier_id,
           flight~connection_id,
           flight~price,
           connection~distance
      FROM /dmo/flight AS flight
             INNER JOIN
               /dmo/connection AS connection ON  flight~carrier_id    = connection~carrier_id
                                             AND flight~connection_id = connection~connection_id
      WHERE connection~distance > 1000
       AND flight~carrier_id   = 'UA'
      INTO TABLE @lt_flight_data.

    " Processa os dados com FIELD-SYMBOL
    LOOP AT lt_flight_data ASSIGNING FIELD-SYMBOL(<fs_flight>).
      <fs_flight>-price *= '1.10'.
      ##NO_TEXT
      out->write( |Preço atualizado para voo { <fs_flight>-carrier_id }-{ <fs_flight>-connection_id }| ).
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
