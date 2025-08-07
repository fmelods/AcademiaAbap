CLASS zcl_fabap_jul2025_func_e_fms DEFINITION
                                   PUBLIC
                                   FINAL
                                   CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS ZCL_FABAP_JUL2025_FUNC_E_FMS IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Tabelas
    DATA lt_funcionarios TYPE t_funcionarios.

* Estruturas
    DATA ls_funcionario  TYPE ty_funcionario_info.

* Variáveis
    DATA o_func_integral TYPE REF TO zcl_fabap_jul2025_int_fms.
    DATA o_func_horista  TYPE REF TO zcl_fabap_jul2025_hor_fms.

**********************************************************************

    " Criando funcionário integral
    CREATE OBJECT o_func_integral
      EXPORTING
        i_nome         = 'João Silva'
        i_id           = 'EMP001'
        i_salario_base = '5000.00'
        i_bonus        = '1500.00'.

    " Criando funcionário horista
    CREATE OBJECT o_func_horista
      EXPORTING
        i_nome         = 'Maria Santos'
        i_id           = 'EMP002'
        i_salario_base = '25.00'
        i_horas        = '160.00'.

    " Adicionando à tabela polimórfica
    APPEND VALUE #( referencia = o_func_integral tipo = 'Integral' ) TO lt_funcionarios.
    APPEND VALUE #( referencia = o_func_horista  tipo = 'Horista' )  TO lt_funcionarios.

    " Exibindo dados de forma polimórfica
    out->write( |=== LISTAGEM DE FUNCIONÁRIOS ===| ).
    LOOP AT lt_funcionarios INTO ls_funcionario.
      out->write( |Tipo: { ls_funcionario-tipo }| ).
      out->write( ls_funcionario-referencia->exibir_dados( ) ).
      out->write( |Salário Calculado: { ls_funcionario-referencia->calcular_salario( ) } EUR| ).
      out->write( |------------------------------------| ).
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
