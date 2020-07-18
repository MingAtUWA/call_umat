        !COMPILER-GENERATED INTERFACE MODULE: Fri May 08 12:32:54 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE WRISTA_H__genmod
          INTERFACE 
            SUBROUTINE WRISTA_H(MODE,Y,NYDIM,DEPS_NP1,DTIME,COORDS,     &
     &STATEV,NSTATV,PARMS,NPARMS,NOEL,NPT,NDI,NSHR,KSTEP,KINC)
              INTEGER(KIND=4) :: NPARMS
              INTEGER(KIND=4) :: NSTATV
              INTEGER(KIND=4) :: NYDIM
              INTEGER(KIND=4) :: MODE
              REAL(KIND=8) :: Y(NYDIM)
              REAL(KIND=8) :: DEPS_NP1(6)
              REAL(KIND=8) :: DTIME
              REAL(KIND=8) :: COORDS(3)
              REAL(KIND=8) :: STATEV(NSTATV)
              REAL(KIND=8) :: PARMS(NPARMS)
              INTEGER(KIND=4) :: NOEL
              INTEGER(KIND=4) :: NPT
              INTEGER(KIND=4) :: NDI
              INTEGER(KIND=4) :: NSHR
              INTEGER(KIND=4) :: KSTEP
              INTEGER(KIND=4) :: KINC
            END SUBROUTINE WRISTA_H
          END INTERFACE 
        END MODULE WRISTA_H__genmod
