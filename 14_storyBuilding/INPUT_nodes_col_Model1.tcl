
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
	node [expr $nodeTag + 2] [expr 24.*$ft] 0.0 $z
	node [expr $nodeTag + 3] [expr 52.*$ft] 0.0 $z
	node [expr $nodeTag + 4] [expr 83.*$ft] 0.0 $z
	
	node [expr $nodeTag + 5] 0.0 			[expr 33.*$ft] $z
	node [expr $nodeTag + 6] [expr 83.*$ft] [expr 33.*$ft] $z
	
	node [expr $nodeTag + 7] 0.0 			[expr 57.*$ft] $z
	node [expr $nodeTag + 8] [expr 83.*$ft] [expr 57.*$ft] $z
	
	node [expr $nodeTag +  9] 0.0 			 [expr 84.*$ft] $z
	node [expr $nodeTag + 10] [expr 24.*$ft] [expr 84.*$ft] $z
	node [expr $nodeTag + 11] [expr 52.*$ft] [expr 84.*$ft] $z
	node [expr $nodeTag + 12] [expr 83.*$ft] [expr 84.*$ft] $z
	
	node [expr $nodeTag + 13] [expr 24.*$ft] [expr -21.*$ft] $z
	node [expr $nodeTag + 14] [expr 52.*$ft] [expr -21.*$ft] $z
	
	node [expr $nodeTag + 15] [expr 105.5*$ft] [expr 33.*$ft] $z
	node [expr $nodeTag + 16] [expr 105.5*$ft] [expr 57.*$ft] $z
	
	puts $ModelFile "node [expr $nodeTag + 1] 0.0 			0.0 $z"
	puts $ModelFile "node [expr $nodeTag + 2] [expr 24.*$ft] 0.0 $z"
	puts $ModelFile "node [expr $nodeTag + 3] [expr 52.*$ft] 0.0 $z"
	puts $ModelFile "node [expr $nodeTag + 4] [expr 83.*$ft] 0.0 $z"
	puts $ModelFile "node [expr $nodeTag + 5] 0.0 			[expr 33.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 6] [expr 83.*$ft] [expr 33.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 7] 0.0 			[expr 57.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 8] [expr 83.*$ft] [expr 57.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag +  9] 0.0 			 [expr 84.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 10] [expr 24.*$ft] [expr 84.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 11] [expr 52.*$ft] [expr 84.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 12] [expr 83.*$ft] [expr 84.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 13] [expr 24.*$ft] [expr -21.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 14] [expr 52.*$ft] [expr -21.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 15] [expr 105.5*$ft] [expr 33.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 16] [expr 105.5*$ft] [expr 57.*$ft] $z"
	
	for {set j 1} {$j <= 16} {incr j 1} {
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