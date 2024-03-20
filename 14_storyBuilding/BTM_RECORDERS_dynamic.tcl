
# ###################################################################################################################################################################################################
# ################################################################################ DYNAMIC ANALYSIS RECORDERS #######################################################################################
# ###################################################################################################################################################################################################

# #####SPM Recorders
setMaxOpenFiles 2048

#set dTrecord 0.04
set dTrecord 0.025

if {$modelType == 1 || $modelType == 2} {

	set spmNum 8

} elseif {$modelType == 3 || $modelType == 4} {

	set spmNum 9
	
} elseif {$modelType == 5} {

	set spmNum 10

}


for {set i 1} {$i <= $nStory} {incr i 1} {
	
	set spmTag [expr 100000 + 1000*$i]
	
	set spmFileLocal "stringPanel_local_$i.txt"
	set spmFileFlow "stringPanel_flow_$i.txt"
	#set spmFileTau "stringPanel_tau_$i.txt"
		
	recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileLocal -dT $dTrecord -eleRange [expr $spmTag + 1] [expr $spmTag + $spmNum] localForce
	recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileFlow -dT $dTrecord -eleRange [expr $spmTag + 1] [expr $spmTag + $spmNum] shearFlow
	#recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileTau -eleRange [expr $spmTag + 1] [expr $spmTag + 8] shearStress
	
}

# #####Node recorders
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_1_x.txt -time -dT $dtAnalysis -node 1801 1804 1812 1809 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_2_x.txt -time -dT $dtAnalysis -node 2801 2804 2812 2809 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_3_x.txt -time -dT $dtAnalysis -node 3801 3804 3812 3809 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_4_x.txt -time -dT $dtAnalysis -node 4801 4804 4812 4809 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_5_x.txt -time -dT $dtAnalysis -node 5801 5804 5812 5809 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_6_x.txt -time -dT $dtAnalysis -node 6801 6804 6812 6809 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_7_x.txt -time -dT $dtAnalysis -node 7801 7804 7812 7809 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_8_x.txt -time -dT $dtAnalysis -node 8801 8804 8812 8809 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_9_x.txt -time -dT $dtAnalysis -node 9801 9804 9812 9809 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_10_x.txt -time -dT $dtAnalysis -node 10801 10804 10812 10809 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_11_x.txt -time -dT $dtAnalysis -node 11801 11804 11812 11809 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_12_x.txt -time -dT $dtAnalysis -node 12801 12804 12812 12809 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_13_x.txt -time -dT $dtAnalysis -node 13801 13804 13812 13809 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_14_x.txt -time -dT $dtAnalysis -node 14801 14804 14812 14809 -dof 1 accel

recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_1_y.txt -time -dT $dtAnalysis -node 1801 1804 1812 1809 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_2_y.txt -time -dT $dtAnalysis -node 2801 2804 2812 2809 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_3_y.txt -time -dT $dtAnalysis -node 3801 3804 3812 3809 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_4_y.txt -time -dT $dtAnalysis -node 4801 4804 4812 4809 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_5_y.txt -time -dT $dtAnalysis -node 5801 5804 5812 5809 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_6_y.txt -time -dT $dtAnalysis -node 6801 6804 6812 6809 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_7_y.txt -time -dT $dtAnalysis -node 7801 7804 7812 7809 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_8_y.txt -time -dT $dtAnalysis -node 8801 8804 8812 8809 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_9_y.txt -time -dT $dtAnalysis -node 9801 9804 9812 9809 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_10_y.txt -time -dT $dtAnalysis -node 10801 10804 10812 10809 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_11_y.txt -time -dT $dtAnalysis -node 11801 11804 11812 11809 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_12_y.txt -time -dT $dtAnalysis -node 12801 12804 12812 12809 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_13_y.txt -time -dT $dtAnalysis -node 13801 13804 13812 13809 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_14_y.txt -time -dT $dtAnalysis -node 14801 14804 14812 14809 -dof 2 accel


set dispFold "Displacements"
file mkdir $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold

recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/NW_disp.txt -dT $dtAnalysis -node 809 1809 2809 3809 4809 5809 6809 7809 8809 9809 10809 11809 12809 13809 14809 -dof 1 2 disp
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/NE_disp.txt -dT $dtAnalysis -node 812 1812 2812 3812 4812 5812 6812 7812 8812 9812 10812 11812 12812 13812 14812 -dof 1 2 disp
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/SW_disp.txt -dT $dtAnalysis -node 801 1801 2801 3801 4801 5801 6801 7801 8801 9801 10801 11801 12801 13801 14801 -dof 1 2 disp
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/SE_disp.txt -dT $dtAnalysis -node 804 1804 2804 3804 4804 5804 6804 7804 8804 9804 10804 11804 12804 13804 14804 -dof 1 2 disp

recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/TopDispWe.txt -dT $dtAnalysis -node 11410006 11420006 -time -dof 1 2 disp
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/TopDispEa.txt -dT $dtAnalysis -node 11450036 11440036 -time -dof 1 2 disp

# Regions for rotations at collectors
set regTag_SW 100
set regTag_NW 101
set regTag_SE 102
set regTag_NE 103

set reg_SW {}
set reg_NW {}
set reg_SE {}
set reg_NE {}

for {set i 1} {$i <= $nStory} {incr i 1} {
	
	if {$i == 1} {
		set incZ 6
	} else {
		set incZ 5
	}
	
	set nIncCShapeX 5
	
	set nodeSW [expr 10000000 + 100000*$i + 10000 + $incZ + 1]
	set nodeNW [expr 10000000 + 100000*$i + 20000 + $incZ + 1]
	set nodeSE [expr 10000000 + 100000*$i + 40000 + ($incZ + 1)*($nIncCShapeX + 1)]
	set nodeNE [expr 10000000 + 100000*$i + 50000 + ($incZ + 1)*($nIncCShapeX + 1)]
	
	lappend reg_SW $nodeSW
	lappend reg_NW $nodeNW
	lappend reg_SE $nodeSE
	lappend reg_NE $nodeNE
	
	
}

eval region $regTag_SW -node $reg_SW
eval region $regTag_NW -node $reg_NW
eval region $regTag_SE -node $reg_SE
eval region $regTag_NE -node $reg_NE

recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/RotSW_x.txt -dT $dtAnalysis -region $regTag_SW -dof 4 disp
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/RotSW_y.txt -dT $dtAnalysis -region $regTag_SW -dof 5 disp
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/RotNW_x.txt -dT $dtAnalysis -region $regTag_NW -dof 4 disp
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/RotNW_y.txt -dT $dtAnalysis -region $regTag_NW -dof 5 disp
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/RotSE_x.txt -dT $dtAnalysis -region $regTag_SE -dof 4 disp
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/RotSE_y.txt -dT $dtAnalysis -region $regTag_SE -dof 5 disp
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/RotNE_x.txt -dT $dtAnalysis -region $regTag_NE -dof 4 disp
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/RotNE_y.txt -dT $dtAnalysis -region $regTag_NE -dof 5 disp

# #####Structural Wall recorders
# Core Walls

set CW1 "CW1"

set regCW1_SW_ver {}
set regCW1_NW_ver {}
set regCW1_WE_ver {}
set regCW1_SE_ver {}
set regCW1_NE_ver {}
set regCW1_EA_ver {}
set regCW1_SW_dia {}
set regCW1_NW_dia {}
set regCW1_WE_dia {}
set regCW1_SE_dia {}
set regCW1_NE_dia {}
set regCW1_EA_dia {}
set regCW1_SW_hor {}
set regCW1_NW_hor {}
set regCW1_WE_hor {}
set regCW1_SE_hor {}
set regCW1_NE_hor {}
set regCW1_EA_hor {}

set regCW1_SW_horSlab {}
set regCW1_NW_horSlab {}
set regCW1_WE_horSlab {}
set regCW1_SE_horSlab {}
set regCW1_NE_horSlab {}
set regCW1_EA_horSlab {}

set regCW1_NW_verRigCB {}
set regCW1_SW_verRigCB {}
set regCW1_NE_verRigCB {}
set regCW1_SE_verRigCB {}

set regCW1_NW_horRigCB {}
set regCW1_SW_horRigCB {}
set regCW1_NE_horRigCB {}
set regCW1_SE_horRigCB {}

set regTagCW1_SW_ver 1
set regTagCW1_NW_ver 2
set regTagCW1_WE_ver 3
set regTagCW1_SE_ver 4
set regTagCW1_NE_ver 5
set regTagCW1_EA_ver 6
set regTagCW1_SW_dia 7
set regTagCW1_NW_dia 8
set regTagCW1_WE_dia 9
set regTagCW1_SE_dia 10
set regTagCW1_NE_dia 11
set regTagCW1_EA_dia 12
set regTagCW1_SW_hor 13
set regTagCW1_NW_hor 14
set regTagCW1_WE_hor 15
set regTagCW1_SE_hor 16
set regTagCW1_NE_hor 17
set regTagCW1_EA_hor 18

set regTagCW1_SW_horSlab 19
set regTagCW1_NW_horSlab 20
set regTagCW1_WE_horSlab 21
set regTagCW1_SE_horSlab 22
set regTagCW1_NE_horSlab 23
set regTagCW1_EA_horSlab 24

set regTagCW1_NW_verRigCB 25
set regTagCW1_SW_verRigCB 26
set regTagCW1_NE_verRigCB 27
set regTagCW1_SE_verRigCB 28

set regTagCW1_NW_horRigCB 29
set regTagCW1_SW_horRigCB 30
set regTagCW1_NE_horRigCB 31
set regTagCW1_SE_horRigCB 32

set nIncCShapeX 5
set nIncCShapeY 14

for {set i 1} {$i <= $nStory} {incr i 1} {
	
	if {$i == 1} {
		set incZ 6
	} else {
		set incZ 5
	}
	
	set eleTagRigSoWe1 [expr 10000000 + 100000*$i + 70000 + 1]
	set eleTagRigSoWe2 [expr 10000000 + 100000*$i + 70000 + 2]
	set eleTagRigNoWe1 [expr 10000000 + 100000*$i + 80000 + 1]
	set eleTagRigNoWe2 [expr 10000000 + 100000*$i + 80000 + 2]
	set eleTagRigSoEa1 [expr 10000000 + 100000*$i + 70000 + 5]
	set eleTagRigSoEa2 [expr 10000000 + 100000*$i + 70000 + 6]
	set eleTagRigNoEa1 [expr 10000000 + 100000*$i + 80000 + 5]
	set eleTagRigNoEa2 [expr 10000000 + 100000*$i + 80000 + 6]
	
	set eleTagRigHor1SoWe [expr 10000000 + 100000*$i + 70000 + 7]
	set eleTagRigHor2SoWe [expr 10000000 + 100000*$i + 70000 + 11]
	set eleTagRigHor3SoWe [expr 10000000 + 100000*$i + 70000 + 15]
	set eleTagRigHor1NoWe [expr 10000000 + 100000*$i + 80000 + 7]
	set eleTagRigHor2NoWe [expr 10000000 + 100000*$i + 80000 + 11]
	set eleTagRigHor3NoWe [expr 10000000 + 100000*$i + 80000 + 15]
	
	set eleTagRigHor1SoEa [expr 10000000 + 100000*$i + 70000 + 10]
	set eleTagRigHor2SoEa [expr 10000000 + 100000*$i + 70000 + 14]
	set eleTagRigHor3SoEa [expr 10000000 + 100000*$i + 70000 + 18]
	set eleTagRigHor1NoEa [expr 10000000 + 100000*$i + 80000 + 10]
	set eleTagRigHor2NoEa [expr 10000000 + 100000*$i + 80000 + 14]
	set eleTagRigHor3NoEa [expr 10000000 + 100000*$i + 80000 + 18]
	
	lappend regCW1_SW_verRigCB $eleTagRigSoWe1 $eleTagRigSoWe2
	lappend regCW1_NW_verRigCB $eleTagRigNoWe1 $eleTagRigNoWe2
	lappend regCW1_SE_verRigCB $eleTagRigSoEa1 $eleTagRigSoEa2
	lappend regCW1_NE_verRigCB $eleTagRigNoEa1 $eleTagRigNoEa2
	
	lappend regCW1_NW_horRigCB $eleTagRigHor1NoWe $eleTagRigHor2NoWe $eleTagRigHor3NoWe
	lappend regCW1_SW_horRigCB $eleTagRigHor1SoWe $eleTagRigHor2SoWe $eleTagRigHor3SoWe
	lappend regCW1_NE_horRigCB $eleTagRigHor1NoEa $eleTagRigHor2NoEa $eleTagRigHor3NoEa
	lappend regCW1_SE_horRigCB $eleTagRigHor1SoEa $eleTagRigHor2SoEa $eleTagRigHor3SoEa
	
	set eleTagRigVer1SoWe [expr 10000000 + 100000*$i + 70000 + 31]
	set eleTagRigVer2SoWe [expr 10000000 + 100000*$i + 70000 + 32]
	set eleTagRigVer1SoEa [expr 10000000 + 100000*$i + 70000 + 33]
	set eleTagRigVer2SoEa [expr 10000000 + 100000*$i + 70000 + 34]
	
	set eleTagRigVer1NoWe [expr 10000000 + 100000*$i + 80000 + 31]
	set eleTagRigVer2NoWe [expr 10000000 + 100000*$i + 80000 + 32]
	set eleTagRigVer1NoEa [expr 10000000 + 100000*$i + 80000 + 33]
	set eleTagRigVer2NoEa [expr 10000000 + 100000*$i + 80000 + 34]
	
	lappend regCW1_SE_verRigWall $eleTagRigVer1SoEa $eleTagRigVer2SoEa
	lappend regCW1_SW_verRigWall $eleTagRigVer1SoWe $eleTagRigVer2SoWe
	lappend regCW1_NE_verRigWall $eleTagRigVer1NoEa $eleTagRigVer2NoEa
	lappend regCW1_NW_verRigWall $eleTagRigVer1NoWe $eleTagRigVer2NoWe
	
	#for {set verAxis 1} {$verAxis <= $nIncCShapeX} {incr verAxis} {
	#
	#	set eleTagSW [expr {10000000 + 100000*$i + 10000 + 3000 + $verAxis}]
	#	set eleTagNW [expr {10000000 + 100000*$i + 20000 + 3000 + $verAxis}]
	#	set eleTagSE [expr {10000000 + 100000*$i + 40000 + 3000 + $verAxis}]
	#	set eleTagNE [expr {10000000 + 100000*$i + 50000 + 3000 + $verAxis}]
	#	
	#	lappend regCW1_SW_horSlab $eleTagSW
	#	lappend regCW1_NW_horSlab $eleTagNW
	#	lappend regCW1_SE_horSlab $eleTagSE
	#	lappend regCW1_NE_horSlab $eleTagNE
	#	
	#}
	#
	#for {set verAxis 1} {$verAxis <= $nIncCShapeY} {incr verAxis} {
    #
	#	set eleTagWE [expr {10000000 + 100000*$i + 30000 + 3000 + $verAxis}]
	#	set eleTagEA [expr {10000000 + 100000*$i + 60000 + 3000 + $verAxis}]
	#	
	#	lappend regCW1_WE_horSlab $eleTagWE
	#	lappend regCW1_EA_horSlab $eleTagEA
	#
	#}	
    
	for {set j 1} {$j <= [expr $incZ*($nIncCShapeX + 1)]} {incr j 1} {
		set eleTagSW_ver [expr 10000000 + 100000*$i + 12000 + $j]
		set eleTagNW_ver [expr 10000000 + 100000*$i + 22000 + $j]
		set eleTagSE_ver [expr 10000000 + 100000*$i + 42000 + $j]
		set eleTagNE_ver [expr 10000000 + 100000*$i + 52000 + $j]
		
		lappend regCW1_SW_ver $eleTagSW_ver
		lappend regCW1_NW_ver $eleTagNW_ver
		lappend regCW1_SE_ver $eleTagSE_ver
		lappend regCW1_NE_ver $eleTagNE_ver		
	}
	
	for {set j $incZ} {$j < [expr $incZ*$nIncCShapeY]} {incr j 1} {
		set eleTagWE_ver [expr 10000000 + 100000*$i + 32000 + $j + 1]
		set eleTagEA_ver [expr 10000000 + 100000*$i + 62000 + $j + 1]
		
		lappend regCW1_WE_ver $eleTagWE_ver
		lappend regCW1_EA_ver $eleTagEA_ver
	}
	
	for {set j 1} {$j <= [expr $incZ*$nIncCShapeX]} {incr j 1} {
	
		set eleTagSW_hor [expr 10000000 + 100000*$i + 13000 + $j + $nIncCShapeX]
		set eleTagNW_hor [expr 10000000 + 100000*$i + 23000 + $j + $nIncCShapeX]
		set eleTagSE_hor [expr 10000000 + 100000*$i + 43000 + $j + $nIncCShapeX]
		set eleTagNE_hor [expr 10000000 + 100000*$i + 53000 + $j + $nIncCShapeX]
		
		lappend regCW1_SW_hor $eleTagSW_hor
		lappend regCW1_NW_hor $eleTagNW_hor
		lappend regCW1_SE_hor $eleTagSE_hor
		lappend regCW1_NE_hor $eleTagNE_hor
		
		if {$j > [expr ($incZ-1)*$nIncCShapeX]} {
		
			set eleTagSW_slab [expr $eleTagSW_hor + 500]
			set eleTagNW_slab [expr $eleTagNW_hor + 500]
			set eleTagSE_slab [expr $eleTagSE_hor + 500]
			set eleTagNE_slab [expr $eleTagNE_hor + 500]
		
			lappend regCW1_SW_horSlab $eleTagSW_slab
			lappend regCW1_NW_horSlab $eleTagNW_slab
			lappend regCW1_SE_horSlab $eleTagSE_slab
			lappend regCW1_NE_horSlab $eleTagNE_slab
			
		}
	}
	
	for {set j 1} {$j <= [expr $incZ*$nIncCShapeY]} {incr j 1} {
	
		set eleTagWE_hor [expr 10000000 + 100000*$i + 33000 + $j + $nIncCShapeY]
		set eleTagEA_hor [expr 10000000 + 100000*$i + 63000 + $j + $nIncCShapeY]
		
		lappend regCW1_WE_hor $eleTagWE_hor
		lappend regCW1_EA_hor $eleTagEA_hor
		
		if {$j > [expr ($incZ-1)*$nIncCShapeY]} {
		
			set eleTagWE_slab [expr $eleTagWE_hor + 500]
			set eleTagEA_slab [expr $eleTagEA_hor + 500]
		
			lappend regCW1_WE_horSlab $eleTagWE_slab
			lappend regCW1_EA_horSlab $eleTagEA_slab
			
		}
		
	}
	
	for {set j 1} {$j <= [expr $incZ*$nIncCShapeX*2.]} {incr j 1} {
	
		set eleTagSW_dia [expr 10000000 + 100000*$i + 11000 + $j]
		set eleTagNW_dia [expr 10000000 + 100000*$i + 21000 + $j]
		set eleTagSE_dia [expr 10000000 + 100000*$i + 41000 + $j]
		set eleTagNE_dia [expr 10000000 + 100000*$i + 51000 + $j]
		
		lappend regCW1_SW_dia $eleTagSW_dia
		lappend regCW1_NW_dia $eleTagNW_dia
		lappend regCW1_SE_dia $eleTagSE_dia
		lappend regCW1_NE_dia $eleTagNE_dia
	}
	
	for {set j 1} {$j <= [expr $incZ*$nIncCShapeY*2.]} {incr j 1} {
	
		set eleTagWE_dia [expr 10000000 + 100000*$i + 31000 + $j]
		set eleTagEA_dia [expr 10000000 + 100000*$i + 61000 + $j]
		
		lappend regCW1_WE_dia $eleTagWE_dia
		lappend regCW1_EA_dia $eleTagEA_dia
		
	}
}

eval region $regTagCW1_SW_ver -ele $regCW1_SW_ver
eval region $regTagCW1_NW_ver -ele $regCW1_NW_ver
eval region $regTagCW1_WE_ver -ele $regCW1_WE_ver
eval region $regTagCW1_SE_ver -ele $regCW1_SE_ver
eval region $regTagCW1_NE_ver -ele $regCW1_NE_ver
eval region $regTagCW1_EA_ver -ele $regCW1_EA_ver
eval region $regTagCW1_SW_dia -ele $regCW1_SW_dia
eval region $regTagCW1_NW_dia -ele $regCW1_NW_dia
eval region $regTagCW1_WE_dia -ele $regCW1_WE_dia
eval region $regTagCW1_SE_dia -ele $regCW1_SE_dia
eval region $regTagCW1_NE_dia -ele $regCW1_NE_dia
eval region $regTagCW1_EA_dia -ele $regCW1_EA_dia
eval region $regTagCW1_SW_hor -ele $regCW1_SW_hor
eval region $regTagCW1_NW_hor -ele $regCW1_NW_hor
eval region $regTagCW1_WE_hor -ele $regCW1_WE_hor
eval region $regTagCW1_SE_hor -ele $regCW1_SE_hor
eval region $regTagCW1_NE_hor -ele $regCW1_NE_hor
eval region $regTagCW1_EA_hor -ele $regCW1_EA_hor

eval region $regTagCW1_SW_horSlab -ele $regCW1_SW_horSlab
eval region $regTagCW1_NW_horSlab -ele $regCW1_NW_horSlab
eval region $regTagCW1_WE_horSlab -ele $regCW1_WE_horSlab
eval region $regTagCW1_SE_horSlab -ele $regCW1_SE_horSlab
eval region $regTagCW1_NE_horSlab -ele $regCW1_NE_horSlab
eval region $regTagCW1_EA_horSlab -ele $regCW1_EA_horSlab

eval region $regTagCW1_SW_verRigCB -ele $regCW1_SW_verRigCB
eval region $regTagCW1_NW_verRigCB -ele $regCW1_NW_verRigCB
eval region $regTagCW1_SE_verRigCB -ele $regCW1_SE_verRigCB
eval region $regTagCW1_NE_verRigCB -ele $regCW1_NE_verRigCB

eval region $regTagCW1_NW_horRigCB -ele $regCW1_NW_horRigCB
eval region $regTagCW1_SW_horRigCB -ele $regCW1_SW_horRigCB
eval region $regTagCW1_NE_horRigCB -ele $regCW1_NE_horRigCB
eval region $regTagCW1_SE_horRigCB -ele $regCW1_SE_horRigCB

file mkdir $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1

#CoreWall 1
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/SW_verForce.txt -dT $dTrecord -region $regTagCW1_SW_ver globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/NW_verForce.txt -dT $dTrecord -region $regTagCW1_NW_ver globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/WE_verForce.txt -dT $dTrecord -region $regTagCW1_WE_ver globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/SE_verForce.txt -dT $dTrecord -region $regTagCW1_SE_ver globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/NE_verForce.txt -dT $dTrecord -region $regTagCW1_NE_ver globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/EA_verForce.txt -dT $dTrecord -region $regTagCW1_EA_ver globalForce

recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/SW_diaForce.txt -dT $dTrecord -region $regTagCW1_SW_dia axialForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/NW_diaForce.txt -dT $dTrecord -region $regTagCW1_NW_dia axialForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/WE_diaForce.txt -dT $dTrecord -region $regTagCW1_WE_dia axialForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/SE_diaForce.txt -dT $dTrecord -region $regTagCW1_SE_dia axialForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/NE_diaForce.txt -dT $dTrecord -region $regTagCW1_NE_dia axialForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/EA_diaForce.txt -dT $dTrecord -region $regTagCW1_EA_dia axialForce

recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/SW_horForce.txt -dT $dTrecord -region $regTagCW1_SW_hor globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/NW_horForce.txt -dT $dTrecord -region $regTagCW1_NW_hor globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/WE_horForce.txt -dT $dTrecord -region $regTagCW1_WE_hor globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/SE_horForce.txt -dT $dTrecord -region $regTagCW1_SE_hor globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/NE_horForce.txt -dT $dTrecord -region $regTagCW1_NE_hor globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/EA_horForce.txt -dT $dTrecord -region $regTagCW1_EA_hor globalForce

recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/SW_verRigForce.txt -dT $dTrecord -region $regTagCW1_SW_verRigCB globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/NW_verRigForce.txt -dT $dTrecord -region $regTagCW1_NW_verRigCB globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/SE_verRigForce.txt -dT $dTrecord -region $regTagCW1_SE_verRigCB globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/NE_verRigForce.txt -dT $dTrecord -region $regTagCW1_NE_verRigCB globalForce

recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/SW_horRigForce.txt -dT $dTrecord -region $regTagCW1_SW_horRigCB globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/NW_horRigForce.txt -dT $dTrecord -region $regTagCW1_NW_horRigCB globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/SE_horRigForce.txt -dT $dTrecord -region $regTagCW1_SE_horRigCB globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/NE_horRigForce.txt -dT $dTrecord -region $regTagCW1_NE_horRigCB globalForce

recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/SW_slabForce.txt -dT $dTrecord -region $regTagCW1_SW_horSlab globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/NW_slabForce.txt -dT $dTrecord -region $regTagCW1_NW_horSlab globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/WE_slabForce.txt -dT $dTrecord -region $regTagCW1_WE_horSlab globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/SE_slabForce.txt -dT $dTrecord -region $regTagCW1_SE_horSlab globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/NE_slabForce.txt -dT $dTrecord -region $regTagCW1_NE_horSlab globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/EA_slabForce.txt -dT $dTrecord -region $regTagCW1_EA_horSlab globalForce


recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/SW_verDef.txt -dT $dTrecord -region $regTagCW1_SW_ver section 1 deformation 1
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/NW_verDef.txt -dT $dTrecord -region $regTagCW1_NW_ver section 1 deformation 1
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/WE_verDef.txt -dT $dTrecord -region $regTagCW1_WE_ver section 1 deformation 1
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/SE_verDef.txt -dT $dTrecord -region $regTagCW1_SE_ver section 1 deformation 1
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/NE_verDef.txt -dT $dTrecord -region $regTagCW1_NE_ver section 1 deformation 1
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/EA_verDef.txt -dT $dTrecord -region $regTagCW1_EA_ver section 1 deformation 1

recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/SW_diaDef.txt -dT $dTrecord -region $regTagCW1_SW_dia deformations
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/NW_diaDef.txt -dT $dTrecord -region $regTagCW1_NW_dia deformations
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/WE_diaDef.txt -dT $dTrecord -region $regTagCW1_WE_dia deformations
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/SE_diaDef.txt -dT $dTrecord -region $regTagCW1_SE_dia deformations
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/NE_diaDef.txt -dT $dTrecord -region $regTagCW1_NE_dia deformations
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/EA_diaDef.txt -dT $dTrecord -region $regTagCW1_EA_dia deformations

recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/SW_horDef.txt -dT $dTrecord -region $regTagCW1_SW_hor section 1 deformation 1
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/NW_horDef.txt -dT $dTrecord -region $regTagCW1_NW_hor section 1 deformation 1
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/WE_horDef.txt -dT $dTrecord -region $regTagCW1_WE_hor section 1 deformation 1
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/SE_horDef.txt -dT $dTrecord -region $regTagCW1_SE_hor section 1 deformation 1
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/NE_horDef.txt -dT $dTrecord -region $regTagCW1_NE_hor section 1 deformation 1
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/EA_horDef.txt -dT $dTrecord -region $regTagCW1_EA_hor section 1 deformation 1

# #####Coupling Beam recorders

set cbFold "CouplingBeams"
set defFold "Deformations"
set forceFold "Forces"

file mkdir $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold
#file mkdir $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/$defFold
#file mkdir $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/$forceFold

set regionCB1_concShor {}
set regionCB1_concNhor {}

set regionCB1_concSver {}
set regionCB1_concNver {}

set regionCB1_concSdia {}
set regionCB1_concNdia {}

set regionCB1_steelS {}
set regionCB1_steelN {}

#set regionCB1_anchSteelS {}
#set regionCB1_anchSteelN {}
#
#set regionCB1_rigidS {}
#set regionCB1_rigidN {}
#
#set regionCB1_spS {}
#set regionCB1_spN {}

for {set i 1} {$i <= $nStory} {incr i 1} {
	
	for {set j 8} {$j <= 17} {incr j 1} {
	
	if {$j == 10 || $j == 11 || $j == 14 || $j == 15} {
	} else {
	
		set eleTag1S [expr 10000000 + 100000*$i + 70000 + $j]
		set eleTag1N [expr 10000000 + 100000*$i + 80000 + $j]
		
		lappend regionCB1_concShor $eleTag1S
		lappend regionCB1_concNhor $eleTag1N
		
	}
	}
	
	for {set j 3} {$j <= 4} {incr j 1} {
	
		set eleTag1S [expr 10000000 + 100000*$i + 70000 + $j]
		set eleTag1N [expr 10000000 + 100000*$i + 80000 + $j]
		
		lappend regionCB1_concSver $eleTag1S
		lappend regionCB1_concNver $eleTag1N
		
	}
	
	for {set j 19} {$j <= 26} {incr j 1} {
	
		set eleTag1S [expr 10000000 + 100000*$i + 70000 + $j]
		set eleTag1N [expr 10000000 + 100000*$i + 80000 + $j]
		
		lappend regionCB1_concSdia $eleTag1S
		lappend regionCB1_concNdia $eleTag1N
		
	}
	

	for {set j 19} {$j <= 25} {incr j 1} {
	
	if {$j == 20 || $j == 21 || $j == 23} {
	} else {
		
		set eleTag1S [expr 10000000 + 100000*$i + 70500 + $j]
		set eleTag1N [expr 10000000 + 100000*$i + 80500 + $j]
	
		lappend regionCB1_steelS $eleTag1S
		lappend regionCB1_steelN $eleTag1N
	}
	}
	
	## anchorage steel
	#if {$i == 1} {
	#
	#	lappend regionCB1_anchSteelS [expr 10000000 + 100000*$i + 70505]
	#	lappend regionCB1_anchSteelS [expr 10000000 + 100000*$i + 70506]
	#	lappend regionCB1_anchSteelN [expr 10000000 + 100000*$i + 80505]
	#	lappend regionCB1_anchSteelN [expr 10000000 + 100000*$i + 80506]
	#
	#} else {
	#
	#	lappend regionCB1_anchSteelS [expr 10000000 + 100000*$i + 70505]
	#	lappend regionCB1_anchSteelS [expr 10000000 + 100000*$i + 70506]
	#	lappend regionCB1_anchSteelS [expr 10000000 + 100000*$i + 70507]
	#	lappend regionCB1_anchSteelS [expr 10000000 + 100000*$i + 70508]
	#	lappend regionCB1_anchSteelN [expr 10000000 + 100000*$i + 80505]
	#	lappend regionCB1_anchSteelN [expr 10000000 + 100000*$i + 80506]
	#	lappend regionCB1_anchSteelN [expr 10000000 + 100000*$i + 80507]
	#	lappend regionCB1_anchSteelN [expr 10000000 + 100000*$i + 80508]
	#
	#}
	#
	## rigid elements for anchorage steel
	#if {$i == 1} {
	#
	#	for {set j 31} {$j <= 34} {incr j 1} {
	#	
	#		set eleTag1S [expr 10000000 + 100000*$i + 70000 + $j]
	#		set eleTag1N [expr 10000000 + 100000*$i + 80000 + $j]
	#
	#		lappend regionCB1_rigidS $eleTag1S
	#		lappend regionCB1_rigidN $eleTag1N
	#	
	#	}
	#
	#} else {
	#
	#	for {set j 31} {$j <= 38} {incr j 1} {
	#	
	#		set eleTag1S [expr 10000000 + 100000*$i + 70000 + $j]
	#		set eleTag1N [expr 10000000 + 100000*$i + 80000 + $j]
	#
	#		lappend regionCB1_rigidS $eleTag1S
	#		lappend regionCB1_rigidN $eleTag1N
	#	
	#	}
	#
	#}
	#
	## strain penetration
	#if {$i == 1} {
	#
	#	for {set j 509} {$j <= 510} {incr j 1} {
	#	
	#		set eleTag1S [expr 10000000 + 100000*$i + 70000 + $j]
	#		set eleTag1N [expr 10000000 + 100000*$i + 80000 + $j]
	#
	#		lappend regionCB1_spS $eleTag1S
	#		lappend regionCB1_spN $eleTag1N
	#	
	#	}
	#
	#} else {
	#
	#	for {set j 509} {$j <= 512} {incr j 1} {
	#	
	#		set eleTag1S [expr 10000000 + 100000*$i + 70000 + $j]
	#		set eleTag1N [expr 10000000 + 100000*$i + 80000 + $j]
	#
	#		lappend regionCB1_spS $eleTag1S
	#		lappend regionCB1_spN $eleTag1N
	#	
	#	}
	#
	#}
	
}

eval region 46 -ele $regionCB1_concShor
eval region 47 -ele $regionCB1_concNhor

eval region 48 -ele $regionCB1_concSdia
eval region 49 -ele $regionCB1_concNdia

eval region 50 -ele $regionCB1_steelS
eval region 51 -ele $regionCB1_steelN

eval region 52 -ele $regionCB1_concSver
eval region 53 -ele $regionCB1_concNver

#eval region 54 -ele $regionCB1_anchSteelS
#eval region 55 -ele $regionCB1_anchSteelN
#
#eval region 56 -ele $regionCB1_rigidS
#eval region 57 -ele $regionCB1_rigidN
#
#eval region 58 -ele $regionCB1_spS
#eval region 59 -ele $regionCB1_spN

recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1_Shor.txt -dT $dTrecord -region 46 globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1_Nhor.txt -dT $dTrecord -region 47 globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1_Sdia.txt -dT $dTrecord -region 48 axialForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1_Ndia.txt -dT $dTrecord -region 49 axialForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1_steelS.txt -dT $dTrecord -region 50 axialForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1_steelN.txt -dT $dTrecord -region 51 axialForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1_Sver.txt -dT $dTrecord -region 52 globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1_Nver.txt -dT $dTrecord -region 53 globalForce

#recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1_steelAnchS.txt -dT $dTrecord -region 54 axialForce
#recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1_steelAnchN.txt -dT $dTrecord -region 55 axialForce
#recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1_rigidAnchS.txt -dT $dTrecord -region 56 globalForce
#recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1_rigidAnchN.txt -dT $dTrecord -region 57 globalForce
#recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1_spS.txt -dT $dTrecord -region 58 force
#recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1_spN.txt -dT $dTrecord -region 59 force

recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1disp_Shor.txt -dT $dTrecord -region 46 section 1 deformation 1
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1disp_Nhor.txt -dT $dTrecord -region 47 section 1 deformation 1
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1disp_Sdia.txt -dT $dTrecord -region 48 deformations
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1disp_Ndia.txt -dT $dTrecord -region 49 deformations
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1disp_steelS.txt -dT $dTrecord -region 50 deformations
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1disp_steelN.txt -dT $dTrecord -region 51 deformations
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1disp_Sver.txt -dT $dTrecord -region 52 section 1 deformation 1
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1disp_Nver.txt -dT $dTrecord -region 53 section 1 deformation 1

#recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1disp_steelAnchS.txt -dT $dTrecord -region 54 deformations
#recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1disp_steelAnchN.txt -dT $dTrecord -region 55 deformations
#recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1disp_spS.txt -dT $dTrecord -region 58 deformation
#recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1disp_spN.txt -dT $dTrecord -region 59 deformation

# #recorder mpco $modelScale/$EQlevel/$RSN/$MPCOdirectory/MPCO -N displacement rotation reactionForce reactionMoment -E globalForce localForce force section.fiber.stressStrain section.force section.deformation
#recorder mpco $modelScale/$EQlevel/$RSN/$MPCOdirectory/MPCO -N displacement -E globalForce localForce section.fiber.stressStrain -T nsteps 20