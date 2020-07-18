        !COMPILER-GENERATED INTERFACE MODULE: Fri May 08 12:32:53 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SAND_HYPOPLASTICITY_INTEGRATION__genmod
          INTERFACE 
            SUBROUTINE SAND_HYPOPLASTICITY_INTEGRATION(STRESS,DDSDDE,   &
     &STATEV,DSTRAN,PROPS)
              REAL(KIND=8), INTENT(INOUT) :: STRESS(6)
              REAL(KIND=8), INTENT(OUT) :: DDSDDE(6,6)
              REAL(KIND=8), INTENT(INOUT) :: STATEV(13)
              REAL(KIND=8), INTENT(IN) :: DSTRAN(6)
              REAL(KIND=8), INTENT(IN) :: PROPS(16)
            END SUBROUTINE SAND_HYPOPLASTICITY_INTEGRATION
          END INTERFACE 
        END MODULE SAND_HYPOPLASTICITY_INTEGRATION__genmod
