# ##############################################################################################
# 						       STRINGER-PANEL METHOD RESEARCH                                  #
#						                Spring 2022                                            #
# ##############################################################################################

# r3.3
# Don't forget to
wipe;

set tStart [clock seconds]

# DEFINE MODEL ----------------------------------------------------------------------
set modelScale "BTM_PT_ElasticSPM_r33_dt01_Rotation";			# Folder name

set RSN "KHMN";						# RSN of ground motion

set EQlevel "MCEr";					# MCEr or SLE

if {$EQlevel != "MCEr" && $EQlevel != "SLE"} {
	
	puts "Choose either MCEr or SLE"
	end

}


set PT "Yes";				# "Yes" do not change
set SPMelastic "Yes";		# "Yes" do not change

set masterNodeFlag 1;	# 1 to add a single node at the base (rotation at the base), 0 if no master node at the base is required

set BTMflag 1;	# Do not change

source model.tcl;

set x0 0.0
set y0 0.0

puts "Creating BTM model"
source BTMroutines.tcl
	
if {$masterNodeFlag} {
	source INPUT_elem_rigidBase.tcl
	puts "MASTER NODE OK"
}


 #ANALYSIS --------------------------------------------------------------------------
if {$BTMflag} {
	#BTM
	#recorder mpco $modelScale/$EQlevel/$RSN/$MPCOdirectory/MPCO -N displacement
	#record
	#end

	#source modalAnalysis.tcl
	
	#source modalAnalysis.tcl
	
	#recorder mpco $modelScale/$EQlevel/$RSN/$MPCOdirectory/MPCO -N displacement
	#record

	source BTMloadControlStaticAnalysis.tcl
	
	#recorder mpco $modelScale/$EQlevel/$RSN/$MPCOdirectory/MPCO -N displacement -T nsteps 40
	#recorder mpco $modelScale/$EQlevel/$RSN/$MPCOdirectory/MPCO -N displacement -E section.fiber.stressStrain -T nsteps 20
	#record
	
	#end
	
	#source modalAnalysis.tcl
	
	source "BTM_RECORDERS_nodesDisp.tcl";
	puts "Recorders CW OK"
	#record
	#exit
	
	#source BTMtimeHistoryAnalysis.tcl;		# Acceleration input, horizontal only
	source BTMtimeHistoryAnalysis_Disp.tcl;	# Displacement input, horizontal and rotation

} else {

if {$analysisType == "static"} {

    source loadControlStaticAnalysis.tcl;
    source dispControlStaticAnalysis.tcl;
	
} elseif {$analysisType == "dynamic"} {

	#source modalAnalysis.tcl
	source loadControlStaticAnalysis.tcl;
    source modalAnalysis.tcl
	
	#recorder mpco $modelScale/$EQlevel/$RSN/$MPCOdirectory/MPCO -N displacement -E section.fiber.stressStrain -T nsteps 20
	recorder mpco $modelScale/$EQlevel/$RSN/$MPCOdirectory/MPCO -N displacement -E force globalForce localForce
	#recorder mpco $modelScale/$EQlevel/$RSN/$MPCOdirectory/modes -N modesOfVibration
	record
	#exit
    source timeHistoryAnalysis.tcl;
}
}

puts "A N A L Y S I S   C O M P L E T E" 
set tFinish [clock seconds]
set analysisDuration [expr {$tFinish - $tStart}]
puts "analysis duration: $analysisDuration sec"
#puts "Press enter to exit..."
#set end [gets stdin line]

# Don't forget to
wipe;