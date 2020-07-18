        !COMPILER-GENERATED INTERFACE MODULE: Fri May 08 12:32:54 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE GET_TAN_H__genmod
          INTERFACE 
            SUBROUTINE GET_TAN_H(DEPS,SIG,Q,NASV,PARMS,NPARMS,MM,HH,LL, &
     &NN,ISTRAIN,ERROR)
              INTEGER(KIND=4) :: NPARMS
              INTEGER(KIND=4) :: NASV
              REAL(KIND=8) :: DEPS(6)
              REAL(KIND=8) :: SIG(6)
              REAL(KIND=8) :: Q(NASV)
              REAL(KIND=8) :: PARMS(NPARMS)
              REAL(KIND=8) :: MM(6,6)
              REAL(KIND=8) :: HH(NASV,6)
              REAL(KIND=8) :: LL(6,6)
              REAL(KIND=8) :: NN(6)
              INTEGER(KIND=4) :: ISTRAIN
              INTEGER(KIND=4) :: ERROR
            END SUBROUTINE GET_TAN_H
          END INTERFACE 
        END MODULE GET_TAN_H__genmod
