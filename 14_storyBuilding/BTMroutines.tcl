
#              ================================

puts "B E G I N   A N A L Y S I S"
puts "model: generating..."  

# GEOMETRY/MATERIAL/SECTIONS --------------------------------------------------------------------------
set ModelFile [open "$modelScale/$EQlevel/$RSN/$ModelDirectory/modelData.txt" "w"];

source "INPUT_mat.tcl"
puts "MATERIALS OK"

source "INPUT_sec.tcl"
puts "SECTIONS OK"

# GEOMETRIC TRANSFORMATIONS --------------------------------------------------------------------------
source "TRANSF.tcl"
puts "TRANSFORMATIONS OK"

# ELEMENTS --------------------------------------------------------------------------
source "BTMmain.tcl"
puts "BTM OK"

if {$modelType == 1} {

	source "INPUT_nodes_col_Model1.tcl"
	puts "NODES COLS OK"
	
	source "INPUT_elem_cols_elas_Model1.tcl"
	puts "ELEMENTS COLS OK"
	
	source "INPUT_BTMspm_elastic_Model1.tcl"
	puts "STRINGER-PANEL LINEAR OK"
	
} elseif {$modelType == 2} {

	source "INPUT_nodes_col_Model2.tcl"
	puts "NODES COLS OK"
	
	source "INPUT_elem_cols_elas_Model2.tcl"
	puts "ELEMENTS COLS OK"
	
	source "INPUT_BTMspm_elastic_Model2.tcl"
	puts "STRINGER-PANEL LINEAR OK"

} elseif {$modelType == 3} {

	source "INPUT_nodes_col_Model3.tcl"
	puts "NODES COLS OK"
	
	source "INPUT_elem_cols_elas_Model3.tcl"
	puts "ELEMENTS COLS OK"
	
	source "INPUT_BTMspm_elastic_Model3.tcl"
	puts "STRINGER-PANEL LINEAR OK"

} elseif {$modelType == 4} {

	source "INPUT_nodes_col_Model4.tcl"
	puts "NODES COLS OK"
	
	source "INPUT_elem_cols_elas_Model4.tcl"
	puts "ELEMENTS COLS OK"
	
	source "INPUT_BTMspm_elastic_Model4.tcl"
	puts "STRINGER-PANEL LINEAR OK"

}

close $ModelFile

if {$analysisType == "dynamic"} {

	if {$modelType == 1} {
	
		source "INPUT_BTMmass_Model1.tcl"
	
	} elseif {$modelType == 2} {
	
		source "INPUT_BTMmass_Model2.tcl"
	
	} elseif {$modelType == 3} {
	
		source "INPUT_BTMmass_Model3.tcl"
	
	} elseif {$modelType == 4} {
	
		source "INPUT_BTMmass_Model4.tcl"
	
	}
	
    puts "MASS OK"
}