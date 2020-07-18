        !COMPILER-GENERATED INTERFACE MODULE: Fri May 08 12:32:54 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE MOVE_SIG_H__genmod
          INTERFACE 
            SUBROUTINE MOVE_SIG_H(STRESS,NTENS,PORE,SIG)
              INTEGER(KIND=4) :: NTENS
              REAL(KIND=8) :: STRESS(NTENS)
              REAL(KIND=8) :: PORE
              REAL(KIND=8) :: SIG(6)
            END SUBROUTINE MOVE_SIG_H
          END INTERFACE 
        END MODULE MOVE_SIG_H__genmod
