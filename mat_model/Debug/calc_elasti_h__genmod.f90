        !COMPILER-GENERATED INTERFACE MODULE: Fri May 08 12:32:54 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE CALC_ELASTI_H__genmod
          INTERFACE 
            SUBROUTINE CALC_ELASTI_H(Y,N,NASV,DTSUB,ERR_TOL,MAXNINT,    &
     &DTMIN,DEPS_NP1,PARMS,NPARMS,NFEV,ELPRSW,DTIME,DDTAN,YOUNGEL,NUEL, &
     &ERROR)
              INTEGER(KIND=4) :: NPARMS
              INTEGER(KIND=4) :: N
              REAL(KIND=8) :: Y(N)
              INTEGER(KIND=4) :: NASV
              REAL(KIND=8) :: DTSUB
              REAL(KIND=8) :: ERR_TOL
              INTEGER(KIND=4) :: MAXNINT
              REAL(KIND=8) :: DTMIN
              REAL(KIND=8) :: DEPS_NP1(6)
              REAL(KIND=8) :: PARMS(NPARMS)
              INTEGER(KIND=4) :: NFEV
              LOGICAL(KIND=4) :: ELPRSW
              REAL(KIND=8) :: DTIME
              REAL(KIND=8) :: DDTAN(6,6)
              REAL(KIND=8) :: YOUNGEL
              REAL(KIND=8) :: NUEL
              INTEGER(KIND=4) :: ERROR
            END SUBROUTINE CALC_ELASTI_H
          END INTERFACE 
        END MODULE CALC_ELASTI_H__genmod
