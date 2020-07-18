        !COMPILER-GENERATED INTERFACE MODULE: Fri May 08 12:32:54 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE CHECK_PARMS_H__genmod
          INTERFACE 
            SUBROUTINE CHECK_PARMS_H(PROPS,NPROPS,PARMS,NPARMS,ERROR)
              INTEGER(KIND=4) :: NPROPS
              REAL(KIND=8) :: PROPS(NPROPS)
              REAL(KIND=8) :: PARMS(NPROPS)
              INTEGER(KIND=4) :: NPARMS
              INTEGER(KIND=4) :: ERROR
            END SUBROUTINE CHECK_PARMS_H
          END INTERFACE 
        END MODULE CHECK_PARMS_H__genmod
