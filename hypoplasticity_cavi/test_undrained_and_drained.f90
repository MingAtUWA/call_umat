function test_undrained_and_drained() result(res) 
    use SandHypoplasticity
    
    implicit none
    
    integer::res
    real(8)::stress(6), ddsdde(6, 6), dstran(6)
    integer::i
    
    integer::inc_num = 1000
    ! strain increment
    real(8)::de = -0.1 / 1000
    ! initial void ratio
    real(8)::e0
    ! 0 is undrained triaxial test
    ! 1 is drained triaxial test
    integer::loading_mode
    
    ! init model parameters
    loading_mode = 1
    ! initial void ratio
    e0 = 0.6
    ! initial stress
    stress = (/-0.3d6, -0.3d6, -0.3d6, 0.0d0, 0.0d0, 0.0d0/)
    
    call sandhypoplasticity_init(e0,                                      &
            33.0d0, 1.0d9, 0.25d0, 0.55d0, 0.95d0, 1.05d0, 0.25d0, 1.5d0, &
            5.0d0, 2.0d0, 1.0d-4, 0.5d0, 6.0d0,                           &
            0.0d0, -1.0d10)
    
    ! integration time step
    dtime = 1.0
    statev(13) = 1.0
    
    ! start simulation
    open (unit = 10, file = "res.csv")
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