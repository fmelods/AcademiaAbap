CLASS zcl_fabap_jul2025_exer01_fms DEFINITION
                                   PUBLIC
                                   FINAL
                                   CREATE PUBLIC.

  PUBLIC SECTION.
    " Construtor e Métodos Públicos
    METHODS constructor
      IMPORTING
        i_codigo TYPE string
        i_nome   TYPE string
        i_preco  TYPE decfloat16.

    METHODS adicionar_estoque
      IMPORTING
        i_quantidade TYPE i.

    METHODS remover_estoque
      IMPORTING
        i_quantidade TYPE i
      RETURNING
        VALUE(r_resultado) TYPE abap_bool.

    METHODS calcular_valor_total
      RETURNING
        VALUE(r_total) TYPE decfloat16.

    " Métodos GET
    METHODS get_codigo
      RETURNING
        VALUE(r_codigo) TYPE string.

    METHODS get_nome
      RETURNING
        VALUE(r_nome) TYPE string.

    METHODS get_preco
      RETURNING
        VALUE(r_preco) TYPE decfloat16.

    METHODS get_estoque
      RETURNING
        VALUE(r_estoque) TYPE i.

  PROTECTED SECTION.

  PRIVATE SECTION.
    " Atributos Privados
    DATA v_codigo  TYPE string.
    DATA v_nome    TYPE string.
    DATA v_preco   TYPE decfloat16.
    DATA v_estoque TYPE i.

ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER01_FMS IMPLEMENTATION.


  METHOD adicionar_estoque.
    v_estoque += i_quantidade.
  ENDMETHOD.


  METHOD calcular_valor_total.
    r_total = v_preco * v_estoque.
  ENDMETHOD.


  METHOD constructor.
    v_codigo = i_codigo.
    v_nome = i_nome.
    v_preco = i_preco.
    v_estoque = 0.
  ENDMETHOD.


  METHOD get_codigo.
    r_codigo = v_codigo.
  ENDMETHOD.


  METHOD get_estoque.
    r_estoque = v_estoque.
  ENDMETHOD.


  METHOD get_nome.
    r_nome = v_nome.
  ENDMETHOD.


  METHOD get_preco.
    r_preco = v_preco.
  ENDMETHOD.


  METHOD remover_estoque.
    IF i_quantidade > v_estoque.
      r_resultado = abap_false.
    ELSE.
      v_estoque -= i_quantidade.
      r_resultado = abap_true.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
