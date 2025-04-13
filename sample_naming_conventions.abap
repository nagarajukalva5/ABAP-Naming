REPORT z_sample_naming_conventions.
TYPES: BEGIN OF ty_rule,
         object_type TYPE string,
         name_pattern TYPE string,
       END OF ty_rule.

DATA: lt_rules TYPE TABLE OF ty_rule,
      ls_rule TYPE ty_rule.

" Define naming convention rules
ls_rule-object_type = 'Variable'.
ls_rule-name_pattern = '^l_[a-z]+$'. " Variables must start with 'l_'
APPEND ls_rule TO lt_rules.

ls_rule-object_type = 'Class'.
ls_rule-name_pattern = '^ZCL_[A-Z][a-zA-Z]+$'. " Classes must start with 'ZCL_'
APPEND ls_rule TO lt_rules.

" Validate naming conventions
LOOP AT lt_rules INTO ls_rule.
  WRITE: / 'Object Type:', ls_rule-object_type,
          'Pattern:', ls_rule-name_pattern.
ENDLOOP.
