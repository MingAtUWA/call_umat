        !COMPILER-GENERATED INTERFACE MODULE: Fri May 08 12:32:54 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE CALC_STATEV_H__genmod
          INTERFACE 
            SUBROUTINE CALC_STATEV_H(STRESS,STATEV,PARMS,NPARMS,NASV,   &
     &NASVDIM,DEPS)
              INTEGER(KIND=4) :: NASVDIM
              INTEGER(KIND=4) :: NASV
              INTEGER(KIND=4) :: NPARMS
              REAL(KIND=8) :: STRESS(6)
              REAL(KIND=8) :: STATEV(NASVDIM)
              REAL(KIND=8) :: PARMS(NPARMS)
              REAL(KIND=8) :: DEPS(6)
            END SUBROUTINE CALC_STATEV_H
          END INTERFACE 
        END MODULE CALC_STATEV_H__genmod
