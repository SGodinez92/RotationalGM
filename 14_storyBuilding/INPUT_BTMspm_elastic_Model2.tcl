
 ############################# Stringer-Panel #######################################
 
#set Ec6	[expr 33000.*pow(0.140 + 6./1000,1.5)*sqrt(6.)*$ksi];	# Young's Modulus of Concrete 6 ksi

set Ec6	[expr 33000.*pow(0.140 + 7.8/1000,1.5)*sqrt(7.8)*$ksi];	# Young's Modulus of Concrete 6 ksi

set nuc 0.2
set stiffFacPan 0.5
set stiffFacStr 0.5

set compSoWeTag 10000;
set compNoWeTag 20000;
set compSoEaTag 40000;
set compNoEaTag 50000;

set nIncCShapeX 5;

for {set i 1} {$i <= $nStory} {incr i 1} {
	
	set Ec [expr $stiffFacPan*$Ec6]
	set thickness [expr 8.*$in]
	
	set string33 [expr $thickness*33.*$ft/2]
	set string33_CB [expr $thickness*33.*$ft/2]
	set string31 [expr $thickness*31.*$ft/2]
	set string31_Wall [expr $thickness*31.*$ft/2]
	set string28 [expr $thickness*28.*$ft/2]
	set string24 [expr $thickness*24.*$ft/2]
	
	set string26_CB [expr $thickness*(26.*$ft+9.*$in)/2]
	set string26 [expr $thickness*(26.*$ft+9.*$in)/2]
	set string20 [expr $thickness*20.*$ft/2]
	
	set w_DL [expr 40.*$psf]
	set w_tot [expr $w_DL + 150.*$pcf*$thickness]
	set rho [expr $w_tot/$g]

	set eleTag [expr 100000 + 1000*$i]
	set nodeTag [expr 1000*$i + 800]
	
	if {$i == 1} {
		set nIncZ 6;	# UPDATE FROM BTMcoreWall.tcl
	} else {
		set nIncZ 5;
	}
	
	set coreWallTag [expr {10000000 + 100000*$i}];
	
	set nodeTagSWe [expr $coreWallTag + $compSoWeTag + $nIncZ + 1]
	set nodeTagNWe [expr $coreWallTag + $compNoWeTag + $nIncZ + 1]
	set nodeTagSEa [expr $coreWallTag + $compSoEaTag + ($nIncZ + 1)*($nIncCShapeX + 1)]
	set nodeTagNEa [expr $coreWallTag + $compNoEaTag + ($nIncZ + 1)*($nIncCShapeX + 1)]
	
	element StringPanelLin [expr $eleTag + 1] [expr $nodeTag + 13] [expr $nodeTag + 14] [expr $nodeTag + 3] [expr $nodeTag + 2]	$string20 $string28 $string20 $string28 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
	
	element StringPanelLin [expr $eleTag + 2] [expr $nodeTag + 1] [expr $nodeTag + 2] [expr  $nodeTagSWe] [expr $nodeTag + 5]	$string33 $string31 $string33 $string31 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
	element StringPanelLin [expr $eleTag + 3] [expr $nodeTag + 2] [expr $nodeTag + 3] [expr  $nodeTagSEa] [expr  $nodeTagSWe]	$string33 $string28 $string33_CB $string28 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
	element StringPanelLin [expr $eleTag + 4] [expr $nodeTag + 3] [expr $nodeTag + 4] [expr $nodeTag + 6] [expr  $nodeTagSEa]	$string33 $string31 $string33 $string31 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
	
	element StringPanelLin [expr $eleTag + 5] [expr $nodeTag + 5] [expr  $nodeTagSWe] [expr  $nodeTagNWe] [expr $nodeTag + 7]	$string24 $string31_Wall $string24 $string31 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
	element StringPanelLin [expr $eleTag + 6] [expr  $nodeTagSEa] [expr $nodeTag + 6] [expr $nodeTag + 8] [expr  $nodeTagNEa]	$string24 $string31 $string24 $string31_Wall $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
	
	element StringPanelLin [expr $eleTag + 7] [expr $nodeTag + 7] [expr  $nodeTagNWe] [expr $nodeTag + 10] [expr $nodeTag + 9]	$string26 $string31 $string26 $string31 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
	element StringPanelLin [expr $eleTag + 8] [expr  $nodeTagNWe] [expr  $nodeTagNEa] [expr $nodeTag + 11] [expr $nodeTag + 10]	$string26_CB $string28 $string26 $string28 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
	element StringPanelLin [expr $eleTag + 9] [expr  $nodeTagNEa] [expr $nodeTag + 8] [expr $nodeTag + 12] [expr $nodeTag + 11]	$string26 $string31 $string26 $string31 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho		

}

for {set i 1} {$i <= $nStory} {incr i 1} {
	
	set Ec [expr $stiffFacPan*$Ec6]
	set thickness [expr 8.*$in]
	
	set w_DL [expr 40.*$psf]
	set w_tot [expr $w_DL + 150.*$pcf*$thickness]
	set rho [expr $w_tot/$g]

	set eleTag [expr 100000 + 1000*$i]
	set nodeTag [expr 1000*$i + 800]
	
	if {$i == 1} {
		set nIncZ 6;	# UPDATE FROM BTMcoreWall.tcl
	} else {
		set nIncZ 5;
	}
	
	set coreWallTag [expr {10000000 + 100000*$i}];
	
	set nodeTagSWe [expr $coreWallTag + $compSoWeTag + $nIncZ + 1]
	set nodeTagNWe [expr $coreWallTag + $compNoWeTag + $nIncZ + 1]
	set nodeTagSEa [expr $coreWallTag + $compSoEaTag + ($nIncZ + 1)*($nIncCShapeX + 1)]
	set nodeTagNEa [expr $coreWallTag + $compNoEaTag + ($nIncZ + 1)*($nIncCShapeX + 1)]
	
	puts $ModelFile "element StringPanelLin [expr $eleTag + 1] [expr $nodeTag + 13] [expr $nodeTag + 14] [expr $nodeTag + 3] [expr $nodeTag + 2]	$string20 $string28 $string20 $string28 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho"
	puts $ModelFile "element StringPanelLin [expr $eleTag + 2] [expr $nodeTag + 1] [expr $nodeTag + 2] [expr  $nodeTagSWe] [expr $nodeTag + 5]	$string33 $string31 $string33 $string31 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho"
	puts $ModelFile "element StringPanelLin [expr $eleTag + 3] [expr $nodeTag + 2] [expr $nodeTag + 3] [expr  $nodeTagSEa] [expr  $nodeTagSWe]	$string33 $string28 $string33_CB $string28 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho"
	puts $ModelFile "element StringPanelLin [expr $eleTag + 4] [expr $nodeTag + 3] [expr $nodeTag + 4] [expr $nodeTag + 6] [expr  $nodeTagSEa]	$string33 $string31 $string33 $string31 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho	"
	puts $ModelFile "element StringPanelLin [expr $eleTag + 5] [expr $nodeTag + 5] [expr  $nodeTagSWe] [expr  $nodeTagNWe] [expr $nodeTag + 7]	$string24 $string31_Wall $string24 $string31 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho"
	puts $ModelFile "element StringPanelLin [expr $eleTag + 6] [expr  $nodeTagSEa] [expr $nodeTag + 6] [expr $nodeTag + 8] [expr  $nodeTagNEa]	$string24 $string31 $string24 $string31_Wall $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho"
	puts $ModelFile "element StringPanelLin [expr $eleTag + 7] [expr $nodeTag + 7] [expr  $nodeTagNWe] [expr $nodeTag + 10] [expr $nodeTag + 9]	$string26 $string31 $string26 $string31 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho"
	puts $ModelFile "element StringPanelLin [expr $eleTag + 8] [expr  $nodeTagNWe] [expr  $nodeTagNEa] [expr $nodeTag + 11] [expr $nodeTag + 10]	$string26_CB $string28 $string26 $string28 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho"
	puts $ModelFile "element StringPanelLin [expr $eleTag + 9] [expr  $nodeTagNEa] [expr $nodeTag + 8] [expr $nodeTag + 12] [expr $nodeTag + 11]	$string26 $string31 $string26 $string31 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho"

}