
# All columns nodes

set z 0.; # Current node height

for {set i 0} {$i <= $nStory} {incr i 1} {

	if {$i == 0} {
	} else {
		set H [lindex $storyH $i]; # H = storyH(i)
		set z [expr $z + $H]; # z = z + H
	}
	
	set nodeTag [expr 1000*$i + 800]
	
	node [expr $nodeTag + 1] 0.0 			0.0 $z
	node [expr $nodeTag + 2] [expr 31.*$ft] 0.0 $z
	node [expr $nodeTag + 3] [expr 59.*$ft] 0.0 $z
	node [expr $nodeTag + 4] [expr 90.*$ft] 0.0 $z
	
	node [expr $nodeTag + 5] 0.0 			[expr 33.*$ft] $z
	node [expr $nodeTag + 6] [expr 90.*$ft] [expr 33.*$ft] $z
	
	node [expr $nodeTag + 7] 0.0 			[expr 57.*$ft] $z
	node [expr $nodeTag + 8] [expr 90.*$ft] [expr 57.*$ft] $z
	
	node [expr $nodeTag +  9] 0.0 			 [expr 83.*$ft + 9.*$in] $z
	node [expr $nodeTag + 10] [expr 31.*$ft] [expr 83.*$ft + 9.*$in] $z
	node [expr $nodeTag + 11] [expr 59.*$ft] [expr 83.*$ft + 9.*$in] $z
	node [expr $nodeTag + 12] [expr 90.*$ft] [expr 83.*$ft + 9.*$in] $z
	
	node [expr $nodeTag + 13] [expr 31.*$ft] [expr -20.*$ft] $z
	node [expr $nodeTag + 14] [expr 59.*$ft] [expr -20.*$ft] $z
	
	puts $ModelFile "node [expr $nodeTag + 1] 0.0 			0.0 $z"
	puts $ModelFile "node [expr $nodeTag + 2] [expr 31.*$ft] 0.0 $z"
	puts $ModelFile "node [expr $nodeTag + 3] [expr 59.*$ft] 0.0 $z"
	puts $ModelFile "node [expr $nodeTag + 4] [expr 90.*$ft] 0.0 $z"
	puts $ModelFile "node [expr $nodeTag + 5] 0.0 			[expr 33.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 6] [expr 90.*$ft] [expr 33.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 7] 0.0 			[expr 57.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 8] [expr 90.*$ft] [expr 57.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag +  9] 0.0 			 [expr 83.*$ft + 9.*$in] $z"
	puts $ModelFile "node [expr $nodeTag + 10] [expr 31.*$ft] [expr 83.*$ft + 9.*$in] $z"
	puts $ModelFile "node [expr $nodeTag + 11] [expr 59.*$ft] [expr 83.*$ft + 9.*$in] $z"
	puts $ModelFile "node [expr $nodeTag + 12] [expr 90.*$ft] [expr 83.*$ft + 9.*$in] $z"
	puts $ModelFile "node [expr $nodeTag + 13] [expr 31.*$ft] [expr -20.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 14] [expr 59.*$ft] [expr -20.*$ft] $z"
	
	for {set j 1} {$j <= 14} {incr j 1} {
		if {$i == 0} {
			if {$masterNodeFlag} {
			} else {
				fix [expr $nodeTag + $j] 1 1 1 1 1 1
			}
			lappend Nodes [expr $nodeTag + $j]
		} else {
			lappend Nodes [expr $nodeTag + $j]
		}
	}
	
}