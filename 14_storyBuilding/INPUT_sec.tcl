
set secTag 1

# Rebar area
set Adb6	[expr $pi*pow((0.75),2)/4.]
set Adb7	[expr $pi*pow((0.875),2)/4.]
set Adb8	[expr $pi*pow((1.0),2)/4.]
set Adb9	[expr $pi*pow((1.128),2)/4.]
set Adb10	[expr $pi*pow((1.27),2)/4.]
set Adb11	[expr $pi*pow((1.41),2)/4.]

# COUPLING BEAM SECTIONS --------------------------------------------------------------------------

# ################################
# Col 20x20 6 ksi
set C20_6ksi $secTag
incr secTag 1

set Ec_col	$EcWall6;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set Gc_col 	[expr $Ec_col/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set dim [expr 20*$in]
set Jcol [expr 0.141*pow($dim,4)]
set cover [expr 1.*$in]

section Fiber $C20_6ksi -GJ [expr $Gc_col*$Jcol*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

patch rect $unconfinedConc6 8 2 [expr -$dim/2.] [expr -$dim/2.] [expr $dim/2.] [expr -$dim/2. + $cover]
patch rect $unconfinedConc6 8 2 [expr -$dim/2.] [expr $dim/2. - $cover] [expr $dim/2.] [expr $dim/2.]
patch rect $unconfinedConc6 2 6 [expr -$dim/2.] [expr -$dim/2. + $cover] [expr -$dim/2. + $cover] [expr $dim/2. - $cover]
patch rect $unconfinedConc6 2 6 [expr $dim/2. - $cover] [expr -$dim/2. + $cover] [expr $dim/2.] [expr $dim/2. - $cover]

patch rect $confinedConcCol12_20 9 9 [expr -$dim/2. + $cover] [expr -$dim/2. + $cover] [expr $dim/2. - $cover] [expr $dim/2. - $cover]

layer straight $SteelMatTag 4 $Adb7 [expr -$dim/2. + 2.] [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr -$dim/2. + 2.]
layer straight $SteelMatTag 4 $Adb7 [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.]
layer straight $SteelMatTag 2 $Adb7 [expr -$dim/2. + 2.] -3. [expr -$dim/2. + 2.] 3.
layer straight $SteelMatTag 2 $Adb7 [expr $dim/2. - 2.] -3. [expr $dim/2. - 2.] 3.

}

# ################################################
# COUPLING BEAM 32x42 (1-5)
set CB32x42 $secTag
incr secTag 1

set EcCB	$EcWall6;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcCB 	[expr $EcCB/(2.0*(1.0+$nuc))];							# Shear Modulus of Concrete
set J_CB 	[expr pow(32.*$in,4)*42.*$in*0.175]

section Fiber $CB32x42 -GJ [expr $GcCB*$J_CB*$fGJ] {
#fiber $yLoc $zLoc $A $matTag

#Equivalent concrete fiber
fiber 0 0 [expr 0.769*32.*$in*42.*$in] $confinedConcCB

#Steel diagonal reinforcement fiber
fiber 0 0 [expr 12.*$Adb11] $SteelMatTag
}

# COUPLING BEAM 24x42 (6-9)
set CB24x42_1 $secTag
incr secTag 1

set EcCB	$EcWall6;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcCB 	[expr $EcCB/(2.0*(1.0+$nuc))];							# Shear Modulus of Concrete
set J_CB 	[expr pow(24.*$in,4)*42.*$in*0.2125]

section Fiber $CB24x42_1 -GJ [expr $GcCB*$J_CB*$fGJ] {
#fiber $yLoc $zLoc $A $matTag

#Equivalent concrete fiber
fiber 0 0 [expr 0.769*24.*$in*42.*$in] $confinedConcCB

#Steel diagonal reinforcement fiber
fiber 0 0 [expr 12.*$Adb10] $SteelMatTag
}

# COUPLING BEAM 24x42 (10-14)
set CB24x42_2 $secTag
incr secTag 1

set EcCB	$EcWall6;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcCB 	[expr $EcCB/(2.0*(1.0+$nuc))];							# Shear Modulus of Concrete
set J_CB 	[expr pow(24.*$in,4)*42.*$in*0.2125]

section Fiber $CB24x42_2 -GJ [expr $GcCB*$J_CB*$fGJ] {
#fiber $yLoc $zLoc $A $matTag

#Equivalent concrete fiber
fiber 0 0 [expr 0.769*24.*$in*42.*$in] $confinedConcCB

#Steel diagonal reinforcement fiber
fiber 0 0 [expr 12.*$Adb8] $SteelMatTag
}

# RIGID LINK SECTION --------------------------------------------------------------------------
set ARigid [expr 1e12];
set JRigid [expr 1e14];
set IyRigid [expr 1e14];
set IzRigid [expr 1e14];