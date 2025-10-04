
#              ================================

puts "B E G I N   A N A L Y S I S"
puts "model: generating..."  

# GEOMETRY/MATERIAL/SECTIONS --------------------------------------------------------------------------
set ModelFile [open "$modelScale/$EQlevel/$RSN/$ModelDirectory/modelData.txt" "w"];
set MatFile [open "$modelScale/$EQlevel/$RSN/$ModelDirectory/matFoundData.txt" "w"];

source "INPUT_mat.tcl"
puts "MATERIALS OK"

source "INPUT_nodes_col.tcl"
puts "NODES COLS OK"

source "INPUT_sec.tcl"
puts "SECTIONS OK"

source "INPUT_sec_spm_PT.tcl"
puts "SECTIONS STRINGERS WITH PT OK"

# GEOMETRIC TRANSFORMATIONS --------------------------------------------------------------------------
source "TRANSF.tcl"
puts "TRANSFORMATIONS OK"

# ELEMENTS --------------------------------------------------------------------------
source "INPUT_elem_cols_elas.tcl"
puts "ELEMENTS COLS OK"

source "BTMmain.tcl"
puts "BTM OK"

source "INPUT_elem_retwalls.tcl"
puts "ELEMENTS RETAINING WALLS OK"

source "INPUT_BTMspm_elastic.tcl"
puts "ELASTIC STRINGER-PANEL WITH PT OK"
		
close $ModelFile

source "INPUT_BTMmass.tcl"
puts "MASS OK"