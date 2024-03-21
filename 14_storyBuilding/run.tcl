# ##############################################################################################
# 						             Rotational Ground Motion                                  #
# ##############################################################################################

# Don't forget to
wipe;

set tStart [clock seconds]

# DEFINE MODEL ----------------------------------------------------------------------
set modelScale "14story_Rotation_Model1";			# Folder name
set RSN "KHMN";						# RSN of ground motion

set EQlevel "MCEr";					# MCEr or SLE

if {$EQlevel != "MCEr" && $EQlevel != "SLE"} {
	
	puts "Choose either MCEr or SLE"
	end

}

source model.tcl;

set modelType 1;		# Assign which case model is running, 1, 2...
puts "MODEL $modelType CREATING..."

set tagModel 1;	# Do not change

set masterNodeFlag 0;	# 1 to add a single node at the base (rotation at the base), 0 if no master node at the base is required

source BTMroutines.tcl

if {$masterNodeFlag} {

	if {$modelType == 1} {
		
		source INPUT_elem_rigidBase_Model1.tcl
	
	} elseif {$modelType == 2} {
	
		source INPUT_elem_rigidBase_Model2.tcl
		
	} elseif {$modelType == 3} {
	
		source INPUT_elem_rigidBase_Model3.tcl
		
	} elseif {$modelType == 4} {
	
		source INPUT_elem_rigidBase_Model4.tcl
		
	}
	
	puts "MASTER NODE OK"
}

 #ANALYSIS --------------------------------------------------------------------------
if {$analysisType == "static"} {

	source BTMloadControlStaticAnalysis.tcl
    source dispControlStaticAnalysis.tcl;
	
} elseif {$analysisType == "dynamic"} {
    
	#source modalAnalysis.tcl
	#recorder mpco $modelScale/$EQlevel/$RSN/$MPCOdirectory/MPCO -N displacement -E globalForce localForce section.fiber.stressStrain -T nsteps 20
	recorder mpco $modelScale/$EQlevel/$RSN/$MPCOdirectory/MPCO_geometry -N displacement
	record
	#exit
	
	if {$modelType == 1} {
	
		source BTMloadControlStaticAnalysis_Model1.tcl

	} elseif {$modelType == 2} {
	
		source BTMloadControlStaticAnalysis_Model2.tcl
	
	} elseif {$modelType == 3} {
	
		source BTMloadControlStaticAnalysis_Model3.tcl
	
	} elseif {$modelType == 4} {
	
		source BTMloadControlStaticAnalysis_Model4.tcl
	
	}
	
	source "BTM_RECORDERS_nodesDisp.tcl";
	puts "Recorders CW OK"
	#record 
	
	#recorder mpco $modelScale/$EQlevel/$RSN/$MPCOdirectory/MPCO -N displacement -T nsteps 10
	#record
	#exit
	
	source modalAnalysis.tcl
	
	
	source BTMtimeHistoryAnalysis.tcl;			# Acceleration input, only orthogonal ground motions
	#source BTMtimeHistoryAnalysis_Disp.tcl		# Displacement input
	
}

puts "A N A L Y S I S   C O M P L E T E" 
set tFinish [clock seconds]
set analysisDuration [expr {$tFinish - $tStart}]
puts "analysis duration: $analysisDuration sec"
#puts "Press enter to exit..."
#set end [gets stdin line]

# Don't forget to
wipe;
