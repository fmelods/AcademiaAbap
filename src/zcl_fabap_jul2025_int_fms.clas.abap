CLASS zcl_fabap_jul2025_int_fms DEFINITION
                                INHERITING FROM zcl_fabap_jul2025_func_fms
                                PUBLIC
                                FINAL
                                CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING
        i_nome         TYPE string
        i_id           TYPE string
        i_salario_base TYPE decfloat16
        i_bonus        TYPE decfloat16.
    METHODS calcular_salario REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA v_bonus TYPE decfloat16.

ENDCLASS.



CLASS ZCL_FABAP_JUL2025_INT_FMS IMPLEMENTATION.


  METHOD calcular_salario.
    salario = v_salario_base + v_bonus.
  ENDMETHOD.


  METHOD constructor.
    super->constructor(
      i_nome         = i_nome
      i_id           = i_id
      i_salario_base = i_salario_base
    ).
    v_bonus = i_bonus.
  ENDMETHOD.
ENDCLASS.
