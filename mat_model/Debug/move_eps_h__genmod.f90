        !COMPILER-GENERATED INTERFACE MODULE: Fri May 08 12:32:54 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE MOVE_EPS_H__genmod
          INTERFACE 
            SUBROUTINE MOVE_EPS_H(DSTRAN,NTENS,DEPS,DEPSV)
              INTEGER(KIND=4) :: NTENS
              REAL(KIND=8) :: DSTRAN(NTENS)
              REAL(KIND=8) :: DEPS(6)
              REAL(KIND=8) :: DEPSV
            END SUBROUTINE MOVE_EPS_H
          END INTERFACE 
        END MODULE MOVE_EPS_H__genmod
