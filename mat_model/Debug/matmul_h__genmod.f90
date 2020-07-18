        !COMPILER-GENERATED INTERFACE MODULE: Fri May 08 12:32:54 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE MATMUL_H__genmod
          INTERFACE 
            SUBROUTINE MATMUL_H(A,B,C,L,M,N)
              INTEGER(KIND=4) :: N
              INTEGER(KIND=4) :: M
              INTEGER(KIND=4) :: L
              REAL(KIND=8) :: A(L,M)
              REAL(KIND=8) :: B(M,N)
              REAL(KIND=8) :: C(L,N)
            END SUBROUTINE MATMUL_H
          END INTERFACE 
        END MODULE MATMUL_H__genmod
