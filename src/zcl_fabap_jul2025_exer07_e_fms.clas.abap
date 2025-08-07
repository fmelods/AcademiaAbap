CLASS zcl_fabap_jul2025_exer07_e_fms DEFINITION
                                     PUBLIC
                                     FINAL
                                     CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER07_E_FMS IMPLEMENTATION.


    METHOD if_oo_adt_classrun~main.
        zcl_fabap_jul2025_exer07_fms=>get_data( IMPORTING et_data = DATA(lt_data) ).

        out->write( lt_data ).
    ENDMETHOD.
ENDCLASS.
