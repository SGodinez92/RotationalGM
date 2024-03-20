# Define master node
node 1 [expr 45.*$ft] [expr 45.*$ft] 0.0
lappend Nodes 1

fix 1 1 1 1 1 1 1

set tagRigid 1000000

for {set i 1} {$i <= 12} {incr i} {
	
	rigidLink beam 1 [expr 800 + $i]

}


set CW_SE_list {10140001 10140008 10140015 10140022 10140029 10140036}
set CW_SW_list {10110001 10110008 10110015 10110022 10110029 10110036}
set CW_NE_list {10150001 10150008 10150015 10150022 10150029 10150036}
set CW_NW_list {10120001 10120008 10120015 10120022 10120029 10120036}
set CW_W_list {10110001 10130008 10130015 10130022 10130029 10130036 10130043 10130050 10130057 10130064 10130071 10130078 10130085 10130092 10120001}
set CW_E_list {10140036 10160008 10160015 10160022 10160029 10160036 10160043 10160050 10160057 10160064 10160071 10160078 10160085 10160092 10150036}

# RIGID LINK SECTION --------------------------------------------------------------------------
#element elasticBeamColumn [expr 1000*$i + 100 + $nEleFloor + 1] [expr 1000*$i + 100 + $nEleFloor]		[expr 1000*$i + 100 + $nEleFloor + 1] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
set ARigid [expr 1e15];
set JRigid [expr 1e15];
set IyRigid [expr 1e17];
set IzRigid [expr 1e17];

#Define rigid links explicitly at the base of the core wall and rectangular walls 
# Core wall
set eleTag 100
set cont 1
for {set ind 1} {$ind < [llength $CW_SE_list]} {incr ind} {
	set iNode [lindex $CW_SE_list [expr $ind - 1]]
	set jNode [lindex $CW_SE_list $ind]
	element elasticBeamColumn [expr $eleTag + $cont] $iNode $jNode $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
	incr cont 1
}

set eleTag 200
set cont 1
for {set ind 1} {$ind < [llength $CW_SW_list]} {incr ind} {
	set iNode [lindex $CW_SW_list [expr $ind - 1]]
	set jNode [lindex $CW_SW_list $ind]
	element elasticBeamColumn [expr $eleTag + $cont] $iNode $jNode $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
	incr cont 1
}

set eleTag 300
set cont 1
for {set ind 1} {$ind < [llength $CW_NE_list]} {incr ind} {
	set iNode [lindex $CW_NE_list [expr $ind - 1]]
	set jNode [lindex $CW_NE_list $ind]
	element elasticBeamColumn [expr $eleTag + $cont] $iNode $jNode $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
	incr cont 1
}

set eleTag 400
set cont 1
for {set ind 1} {$ind < [llength $CW_NW_list]} {incr ind} {
	set iNode [lindex $CW_NW_list [expr $ind - 1]]
	set jNode [lindex $CW_NW_list $ind]
	element elasticBeamColumn [expr $eleTag + $cont] $iNode $jNode $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
	incr cont 1
}

set eleTag 500
set cont 1
for {set ind 1} {$ind < [llength $CW_W_list]} {incr ind} {
	set iNode [lindex $CW_W_list [expr $ind - 1]]
	set jNode [lindex $CW_W_list $ind]
	element elasticBeamColumn [expr $eleTag + $cont] $iNode $jNode $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
	incr cont 1
}

set eleTag 600
set cont 1
for {set ind 1} {$ind < [llength $CW_E_list]} {incr ind} {
	set iNode [lindex $CW_E_list [expr $ind - 1]]
	set jNode [lindex $CW_E_list $ind]
	element elasticBeamColumn [expr $eleTag + $cont] $iNode $jNode $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
	incr cont 1
}

# Connect center node tag 1 to corner of core walls
element elasticBeamColumn 11 1 10110001 $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
element elasticBeamColumn 12 1 10120001 $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
element elasticBeamColumn 13 1 10140036 $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
element elasticBeamColumn 14 1 10150036 $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig