        !COMPILER-GENERATED INTERFACE MODULE: Fri May 08 12:32:54 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE NORM_RES_H__genmod
          INTERFACE 
            SUBROUTINE NORM_RES_H(Y_TIL,Y_HAT,NY,NASV,NORM_R)
              INTEGER(KIND=4) :: NASV
              INTEGER(KIND=4) :: NY
              REAL(KIND=8) :: Y_TIL(NY)
              REAL(KIND=8) :: Y_HAT(NY)
              REAL(KIND=8) :: NORM_R
            END SUBROUTINE NORM_RES_H
          END INTERFACE 
        END MODULE NORM_RES_H__genmod
