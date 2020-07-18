        !COMPILER-GENERATED INTERFACE MODULE: Fri May 08 12:32:54 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE GET_F_SIG_Q_H__genmod
          INTERFACE 
            SUBROUTINE GET_F_SIG_Q_H(SIG,Q,NASV,PARMS,NPARMS,DEPS,F_SIG,&
     &F_Q,ERROR)
              INTEGER(KIND=4) :: NPARMS
              INTEGER(KIND=4) :: NASV
              REAL(KIND=8) :: SIG(6)
              REAL(KIND=8) :: Q(NASV)
              REAL(KIND=8) :: PARMS(NPARMS)
              REAL(KIND=8) :: DEPS(6)
              REAL(KIND=8) :: F_SIG(6)
              REAL(KIND=8) :: F_Q(NASV)
              INTEGER(KIND=4) :: ERROR
            END SUBROUTINE GET_F_SIG_Q_H
          END INTERFACE 
        END MODULE GET_F_SIG_Q_H__genmod
