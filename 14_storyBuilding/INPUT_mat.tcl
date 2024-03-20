
# ##############################################################################################################################################################################################
# ######################################################################  UNCONFINED CONCRETE  #################################################################################################
# ##############################################################################################################################################################################################

set lambda 0.1
set fcuFactor 0.2;	# Percentage of f'c considered for residual strength
set matTag 1


set EcWall6	[expr 33000.*pow(0.140 + 7.8/1000,1.5)*sqrt(7.8)*$ksi];

# 6 ksi
set unconfinedConc6 $matTag;
incr matTag 1
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets
	
set fpc		[expr 7.8*$ksi];										# Unconfined Concrete Strength
set EcWall	$EcWall6;	# Young's Modulus of Concrete
set epsc	[expr 2.*$fpc/$EcWall];									# Concrete strength at maximum strength
set fpcu	[expr $fcuFactor*$fpc];									# Concrete crushing strength
set fr		[expr 5.7*sqrt(7800.)*$psi];							# Concrete tensile strength
set ecr6	[expr $fr/$EcWall6];									# Cracking strain

set epscu	0.006;													# Concrete strain at crushing strength
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete
set Ets		[expr $EcWall*0.1];										# Tension softening stiffness

uniaxialMaterial Concrete02 $unconfinedConc6 -$fpc -$epsc -$fpcu -$epscu $lambda $fr $Ets

# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Columns 12, 16, 20
set confinedConcCol12_20 $matTag;
incr matTag 1
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets
	
set fpc		[expr 7.8*$ksi];										# Unconfined Concrete Strength
set fpcc	[expr 9.41*$ksi];
set EcWall	$EcWall6;	# Young's Modulus of Concrete
set epsc	[expr 2.*$fpcc/$EcWall];								# Concrete strength at maximum strength
set fpcu	[expr $fcuFactor*$fpcc];								# Concrete crushing strength
set fr		[expr 5.7*sqrt(7800.)*$psi];							# Concrete tensile strength

set epscu	0.0079;													# Concrete strain at crushing strength
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete
set Ets		[expr $EcWall*0.1];										# Tension softening stiffness

uniaxialMaterial Concrete02 $confinedConcCol12_20 -$fpcc -$epsc -$fpcu -$epscu $lambda $fr $Ets

# ##############################################################################################################################################################################################
# #################################################################################	BEAM CONCRETE  #############################################################################################
# ##############################################################################################################################################################################################

# CB confined concrete
set confinedConcCB $matTag;
incr matTag 1
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets
	
set fpc		[expr 7.8*$ksi];										# Unconfined Concrete Strength
set fpcc	[expr 10.29*$ksi];
set EcWall	$EcWall6;												# Young's Modulus of Concrete
set epsc	[expr 2.*$fpcc/$EcWall];								# Concrete strength at maximum strength
#set epsc	0.0065;													# Concrete strength at maximum strength
set fpcu	[expr $fcuFactor*$fpcc];								# Concrete crushing strength
set fr		[expr 311.3*$psi];										# Concrete tensile strength

set epscu	0.0107;													# Concrete strain at crushing strength
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete
set Ets		[expr $EcWall*0.1];										# Tension softening stiffness

uniaxialMaterial Concrete02 $confinedConcCB -$fpcc -$epsc -$fpcu -$epscu $lambda $fr $Ets

# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# ##############################################################################################################################################################################################
# #################################################################################### STEEL ###################################################################################################
# ##############################################################################################################################################################################################
set SteelMatTag $matTag
incr matTag 1

set Fy	[expr 69.*$ksi];		# Expected yield strength
set Es	[expr 29000.*$ksi];		# Steel Young's modulus
set b 	0.012;					# Strain hardening ratio
set R0	20.;
set cR1	0.9;
set cR2	0.05;

set a1 0.039;
set a2 0.029;
set a3 0.0;
set a4 1.0;

# uniaxialMaterial Steel02 $matTag $Fy $E $b $R0 $cR1 $cR2 <$a1 $a2 $a3 $a4 $sigInit>
uniaxialMaterial Steel02 $SteelMatTag $Fy $Es $b $R0 $cR1 $cR2 $a1 $a2 $a3 $a4

set SteelMatTagCB $SteelMatTag;

# ##############################################################################################################################################################################################
# #################################################################################### ELASTIC #################################################################################################
# ##############################################################################################################################################################################################

set rigidMat $matTag
incr matTag 1

set elasticE 1e10

uniaxialMaterial Elastic $rigidMat $elasticE


set entMat $matTag
incr matTag 1

uniaxialMaterial ENT $entMat $elasticE