        !COMPILER-GENERATED INTERFACE MODULE: Fri May 08 12:32:54 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PERTURBATE_H__genmod
          INTERFACE 
            SUBROUTINE PERTURBATE_H(Y_N,Y_NP1,N,NASV,DTSUB,ERR_TOL,     &
     &MAXNINT,DTMIN,DEPS_NP1,PARMS,NPARMS,NFEV,ELPRSW,THETA,NTENS,DD,   &
     &DTIME,ERROR)
              INTEGER(KIND=4) :: NPARMS
              INTEGER(KIND=4) :: NASV
              INTEGER(KIND=4) :: N
              REAL(KIND=8) :: Y_N(N)
              REAL(KIND=8) :: Y_NP1(N)
              REAL(KIND=8) :: DTSUB
              REAL(KIND=8) :: ERR_TOL
              INTEGER(KIND=4) :: MAXNINT
              REAL(KIND=8) :: DTMIN
              REAL(KIND=8) :: DEPS_NP1(6)
              REAL(KIND=8) :: PARMS(NPARMS)
              INTEGER(KIND=4) :: NFEV
              LOGICAL(KIND=4) :: ELPRSW
              REAL(KIND=8) :: THETA
              INTEGER(KIND=4) :: NTENS
              REAL(KIND=8) :: DD(6,6)
              REAL(KIND=8) :: DTIME
              INTEGER(KIND=4) :: ERROR
            END SUBROUTINE PERTURBATE_H
          END INTERFACE 
        END MODULE PERTURBATE_H__genmod
