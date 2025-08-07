CLASS zcl_fabap_jul2025_factory_fms DEFINITION
                                    PUBLIC
                                    FINAL
                                    CREATE PUBLIC.

  PUBLIC SECTION.
* Contantes
    CONSTANTS k_tipo_integral TYPE string VALUE 'INTEGRAL'.
    CONSTANTS k_tipo_horista  TYPE string VALUE 'HORISTA'.

* Factory Methods
    CLASS-METHODS criar_funcionario
      IMPORTING
        i_tipo         TYPE string
        i_nome         TYPE string
        i_id           TYPE string
        i_salario_base TYPE decfloat16
        i_valor_extra  TYPE decfloat16
      RETURNING
        VALUE(r_funcionario) TYPE REF TO zcl_fabap_jul2025_func_fms.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS ZCL_FABAP_JUL2025_FACTORY_FMS IMPLEMENTATION.


  METHOD criar_funcionario.

    CASE i_tipo.
      WHEN k_tipo_integral.
        CREATE OBJECT r_funcionario TYPE zcl_fabap_jul2025_int_fms
          EXPORTING
            i_nome         = i_nome
            i_id           = i_id
            i_salario_base = i_salario_base
            i_bonus        = i_valor_extra.

      WHEN k_tipo_horista.
        CREATE OBJECT r_funcionario TYPE zcl_fabap_jul2025_hor_fms
          EXPORTING
            i_nome         = i_nome
            i_id           = i_id
            i_salario_base = i_salario_base
            i_horas        = i_valor_extra.
    ENDCASE.

  ENDMETHOD.
ENDCLASS.
