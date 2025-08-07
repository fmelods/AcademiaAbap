CLASS zcl_fabap_jul2025_extra2_fms DEFINITION
                                  PUBLIC
                                  FINAL
                                  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXTRA2_FMS IMPLEMENTATION.


    METHOD if_oo_adt_classrun~main.

        " Exercício 1
        out->write( '------------------------------- EXERCÍCIO 1 -------------------------------' ).
        SELECT * FROM zi_fabap_jul2025_exer04_fms
        INTO TABLE @DATA(lt_connect).
        out->write( lt_connect ).

        " Exercício 2
        out->write( '------------------------------- EXERCÍCIO 2 -------------------------------' ).
        SELECT * FROM zi_fabap_jul2025_exer05_fms
        INTO TABLE @DATA(lt_connect2).
        out->write( lt_connect2 ).

        " Exercício 3
        out->write( '------------------------------- EXERCÍCIO 3 -------------------------------' ).
        SELECT * FROM zi_fabap_jul2025_exer04_fms
        INTO TABLE @DATA(lt_connect3).
        out->write( lt_connect3 ).

    ENDMETHOD.
ENDCLASS.
