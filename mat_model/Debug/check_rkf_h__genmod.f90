        !COMPILER-GENERATED INTERFACE MODULE: Fri May 08 12:32:54 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE CHECK_RKF_H__genmod
          INTERFACE 
            SUBROUTINE CHECK_RKF_H(ERROR_RKF,Y,NY,NASV,PARMS,NPARMS)
              INTEGER(KIND=4) :: NPARMS
              INTEGER(KIND=4) :: NY
              INTEGER(KIND=4) :: ERROR_RKF
              REAL(KIND=8) :: Y(NY)
              INTEGER(KIND=4) :: NASV
              REAL(KIND=8) :: PARMS(NPARMS)
            END SUBROUTINE CHECK_RKF_H
          END INTERFACE 
        END MODULE CHECK_RKF_H__genmod
