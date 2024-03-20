
# MASS ASSIGNMENT -----------------------------------------------------------------------------------------

# Column mass
for {set i 3} {$i < $nStory} {incr i} {
	
	if {$i == $nStory} {
	
		mass [expr 1000*$i + 800 +  1] [expr 28.*$in*28.*$in*6.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*6.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 +  2] [expr 28.*$in*28.*$in*6.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*6.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 +  3] [expr 28.*$in*28.*$in*6.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*6.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 +  4] [expr 28.*$in*28.*$in*6.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*6.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 +  5] [expr 28.*$in*28.*$in*6.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*6.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 +  6] [expr 28.*$in*28.*$in*6.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*6.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 +  7] [expr 28.*$in*28.*$in*6.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*6.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 +  8] [expr 28.*$in*28.*$in*6.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*6.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 +  9] [expr 28.*$in*28.*$in*6.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*6.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 10] [expr 28.*$in*28.*$in*6.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*6.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 11] [expr 28.*$in*28.*$in*6.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*6.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 12] [expr 28.*$in*28.*$in*6.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*6.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		mass [expr 1000*$i + 800 + 13] [expr 20.*$in*20.*$in*6.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*6.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 14] [expr 20.*$in*20.*$in*6.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*6.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 15] [expr 20.*$in*20.*$in*6.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*6.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 16] [expr 20.*$in*20.*$in*6.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*6.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
	} elseif {$i == 1} {
		
		mass [expr 1000*$i + 800 +  1] [expr 28.*$in*28.*$in*14.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*14.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 +  2] [expr 28.*$in*28.*$in*14.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*14.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 +  3] [expr 28.*$in*28.*$in*14.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*14.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 +  4] [expr 28.*$in*28.*$in*14.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*14.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 +  5] [expr 28.*$in*28.*$in*14.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*14.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 +  6] [expr 28.*$in*28.*$in*14.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*14.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 +  7] [expr 28.*$in*28.*$in*14.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*14.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 +  8] [expr 28.*$in*28.*$in*14.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*14.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 +  9] [expr 28.*$in*28.*$in*14.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*14.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 10] [expr 28.*$in*28.*$in*14.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*14.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 11] [expr 28.*$in*28.*$in*14.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*14.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 12] [expr 28.*$in*28.*$in*14.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*14.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		mass [expr 1000*$i + 800 + 13] [expr 20.*$in*20.*$in*14.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*14.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 14] [expr 20.*$in*20.*$in*14.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*14.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 15] [expr 20.*$in*20.*$in*14.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*14.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 16] [expr 20.*$in*20.*$in*14.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*14.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
	
	} else {
	
		mass [expr 1000*$i + 800 +  1] [expr 28.*$in*28.*$in*12.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 +  2] [expr 28.*$in*28.*$in*12.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 +  3] [expr 28.*$in*28.*$in*12.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 +  4] [expr 28.*$in*28.*$in*12.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 +  5] [expr 28.*$in*28.*$in*12.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 +  6] [expr 28.*$in*28.*$in*12.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 +  7] [expr 28.*$in*28.*$in*12.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 +  8] [expr 28.*$in*28.*$in*12.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 +  9] [expr 28.*$in*28.*$in*12.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 10] [expr 28.*$in*28.*$in*12.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 11] [expr 28.*$in*28.*$in*12.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 12] [expr 28.*$in*28.*$in*12.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		mass [expr 1000*$i + 800 + 13] [expr 20.*$in*20.*$in*12.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*12.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 14] [expr 20.*$in*20.*$in*12.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*12.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 15] [expr 20.*$in*20.*$in*12.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*12.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 16] [expr 20.*$in*20.*$in*12.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*12.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
	}
}