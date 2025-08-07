*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

* Tipificações Locais
TYPES: BEGIN OF ty_funcionario_info,
         referencia TYPE REF TO zcl_fabap_jul2025_func_fms,
         tipo       TYPE string,
       END OF ty_funcionario_info.
TYPES: t_funcionarios TYPE STANDARD TABLE OF ty_funcionario_info WITH EMPTY KEY.
