# Core Wall for OpenSeesSPM.exe
# Sergio Godinez, Fall 2022

# main

#close stderr
set dispflag 0

set path ""
set pathT $path; append pathT $modelScale/$EQlevel/$RSN/Results
set outputDir $pathT

set void [catch {file delete -force {*}[glob $pathT*]}];		#Deletes existing Results folder
set tryfile 1
while {[catch {file mkdir $outputDir}] && $tryfile <= 1000} {incr tryfile};	#Creates Results directory

#set nStory 14;			#Total number of storys (including basements if any)

set pathT $path; append pathT units.tcl;		source $pathT;
set pathT $path; append pathT BTMcoreWall.tcl;	source $pathT;	#Includes procedure called "BTMcoreWall" to model Core Wall using BTM

# Core Wall Geometry and discretization for BTM
set lCshapeX 114.;	#Distance of extreme vertical elements of C shape wall in the x direction (flange) 
set lCshapeY 288.;	#Distance of extreme vertical elements of C shape wall in the y direction (web)

set lCB 84.;		#Length of the coupling beam
set sCshape 108.;	#Distance in between flanges (from boundary element centroid to boundary element centroid)

set storyElev {0.0}

for {set i 1} {$i <= $nStory} {incr i 1} {
	
	set H [lindex $storyH $i];
	
	set ind [expr $i - 1]
	set elev [lindex $storyElev $ind]
	set elev [expr $elev + $H]
	
	lappend storyElev $elev
}

#set recInputH [open $outputDir/height.txt a+];	#a+ at the end creates the file if it doesn't already exists
#puts $recInputH "storyElev $storyElev"

if {$modelType == 2 || $modelType == 4} {

	set xo 372.;	# X coordinate of southwest corner of CW
	set yo 396.;	# Y coordinate of southwest corner of CW

} elseif {$modelType == 1 || $modelType == 3} {
	
	set xo 288.;	# X coordinate of southwest corner of CW
	set yo 396.;	# Y coordinate of southwest corner of CW

}

set inputFileCW1 "inputCW1.txt"

set NodesCW {}

#proc coreWallBTM {story outputDir materials sections nStory path hPier hPanel nIncPierZ nIncCShapeZbelow xo yo zo CWtag}
for {set i 0} {$i < $nStory} {incr i 1} {
	set story [expr $i + 1]
	
	if {$tagModel == 1} {
		if {$i == 0} {
			set hPier 163.625
			set hPanel 28.375
		} else {
			set hPier 115.625
			set hPanel 28.375
		}
	}
	
	if {$i == 0} {
		set nIncPierZ 5;	# UPDATE IN INPUT_BTMspm.tcl IF CHANGED HERE
	} else {
		set nIncPierZ 4;
	}
	
	if {$i == 1} {
		set nIncCShapeZbelow 6
	} else {
		set nIncCShapeZbelow 5
	}
	
	if {$i == 0} {
		set nIncCShapeZbelow 0
	}
	
	#proc coreWallBTM {story outputDir materials sections nStory path hPier hPanel nIncPierZ nIncCShapeZbelow xo yo zo CWtag ModelFile Nodes inputFile}
	
	if {$story <= 5} {
			append NodesCW { } [coreWallBTM $story $outputDir BTMmaterials_28_6 BTMsections_28_6 $nStory $path $hPier $hPanel $nIncPierZ $nIncCShapeZbelow $xo $yo [lindex $storyElev $i] 1 $ModelFile $Nodes $inputFileCW1 $tagModel $modelType]
	} else {
			append NodesCW { } [coreWallBTM $story $outputDir BTMmaterials_24_6 BTMsections_24_6 $nStory $path $hPier $hPanel $nIncPierZ $nIncCShapeZbelow $xo $yo [lindex $storyElev $i] 1 $ModelFile $Nodes $inputFileCW1 $tagModel $modelType]
	}
	
}

puts "BTM part of the model: done!"

set inputNodesCW1 "nodesCW.txt"
set nodesCWdir [open $outputDir/$inputNodesCW1 a+];

for {set i 1} {$i <= [llength $NodesCW]} {incr i} {
	set nodeTag [lindex $NodesCW [expr $i - 1]]
	set nodeCrd [nodeCoord $nodeTag]
	#puts "set nodeTag [lindex $Nodes [expr $i - 1]]"
	#puts "set nodeCrd [nodeCoord $nodeTag]"
	puts $nodesCWdir "$nodeTag $nodeCrd"
}


#puts "A N A L Y S I S   C O M P L E T E" 
#set tFinish [clock seconds]
#set analysisDuration [expr {$tFinish - $tStart}]
#puts "analysis duration: $analysisDuration sec"
#puts "Press enter to exit..."
#set end [gets stdin line]