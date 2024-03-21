
# Define master node
node 1 [expr $x0 + 294.*$ft/2] [expr $y0 + 168.*$ft/2] 0.0
lappend Nodes 1

# Define master node for CW
node 10 [expr $x0 + 159.*$ft] [expr $y0 + 132.*$ft] 0.0
lappend Nodes 10

# Define master node for RecX
node 20 [expr $x0 + 234.*$ft] [expr $y0 + 26.*$ft] 0.0
lappend Nodes 10

# Define master node for RecY1
node 30 [expr $x0 + 50.*$ft] [expr $y0 + 132.*$ft] 0.0
lappend Nodes 10

# Define master node for RecY2
node 40 [expr $x0 + 272.*$ft] [expr $y0 + 132.*$ft] 0.0
lappend Nodes 10

fix 10 1 1 1 1 1 1
fix 20 1 1 1 1 1 1
fix 30 1 1 1 1 1 1
fix 40 1 1 1 1 1 1
fix 1 1 1 1 1 1 1

set tagRigid 1000000

for {set i 1} {$i <= 94} {incr i} {
	
	rigidLink beam 1 [expr 800 + $i]

}

set RecX_list {30100001 30100005 30100009 30100013 30100017 30100021 30100025}
set RecY1_list {40100001 40100005 40100009 40100013 40100017 40100021 40100025}
set RecY2_list {50100001 50100005 50100009 50100013 50100017 50100021 50100025}
set CW_SE_list {10140001 10140006 10140011 10140016 10140021 10140026}
set CW_SW_list {10110001 10110006 10110011 10110016 10110021 10110026}
set CW_NE_list {10150001 10150006 10150011 10150016 10150021 10150026}
set CW_NW_list {10120001 10120006 10120011 10120016 10120021 10120026}
#set CW_W_list {10130006 10130011 10130016 10130021 10130026 10130031 10130036 10130041 10130046 10130051 10130056 10130061 10130066}
set CW_W_list {10110001 10130006 10130011 10130016 10130021 10130026 10130031 10130036 10130041 10130046 10130051 10130056 10130061 10130066 10120001}
#set CW_E_list {10160006 10160011 10160016 10160021 10160026 10160031 10160036 10160041 10160046 10160051 10160056 10160061 10160066}
set CW_E_list {10140026 10160006 10160011 10160016 10160021 10160026 10160031 10160036 10160041 10160046 10160051 10160056 10160061 10160066 10150026}

# RIGID LINK SECTION --------------------------------------------------------------------------
#element elasticBeamColumn [expr 1000*$i + 100 + $nEleFloor + 1] [expr 1000*$i + 100 + $nEleFloor]		[expr 1000*$i + 100 + $nEleFloor + 1] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
set ARigid [expr 1e13];
set JRigid [expr 1e15];
set IyRigid [expr 1e15];
set IzRigid [expr 1e15];

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

set eleTag 350
set cont 1
for {set ind 1} {$ind < [llength $CW_W_list]} {incr ind} {
	set iNode [lindex $CW_W_list [expr $ind - 1]]
	set jNode [lindex $CW_W_list $ind]
	element elasticBeamColumn [expr $eleTag + $cont] $iNode $jNode $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
	incr cont 1
}

set eleTag 450
set cont 1
for {set ind 1} {$ind < [llength $CW_W_list]} {incr ind} {
	set iNode [lindex $CW_E_list [expr $ind - 1]]
	set jNode [lindex $CW_E_list $ind]
	element elasticBeamColumn [expr $eleTag + $cont] $iNode $jNode $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
	incr cont 1
}

# Connect center node tag 10 to corner of core walls
element elasticBeamColumn 11 10 10110001 $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
element elasticBeamColumn 12 10 10120001 $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
element elasticBeamColumn 13 10 10140026 $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
element elasticBeamColumn 14 10 10150026 $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig


# RecWalls
set eleTag 500
set cont 1
for {set ind 1} {$ind < [llength $RecX_list]} {incr ind} {
	set iNode [lindex $RecX_list [expr $ind - 1]]
	set jNode [lindex $RecX_list $ind]
	element elasticBeamColumn [expr $eleTag + $cont] $iNode $jNode $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
	incr cont 1
}

set eleTag 600
set cont 1
for {set ind 1} {$ind < [llength $RecY1_list]} {incr ind} {
	set iNode [lindex $RecY1_list [expr $ind - 1]]
	set jNode [lindex $RecY1_list $ind]
	element elasticBeamColumn [expr $eleTag + $cont] $iNode $jNode $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
	incr cont 1
}

set eleTag 700
set cont 1
for {set ind 1} {$ind < [llength $RecY2_list]} {incr ind} {
	set iNode [lindex $RecY2_list [expr $ind - 1]]
	set jNode [lindex $RecY2_list $ind]
	element elasticBeamColumn [expr $eleTag + $cont] $iNode $jNode $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
	incr cont 1
}

# Fix edge of recWalls
#fix 30100001 1 1 1 1 1 1
#fix 40100001 1 1 1 1 1 1
#fix 50100001 1 1 1 1 1 1

# Rigid link to center of core wall and edge of rec walls
rigidLink beam 1 10
rigidLink beam 1 20
rigidLink beam 1 30
rigidLink beam 1 40
#rigidLink beam 1 30100001
#rigidLink beam 1 40100001
#rigidLink beam 1 50100001

# Connect center node tag to corner of rec walls
element elasticBeamColumn 21 20 30100001 $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
element elasticBeamColumn 22 20 30100025 $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig

element elasticBeamColumn 31 30 40100001 $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
element elasticBeamColumn 32 30 40100025 $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig

element elasticBeamColumn 41 40 50100001 $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
element elasticBeamColumn 42 40 50100025 $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig

#for {set ind 0} {$ind < [llength $RecX_list]} {incr ind} {
#	rigidLink beam 1 [lindex $RecX_list $ind]
#}
#
#
#for {set ind 0} {$ind < [llength $RecX_list]} {incr ind} {
#	rigidLink beam 1 [lindex $RecX_list $ind]
#}
#
#for {set ind 0} {$ind < [llength $RecY1_list]} {incr ind} {
#	rigidLink beam 1 [lindex $RecY1_list $ind]
#}
#
#for {set ind 0} {$ind < [llength $RecY2_list]} {incr ind} {
#	rigidLink beam 1 [lindex $RecY2_list $ind]
#}
#
#for {set ind 0} {$ind < [llength $CW_SE_list]} {incr ind} {
#	rigidLink beam 1 [lindex $CW_SE_list $ind]
#}
#
#for {set ind 0} {$ind < [llength $CW_SW_list]} {incr ind} {
#	rigidLink beam 1 [lindex $CW_SW_list $ind]
#}
#
#for {set ind 0} {$ind < [llength $CW_NE_list]} {incr ind} {
#	rigidLink beam 1 [lindex $CW_NE_list $ind]
#}
#
#for {set ind 0} {$ind < [llength $CW_NW_list]} {incr ind} {
#	rigidLink beam 1 [lindex $CW_NW_list $ind]
#}
#
#for {set ind 0} {$ind < [llength $CW_W_list]} {incr ind} {
#	rigidLink beam 1 [lindex $CW_W_list $ind]
#}
#
#for {set ind 0} {$ind < [llength $CW_E_list]} {incr ind} {
#	rigidLink beam 1 [lindex $CW_E_list $ind]
#}