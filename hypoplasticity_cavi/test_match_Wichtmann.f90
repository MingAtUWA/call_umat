function test_match_Wichtmann() result(res)
    use SandHypoplasticity
    implicit none
    
    integer::res
        
    ! 0 is undrained triaxial test
    ! 1 is drained triaxial test
    integer::loading_mode
    integer::inc_num
    ! strain increment
    real(8)::de
    ! initial void ratio
    real(8)::e0
    
    real(8)::stress(6), ddsdde(6, 6), dstran(6)
    integer::i

    loading_mode = 1 ! drained loading
    inc_num = 1000
    de = -0.10d0
    e0 = 0.9d0
    stress = (/-100.0d0, -100.0d0, -100.0d0, 0.0d0, 0.0d0, 0.0d0/)
    
    de = de / real(inc_num)
    
    call sandhypoplasticity_init(e0,                          &
            33.1d0, 4.0d6, 0.27d0, 0.677d0, 1.054d0, 1.212d0, &
            0.14d0, 2.5d0,                                    &
            2.2d0, 1.1d0, 1.0d-4, 0.1d0, 5.5d0,               &
            0.0d0, -1.0d10)
    
    ! integration time step
    dtime = 1.0
    statev(13) = 1.0
    
    ! start simulation
    open (unit = 10, file = "res_Wichtmann.csv")
    write (10, *) "strain, s11, s22, s33, q, p, e, pp"
    write (10, 100) 0.0d0, stress(1), stress(2), stress(3), &
            stress(1)-stress(3), (stress(1)+stress(2)+stress(3))/3.0, e0, &
            statev(8)
    
    ! Calculate initial tangential stiffness
    dstran = (/0.0d0, 0.0d0, 0.0d0, 0.0d0, 0.0d0, 0.0d0/)
    call sandhypoplasticity_integrate(stress, ddsdde, dstran)
    
    do i = 1, inc_num, 1
        
        if (loading_mode == 0) then
            
            dstran(1) = de
            dstran(2) = -0.5*de
            dstran(3) = dstran(2)
            
        else if (loading_mode == 1) then
            
            dstran(1) = de
            dstran(2) = -ddsdde(2, 1) * de / (ddsdde(2, 2) + ddsdde(2, 3))
            dstran(3) = -ddsdde(3, 1) * de / (ddsdde(3, 2) + ddsdde(3, 3))
            !print *, ddsdde(2, 2), ddsdde(2, 3), ddsdde(3, 2), ddsdde(3, 3)
            
        endif
        
        call sandhypoplasticity_integrate(stress, ddsdde, dstran)
        
        ! output result
        write (10, 100) i*de, stress(1), stress(2), stress(3), &
            stress(1)-stress(3), (stress(1)+stress(2)+stress(3))/3.0, statev(7), &
            statev(8)
        
    end do
    
    close(10)
    res = 0
    
100 format(E10.3, ", ", E10.3, ", ", E10.3, ", ", E10.3, ", ", E10.3, ", ", E10.3, ", ", E10.3, ", ", E10.3)
  
end function