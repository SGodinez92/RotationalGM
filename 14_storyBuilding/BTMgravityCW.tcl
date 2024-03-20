# gravity
if {$dispflag} {puts "\ngravity story$story"}; puts $recInput "\ngravity story$story"

set liveFac 0.20;

set thickness [expr 8.*$in]

set w_DL [expr 40.*$psf]

set w_LL [expr 40.*$psf]


set gama_conc [expr 150.*$pcf]

set w_SL [expr $thickness*$gama_conc]
set w_SDL [expr $w_DL + $w_SL]

set w_tot [expr $w_SDL + $w_LL*$liveFac]

set w_slab4 [expr 4.*$gama_conc]
set w_int [expr {$w_slab4 + 20.*$psf + $liveFac*100.*$psf}]

# Tributary areas
if {$modelType == 1 || $modelType == 2} {
	#component flanges
	set wl_cx_nw [expr {$w_tot*33.*$ft/2. + $w_int*24.*$ft/2.}];
	set wl_cx_sw [expr {$w_tot*33.*$ft/2. + $w_int*24.*$ft/2.}];
	set wl_cx_ne [expr {$w_tot*33.*$ft/2. + $w_int*24.*$ft/2.}];
	set wl_cx_se [expr {$w_tot*33.*$ft/2. + $w_int*24.*$ft/2.}];
	
	#component webs
	set wl_cy_we [expr {$w_tot*31.*$ft/2.}];	#Web
	set wl_cy_ea [expr {$w_tot*31.*$ft/2.}];	#Web
	
	#Corners
	set AcornNW [expr {198.*186.}];	#Northwest corner
	set AcornNE [expr {198.*186.}]; #Northeast corner
	set AcornSE [expr {198.*186.}];	#Southeast corner
	set AcornSW [expr {198.*186.}];	#Southwest corner

} elseif {$modelType == 3} {
	#component flanges
	set wl_cx_nw [expr {$w_tot*(26.*$ft+9.*$in)/2. + $w_int*24.*$ft/2.}];
	set wl_cx_sw [expr {$w_tot*33.*$ft/2. + $w_int*24.*$ft/2.}];
	set wl_cx_ne [expr {$w_tot*(26.*$ft+9.*$in)/2. + $w_int*24.*$ft/2.}];
	set wl_cx_se [expr {$w_tot*33.*$ft/2. + $w_int*24.*$ft/2.}];
	
	#component webs
	set wl_cy_we [expr {$w_tot*31.*$ft/2.}];	#Web
	set wl_cy_ea [expr {$w_tot*31.*$ft/2.}];	#Web
	
	#Corners
	set AcornNW [expr {160.5*186.}];	#Northwest corner
	set AcornNE [expr {160.5*186.}]; #Northeast corner
	set AcornSE [expr {198.*186.}];	#Southeast corner
	set AcornSW [expr {198.*186.}];	#Southwest corner

} elseif {$modelType == 4} {
	#component flanges
	set wl_cx_nw [expr {$w_tot*33.*$ft/2. + $w_int*24.*$ft/2.}];
	set wl_cx_sw [expr {$w_tot*33.*$ft/2. + $w_int*24.*$ft/2.}];
	set wl_cx_ne [expr {$w_tot*33.*$ft/2. + $w_int*24.*$ft/2.}];
	set wl_cx_se [expr {$w_tot*33.*$ft/2. + $w_int*24.*$ft/2.}];
	
	#component webs
	set wl_cy_we [expr {$w_tot*24.*$ft/2.}];	#Web
	set wl_cy_ea [expr {$w_tot*32.*$ft/2.}];	#Web
	
	#Corners
	set AcornNW [expr {198.*144.}];	#Northwest corner
	set AcornNE [expr {198.*192.}]; #Northeast corner
	set AcornSE [expr {198.*192.}];	#Southeast corner
	set AcornSW [expr {198.*144.}];	#Southwest corner

} elseif {$modelType == 5} {
	#component flanges
	set wl_cx_nw [expr {$w_tot*27.*$ft/2. + $w_int*24.*$ft/2.}];
	set wl_cx_sw [expr {$w_tot*33.*$ft/2. + $w_int*24.*$ft/2.}];
	set wl_cx_ne [expr {$w_tot*27.*$ft/2. + $w_int*24.*$ft/2.}];
	set wl_cx_se [expr {$w_tot*33.*$ft/2. + $w_int*24.*$ft/2.}];
	
	#component webs
	set wl_cy_we [expr {$w_tot*24.*$ft/2.}];	#Web
	set wl_cy_ea [expr {$w_tot*31.*$ft/2.}];	#Web
	
	#Corners
	set AcornNW [expr {162.*144.}];	#Northwest corner
	set AcornNE [expr {162.*186.}]; #Northeast corner
	set AcornSE [expr {198.*186.}];	#Southeast corner
	set AcornSW [expr {198.*144.}];	#Southwest corner
}

set PcornNW [expr $w_tot*$AcornNW]
set PcornNE [expr $w_tot*$AcornNE]
set PcornSE [expr $w_tot*$AcornSE]
set PcornSW [expr $w_tot*$AcornSW]

# self
set wself_wall [expr {$tWall*$lCshapeZ*$gama_conc}]
set wself_cb [expr {$tWall*$hBeam*$gama_conc}]

# tributary lengths slab
set LtribSlab_cx_cornx [expr {$incCshapeX/2.}]
set LtribSlab_cx_corny [expr {$incCshapeY/2.}]
set LtribSlab_cx_field $incCshapeX
set LtribSlab_cx_flang [expr {$incCshapeX/2. + ($sCshape-$lCB)/4.}]

set LtribSlab_cy_field $incCshapeY

#set LtribSlab_cb_cent $incHCB
#set LtribSlab_cb_edge [expr {($sCshape-$lCB)/4. + $incHCB/2.}]
set LtribSlab_cb_edge [expr {($sCshape-$lCB)/4. + $incHCB}]

# tributary lengths self
set LtribSelf_cx_corn [expr {$tWall/2. + $incCshapeX/2.}]
set LtribSelf_cx_field $incCshapeX
set LtribSelf_cx_flang [expr {$incCshapeX/2. + ($sCshape-$lCB)/2.}]

set LtribSelf_cy_adj [expr {$incCshapeY - $tWall/2. + $incCshapeY/2.}]
set LtribSelf_cy_field $incCshapeY

#set LtribSelf_cb_cent $incHCB
#set LtribSelf_cb_edge [expr {$incHCB/2.}]
set LtribSelf_cb_edge $incHCB

# loads corners
set P_cx_cornNW [expr {$PcornNW + $LtribSlab_cx_cornx*$wl_cx_nw + $LtribSlab_cx_corny*$wl_cy_we + $LtribSelf_cx_corn*$wself_wall}]
set P_cx_cornNE [expr {$PcornNE + $LtribSlab_cx_cornx*$wl_cx_ne + $LtribSlab_cx_corny*$wl_cy_ea + $LtribSelf_cx_corn*$wself_wall}]
set P_cx_cornSE [expr {$PcornSE + $LtribSlab_cx_cornx*$wl_cx_se + $LtribSlab_cx_corny*$wl_cy_we + $LtribSelf_cx_corn*$wself_wall}]
set P_cx_cornSW [expr {$PcornSW + $LtribSlab_cx_cornx*$wl_cx_sw + $LtribSlab_cx_corny*$wl_cy_ea + $LtribSelf_cx_corn*$wself_wall}]

# loads south flanges
set P_cx_field_se [expr {$LtribSlab_cx_field*$wl_cx_se + $LtribSelf_cx_field*$wself_wall}]
set P_cx_flang_se [expr {$LtribSlab_cx_flang*$wl_cx_se + $LtribSelf_cx_flang*$wself_wall}]

set P_cx_field_sw [expr {$LtribSlab_cx_field*$wl_cx_sw + $LtribSelf_cx_field*$wself_wall}]
set P_cx_flang_sw [expr {$LtribSlab_cx_flang*$wl_cx_sw + $LtribSelf_cx_flang*$wself_wall}]

# loads north flanges
set P_cx_field_ne [expr {$LtribSlab_cx_field*$wl_cx_ne + $LtribSelf_cx_field*$wself_wall}]
set P_cx_flang_ne [expr {$LtribSlab_cx_flang*$wl_cx_ne + $LtribSelf_cx_flang*$wself_wall}]

set P_cx_field_nw [expr {$LtribSlab_cx_field*$wl_cx_nw + $LtribSelf_cx_field*$wself_wall}]
set P_cx_flang_nw [expr {$LtribSlab_cx_flang*$wl_cx_nw + $LtribSelf_cx_flang*$wself_wall}]

# loads west webs
set P_cy_adj_w   [expr {$LtribSlab_cy_field*$wl_cy_we + $LtribSelf_cy_adj*$wself_wall}]
set P_cy_field_w [expr {$LtribSlab_cy_field*$wl_cy_we + $LtribSelf_cy_field*$wself_wall}]

# loads east webs
set P_cy_adj_e   [expr {$LtribSlab_cy_field*$wl_cy_ea + $LtribSelf_cy_adj*$wself_wall}]
set P_cy_field_e [expr {$LtribSlab_cy_field*$wl_cy_ea + $LtribSelf_cy_field*$wself_wall}]

# loads CB north
#set P_cb_cent_n [expr {$LtribSlab_cb_cent*$wl_cx + $LtribSelf_cb_cent*$wself_cb}]
set P_cb_edge_n [expr {$LtribSlab_cb_edge*($wl_cx_nw + $wl_cx_ne)/2. + $LtribSelf_cb_edge*$wself_cb}]

# loads CB south
#set P_cb_cent_s [expr {$LtribSlab_cb_cent*$wl_cx + $LtribSelf_cb_cent*$wself_cb}]
set P_cb_edge_s [expr {$LtribSlab_cb_edge*($wl_cx_sw + $wl_cx_se)/2. + $LtribSelf_cb_edge*$wself_cb}]


set patternTag [expr 100*$CWtag + $story]

pattern Plain $patternTag "Linear" { 

	load [expr {$coreWallTag + $compSoWeTag + ($nIncCShapeZ+1)}] 0 0 -$P_cx_cornSW 0 0 0
	
	for {set verAxis 2} {$verAxis <= $nIncCShapeX} {incr verAxis} {
		load [expr {$coreWallTag + $compSoWeTag + ($nIncCShapeZ+1)*$verAxis}] 0 0 -$P_cx_field_sw 0 0 0
	}
	
	load [expr {$coreWallTag + $compSoWeTag + ($nIncCShapeZ+1)*($nIncCShapeX+1)}] 0 0 -$P_cx_flang_sw 0 0 0
	#
	load [expr {$coreWallTag + $compNoWeTag + ($nIncCShapeZ+1)}] 0 0 -$P_cx_cornNW 0 0 0
	
	for {set verAxis 2} {$verAxis <= $nIncCShapeX} {incr verAxis} {
		load [expr {$coreWallTag + $compNoWeTag + ($nIncCShapeZ+1)*$verAxis}] 0 0 -$P_cx_field_nw 0 0 0
	}
	
	load [expr {$coreWallTag + $compNoWeTag + ($nIncCShapeZ+1)*($nIncCShapeX+1)}] 0 0 -$P_cx_flang_nw 0 0 0
	#
	load [expr {$coreWallTag + $compWeTag + ($nIncCShapeZ+1)*2}] 0 0 -$P_cy_adj_w 0 0 0
	
	for {set verAxis 3} {$verAxis <= [expr {$nIncCShapeY - 1}]} {incr verAxis} {
		load [expr {$coreWallTag + $compWeTag + ($nIncCShapeZ+1)*$verAxis}] 0 0 -$P_cy_field_w 0 0 0
	}
	
	load [expr {$coreWallTag + $compWeTag + ($nIncCShapeZ+1)*$nIncCShapeY}] 0 0 -$P_cy_adj_w 0 0 0
	load [expr {$coreWallTag + $compSoEaTag + ($nIncCShapeZ+1)}] 0 0 -$P_cx_flang_se 0 0 0
	
	for {set verAxis 2} {$verAxis <= $nIncCShapeX} {incr verAxis} {
		load [expr {$coreWallTag + $compSoEaTag + ($nIncCShapeZ+1)*$verAxis}] 0 0 -$P_cx_field_se 0 0 0
	}
	
	load [expr {$coreWallTag + $compSoEaTag + ($nIncCShapeZ+1)*($nIncCShapeX+1)}] 0 0 -$P_cx_cornSE 0 0 0
	#
	load [expr {$coreWallTag + $compNoEaTag + ($nIncCShapeZ+1)}] 0 0 -$P_cx_flang_ne 0 0 0
	
	for {set verAxis 2} {$verAxis <= $nIncCShapeX} {incr verAxis} {
		load [expr {$coreWallTag + $compNoEaTag + ($nIncCShapeZ+1)*$verAxis}] 0 0 -$P_cx_field_ne 0 0 0
	}
	
	load [expr {$coreWallTag + $compNoEaTag + ($nIncCShapeZ+1)*($nIncCShapeX+1)}] 0 0 -$P_cx_cornNE 0 0 0
	#
	load [expr {$coreWallTag + $compEaTag + ($nIncCShapeZ+1)*2}] 0 0 -$P_cy_adj_e 0 0 0
	
	for {set verAxis 3} {$verAxis <= [expr {$nIncCShapeY - 1}]} {incr verAxis} {
		load [expr {$coreWallTag + $compEaTag + ($nIncCShapeZ+1)*$verAxis}] 0 0 -$P_cy_field_e 0 0 0
	}
	
	load [expr {$coreWallTag + $compEaTag + ($nIncCShapeZ+1)*$nIncCShapeY}] 0 0 -$P_cy_adj_e 0 0 0
	
	load [expr {$coreWallTag + $cbSoTag + 6}]  0 0 -$P_cb_edge_s 0 0 0
	#load [expr {$coreWallTag + $cbSoTag + 9}]  0 0 -$P_cb_cent_s 0 0 0
	load [expr {$coreWallTag + $cbSoTag + 12}] 0 0 -$P_cb_edge_s 0 0 0
	
	load [expr {$coreWallTag + $cbNoTag + 6}]  0 0 -$P_cb_edge_n 0 0 0
	#load [expr {$coreWallTag + $cbNoTag + 9}]  0 0 -$P_cb_cent_n 0 0 0
	load [expr {$coreWallTag + $cbNoTag + 12}] 0 0 -$P_cb_edge_n 0 0 0
  
}

puts $recInput "load [expr {$coreWallTag + $compSoWeTag + ($nIncCShapeZ+1)}] 0 0 -$P_cx_cornSW 0 0 0"
for {set verAxis 2} {$verAxis <= $nIncCShapeX} {incr verAxis} {
  puts $recInput "load [expr {$coreWallTag + $compSoWeTag + ($nIncCShapeZ+1)*$verAxis}] 0 0 -$P_cx_field_sw 0 0 0"
}
puts $recInput "load [expr {$coreWallTag + $compSoWeTag + ($nIncCShapeZ+1)*($nIncCShapeX+1)}] 0 0 -$P_cx_flang_sw 0 0 0"
#
puts $recInput "load [expr {$coreWallTag + $compNoWeTag + ($nIncCShapeZ+1)}] 0 0 -$P_cx_cornNW 0 0 0"
for {set verAxis 2} {$verAxis <= $nIncCShapeX} {incr verAxis} {
  puts $recInput "load [expr {$coreWallTag + $compNoWeTag + ($nIncCShapeZ+1)*$verAxis}] 0 0 -$P_cx_field_nw 0 0 0"
}
puts $recInput "load [expr {$coreWallTag + $compNoWeTag + ($nIncCShapeZ+1)*($nIncCShapeX+1)}] 0 0 -$P_cx_flang_nw 0 0 0"
#
puts $recInput "load [expr {$coreWallTag + $compWeTag + ($nIncCShapeZ+1)*2}] 0 0 -$P_cy_adj_w 0 0 0"
for {set verAxis 3} {$verAxis <= [expr {$nIncCShapeY - 1}]} {incr verAxis} {
  puts $recInput "load [expr {$coreWallTag + $compWeTag + ($nIncCShapeZ+1)*$verAxis}] 0 0 -$P_cy_field_w 0 0 0"
}
puts $recInput "load [expr {$coreWallTag + $compWeTag + ($nIncCShapeZ+1)*$nIncCShapeY}] 0 0 -$P_cy_adj_w 0 0 0"


puts $recInput "load [expr {$coreWallTag + $compSoEaTag + ($nIncCShapeZ+1)}] 0 0 -$P_cx_flang_se 0 0 0"
for {set verAxis 2} {$verAxis <= $nIncCShapeX} {incr verAxis} {
  puts $recInput "load [expr {$coreWallTag + $compSoEaTag + ($nIncCShapeZ+1)*$verAxis}] 0 0 -$P_cx_field_se 0 0 0"
}
puts $recInput "load [expr {$coreWallTag + $compSoEaTag + ($nIncCShapeZ+1)*($nIncCShapeX+1)}] 0 0 -$P_cx_cornSE 0 0 0"
#
puts $recInput "load [expr {$coreWallTag + $compNoEaTag + ($nIncCShapeZ+1)}] 0 0 -$P_cx_flang_ne 0 0 0"
for {set verAxis 2} {$verAxis <= $nIncCShapeX} {incr verAxis} {
  puts $recInput "load [expr {$coreWallTag + $compNoEaTag + ($nIncCShapeZ+1)*$verAxis}] 0 0 -$P_cx_field_ne 0 0 0"
}
puts $recInput "load [expr {$coreWallTag + $compNoEaTag + ($nIncCShapeZ+1)*($nIncCShapeX+1)}] 0 0 -$P_cx_cornNE 0 0 0"
#
puts $recInput "load [expr {$coreWallTag + $compEaTag + ($nIncCShapeZ+1)*2}] 0 0 -$P_cy_adj_e 0 0 0"
for {set verAxis 3} {$verAxis <= [expr {$nIncCShapeY - 1}]} {incr verAxis} {
  puts $recInput "load [expr {$coreWallTag + $compEaTag + ($nIncCShapeZ+1)*$verAxis}] 0 0 -$P_cy_field_e 0 0 0"
}
puts $recInput "load [expr {$coreWallTag + $compEaTag + ($nIncCShapeZ+1)*$nIncCShapeY}] 0 0 -$P_cy_adj_e 0 0 0"


puts $recInput "load [expr {$coreWallTag + $cbSoTag + 6}]  0 0 -$P_cb_edge_s 0 0 0"
#puts $recInput "load [expr {$coreWallTag + $cbSoTag + 9}]  0 0 -$P_cb_cent_s 0 0 0"
puts $recInput "load [expr {$coreWallTag + $cbSoTag + 12}] 0 0 -$P_cb_edge_s 0 0 0"
#
puts $recInput "load [expr {$coreWallTag + $cbNoTag + 6}]  0 0 -$P_cb_edge_n 0 0 0"
#puts $recInput "load [expr {$coreWallTag + $cbNoTag + 9}]  0 0 -$P_cb_cent_n 0 0 0"
puts $recInput "load [expr {$coreWallTag + $cbNoTag + 12}] 0 0 -$P_cb_edge_n 0 0 0"
