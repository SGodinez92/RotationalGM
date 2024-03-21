
# ###################################################################################################################################################################################################
# ################################################################################ DYNAMIC ANALYSIS RECORDERS #######################################################################################
# ###################################################################################################################################################################################################

# #####SPM Recorders
setMaxOpenFiles 2048

#set dTrecord 0.04
set dTrecord 0.02

set dispFoldCW "DisplacementsCW"
file mkdir $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFoldCW

set regTag_nodesCW 1000

eval region $regTag_nodesCW -node $NodesCW

recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFoldCW/CWx.txt -dT $dTrecord -time -region $regTag_nodesCW -dof 1 disp
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFoldCW/CWy.txt -dT $dTrecord -time -region $regTag_nodesCW -dof 2 disp
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFoldCW/CWz.txt -dT $dTrecord -time -region $regTag_nodesCW -dof 3 disp