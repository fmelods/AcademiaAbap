CLASS zcl_fabap_jul2025_func_fms DEFINITION
                                 ABSTRACT
                                 PUBLIC
                                 CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS: calcular_salario ABSTRACT RETURNING VALUE(salario) TYPE decfloat16,
      exibir_dados RETURNING VALUE(dados) TYPE string.
    METHODS constructor
      IMPORTING
        i_nome         TYPE string
        i_id           TYPE string
        i_salario_base TYPE decfloat16.

  PROTECTED SECTION.
    DATA v_nome         TYPE string.
    DATA v_id           TYPE string.
    DATA v_salario_base TYPE decfloat16.

  PRIVATE SECTION.

ENDCLASS.



CLASS ZCL_FABAP_JUL2025_FUNC_FMS IMPLEMENTATION.


  METHOD constructor.
    v_nome         = i_nome.
    v_id           = i_id.
    v_salario_base = i_salario_base.
  ENDMETHOD.


  METHOD exibir_dados.
    dados = |ID: { v_id }, Nome: { v_nome }, Salário: { calcular_salario( ) } EUR|.
  ENDMETHOD.
ENDCLASS.
