# r3.3
# Don't forget to
wipe;

set tStart [clock seconds]

# DEFINE MODEL ----------------------------------------------------------------------
set modelScale "HR_NoRotation_KHMN_withoutFaultAllignment";			# "Scaled" or "Unscaled" design

set RSN "KHMN";						# RSN of ground motion

set EQlevel "MCEr";					# Do not change

set masterNodeFlag 0;	# 1 to add a single node at the base, 0 if no master node at the base is required. 1 is required to include the rotational ground motions.

set BTMflag 1

source model.tcl;

set x0 0.0
set y0 0.0

puts "Creating BTM model"
source BTMroutines.tcl

puts "Error, chose BTMflag 1 or BTMflag 0"
exit

if {$masterNodeFlag} {
	source INPUT_elem_rigidBase.tcl
	puts "MASTER NODE OK"
}


 #ANALYSIS --------------------------------------------------------------------------
source BTMloadControlStaticAnalysis.tcl
	
source modalAnalysis.tcl
	
source "BTM_RECORDERS_nodesDisp.tcl";
puts "Recorders CW OK"
record
#exit

source BTMtimeHistoryAnalysis.tcl;			# Run time history analysis with only horizontal ground motion acceleration records
#source BTMtimeHistoryAnalysis_Disp.tcl;	# Run time history analysis with displacement records of translational and rotational components

#recorder mpco $modelScale/$EQlevel/$RSN/$MPCOdirectory/MPCO -N displacement -E section.fiber.stressStrain -T nsteps 20
#recorder mpco $modelScale/$EQlevel/$RSN/$MPCOdirectory/MPCO -N displacement -E force globalForce localForce
#recorder mpco $modelScale/$EQlevel/$RSN/$MPCOdirectory/modes -N modesOfVibration
record


puts "A N A L Y S I S   C O M P L E T E" 
set tFinish [clock seconds]
set analysisDuration [expr {$tFinish - $tStart}]
puts "analysis duration: $analysisDuration sec"
#puts "Press enter to exit..."
#set end [gets stdin line]

# Don't forget to
wipe;