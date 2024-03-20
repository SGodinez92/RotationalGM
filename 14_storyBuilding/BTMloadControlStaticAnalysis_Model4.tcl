
# ################################################################################################################
# ######################################## GRAVITY ANALYSIS ######################################################
# ################################################################################################################

# Columns loads
set patternTagGravity 1

#pattern Plain $patternTag $tsTag <-fact $cFactor> {
#load...
#eleLoad...
#sp...
#...
#}

set liveFac	0.20;			#Percentage of live load used

#load $nodeTag (ndf $LoadValues)

# Shell loads (applied to columns as point loads)
pattern Plain $patternTagGravity "Linear" {
	for {set i 1} {$i <= $nStory} {incr i 1} {

		set thickness [expr 8.*$in]
		
		set w_DL [expr 40.*$psf]
		set w_LL [expr 40.*$psf]
		
		set w_SL [expr $thickness*150.*$pcf]
		set w_SDL [expr $w_DL + $w_SL]
		
		set w_tot [expr $w_SDL + $w_LL*$liveFac]
		
		# Column loads
		load [expr 1000*$i + 800 +  1] 0. 0. [expr -$w_tot*$ft*$ft*255.75] 0. 0. 0.
		load [expr 1000*$i + 800 +  2] 0. 0. [expr -$w_tot*$ft*$ft*486.75] 0. 0. 0.
		load [expr 1000*$i + 800 +  3] 0. 0. [expr -$w_tot*$ft*$ft*486.75] 0. 0. 0.
		load [expr 1000*$i + 800 +  4] 0. 0. [expr -$w_tot*$ft*$ft*255.75] 0. 0. 0.
		load [expr 1000*$i + 800 +  5] 0. 0. [expr -$w_tot*$ft*$ft*441.75] 0. 0. 0.
		load [expr 1000*$i + 800 +  6] 0. 0. [expr -$w_tot*$ft*$ft*441.75] 0. 0. 0.
		load [expr 1000*$i + 800 +  7] 0. 0. [expr -$w_tot*$ft*$ft*441.75] 0. 0. 0.
		load [expr 1000*$i + 800 +  8] 0. 0. [expr -$w_tot*$ft*$ft*441.75] 0. 0. 0.
		load [expr 1000*$i + 800 +  9] 0. 0. [expr -$w_tot*$ft*$ft*255.75] 0. 0. 0.
		load [expr 1000*$i + 800 + 10] 0. 0. [expr -$w_tot*$ft*$ft*486.75] 0. 0. 0.
		load [expr 1000*$i + 800 + 11] 0. 0. [expr -$w_tot*$ft*$ft*486.75] 0. 0. 0.
		load [expr 1000*$i + 800 + 12] 0. 0. [expr -$w_tot*$ft*$ft*255.75] 0. 0. 0.
	}
}
incr patternTagGravity 1


# Column loads
pattern Plain $patternTagGravity "Linear" {
	for {set i 1} {$i < [expr $nStory - 1]} {incr i} {
	
		load [expr 1000*$i + 800 +  1] 0. 0. [expr -28.*$in*28.*$in*12.*$ft*150.*$pcf] 0. 0. 0.
		load [expr 1000*$i + 800 +  2] 0. 0. [expr -28.*$in*28.*$in*12.*$ft*150.*$pcf] 0. 0. 0.
		load [expr 1000*$i + 800 +  3] 0. 0. [expr -28.*$in*28.*$in*12.*$ft*150.*$pcf] 0. 0. 0.
		load [expr 1000*$i + 800 +  4] 0. 0. [expr -28.*$in*28.*$in*12.*$ft*150.*$pcf] 0. 0. 0.
		load [expr 1000*$i + 800 +  5] 0. 0. [expr -28.*$in*28.*$in*12.*$ft*150.*$pcf] 0. 0. 0.
		load [expr 1000*$i + 800 +  6] 0. 0. [expr -28.*$in*28.*$in*12.*$ft*150.*$pcf] 0. 0. 0.
		load [expr 1000*$i + 800 +  7] 0. 0. [expr -28.*$in*28.*$in*12.*$ft*150.*$pcf] 0. 0. 0.
		load [expr 1000*$i + 800 +  8] 0. 0. [expr -28.*$in*28.*$in*12.*$ft*150.*$pcf] 0. 0. 0.
		load [expr 1000*$i + 800 +  9] 0. 0. [expr -28.*$in*28.*$in*12.*$ft*150.*$pcf] 0. 0. 0.
		load [expr 1000*$i + 800 + 10] 0. 0. [expr -28.*$in*28.*$in*12.*$ft*150.*$pcf] 0. 0. 0.
		load [expr 1000*$i + 800 + 11] 0. 0. [expr -28.*$in*28.*$in*12.*$ft*150.*$pcf] 0. 0. 0.
		load [expr 1000*$i + 800 + 12] 0. 0. [expr -28.*$in*28.*$in*12.*$ft*150.*$pcf] 0. 0. 0.

		
	}
}
incr patternTagGravity 1



# Input PT forces

if {0} {
if {$PT == "Yes"} {

	source INPUT_PT_forcesBTM.tcl

}
}

source loadControl.tcl