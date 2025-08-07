CLASS zcl_fabap_jul2025_exer01_e_fms DEFINITION
                                     PUBLIC
                                     FINAL
                                     CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER01_E_FMS IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Tabelas

* Estruturas

* Variáveis
    DATA o_produto TYPE REF TO zcl_fabap_jul2025_exer01_fms.
    DATA v_resultado TYPE abap_bool.

**********************************************************************

    o_produto = NEW #( i_codigo = '001'
                       i_nome   = 'Notebook Dell'
                       i_preco  = '2500' ).

    out->write( 'Código: ' && o_produto->get_codigo( ) ).
    out->write( 'Nome: ' && o_produto->get_nome( ) ).
    out->write( 'Preço: ' && o_produto->get_preco( ) ).
    out->write( 'Quantidade em Estoque: ' && o_produto->get_estoque( ) ).
    out->write( 'Valor Total do Estoque: ' && o_produto->calcular_valor_total( ) ).

    o_produto->adicionar_estoque( 10 ).
    out->write( 'Quantidade em Estoque (após adicionar): ' && o_produto->get_estoque( ) ).
    out->write( 'Valor Total do Estoque: ' && o_produto->calcular_valor_total( ) ).

    " Remover estoque com erro premeditado
    v_resultado = o_produto->remover_estoque( 15 ).

    IF v_resultado = abap_false.
      out->write( 'Erro: Estoque insuficiente para remover 15 unidades' ).
    ELSE.
      out->write( 'Quantidade removida com sucesso' ).
      out->write( 'Quantidade em Estoque (após remover): ' && o_produto->get_estoque( ) ).
    ENDIF.

    " Remover estoque sem erro
    v_resultado = o_produto->remover_estoque( 5 ).

    IF v_resultado = abap_false.
      out->write( 'Erro: Estoque insuficiente para remover 5 unidades' ).
    ELSE.
      out->write( 'Quantidade removida com sucesso' ).
      out->write( 'Quantidade em Estoque (após remover): ' && o_produto->get_estoque( ) ).
      out->write( 'Valor Total do Estoque Final: ' && o_produto->calcular_valor_total( ) ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
