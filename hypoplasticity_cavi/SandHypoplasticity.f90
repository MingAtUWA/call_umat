module Sandhypoplasticity
    implicit none
    
    ! nprop: number of material properties
    integer, parameter::nprops = 17
    ! props: material properties
    real(8)::props(nprops)
    data props /0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, &
                0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0/
    
    ! nstatv: number of state variables
    integer, parameter::nstatv = 13
    ! statev: statev variables
    ! statev(7): void ratio
    real(8)::statev(nstatv)
    data statev /0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, &
                 0.0, 0.0, 0.0, 0.0, 0.0/
    
    ! variables not used
    ! ndi: number of direct stress components
    integer, parameter::ndi = 3
    ! nshr: number of shear stress components
    integer, parameter::nshr = 3
    ! ntens = ndi + nshr: size of stress or strain components
    integer, parameter::ntens = 6
    ! total strain
    real(8)::stran(ntens)
    data stran /0.0, 0.0, 0.0, 0.0, 0.0, 0.0/
    !cmname: user-defined material name
    character(len=80)::cmname = 'SandHypoplasticity'
    ! sse: specific elastic strain energy
    real(8)::sse = 0.0
    ! spd: plastic dissipation
    real(8)::spd = 0.0
    ! scd: ¡°creep¡± dissipation
    real(8)::scd = 0.0
    ! ddsddt(ntens): variation of the stress increments with respect to the temperature.
    real(8)::ddsddt(ntens)
    data ddsddt /0.0, 0.0, 0.0, 0.0, 0.0, 0.0/
    ! rpl: volumetric heat generation per unit time by mechanical working of the material
    real(8)::rpl = 0.0
    ! drpldt: variation of rpl with respect to temperature
    real(8)::drpldt = 0.0
    !drplde(ntens): variation of RPL with respect to strain increments
    real(8)::drplde(ntens)
    data drplde /0.0, 0.0, 0.0, 0.0, 0.0, 0.0/
    ! temp: temperature at start of increment
    real(8)::temp = 0.0
    ! dtemp: increment of temperature
    real(8)::dtemp = 0.0
    ! celent: characteristic element length
    real(8)::celent = 0.0
    ! predef: predefined field interpolated from nodes at the start of the increment
    real(8)::predef(1)
    data predef /0.0/
    ! dpred: increments of predefined field
    real(8)::dpred(1)
    data dpred /0.0/
    ! coords: coordinates of this point
    real(8)::coords(3)
    data coords /0.0, 0.0, 0.0/
    ! drot(3,3): increment of rigid body rotation
    real(8)::drot(3, 3)
    data drot /0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0/
    ! dfgrd0(3,3): deformation gradient at the beginning of this increment
    real(8)::dfgrd0(3, 3)
    data dfgrd0 /0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0/
    ! dfgrd1(3,3): deformation gradient at the end of the increment
    real(8)::dfgrd1(3, 3)
    data dfgrd1 /0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0/
    ! noel: element number
    integer::noel = 0
    ! npt: integration point number
    integer::npt = 0
    ! layer: layer number (for composite shells and layered solids)
    integer::layer = 0
    ! kspt: section point number within current layer
    integer::kspt = 0
    ! time(2): 1. step time at the beginning of current increment
    !          2. total time at the beginning of current increment
    real(8)::time(2)
    data time /0.0, 0.0/
    ! dtime: time increment
    real(8)::dtime = 0.0
    ! pnewdt: ratio of suggested new time increment, new dt = pnewdt * dtime
    real(8)::pnewdt = 0.0
    ! kstep: step number
    integer::kstep = 0
    ! kinc: increment number
    integer::kinc = 0
    
contains
    ! init sand hypoplasticity parameters
    subroutine sandhypoplasticity_init(e,                         &
                    fric_ang, hs, en, ed0, ec0, ei0, alpha, beta, &
                    m_R, m_T, R, beta_r, chi,                     &
                    bulk_w, cavi_pore)
        implicit none
        
        real(8)::e
        real(8)::fric_ang, hs, en, ed0, ec0, ei0, alpha, beta
        real(8)::m_R, m_T, R, beta_r, chi
        real(8)::bulk_w, cavi_pore
        
        !initial void ratio
        props(16) = e
        
        ! hypoplasticity parameters
        props(1) = fric_ang
        props(3) = hs
        props(4) = en
        props(5) = ed0
        props(6) = ec0
        props(7) = ei0
        props(8) = alpha
        props(9) = beta
        
        ! intergranular parameters
        props(10) = m_R
        props(11) = m_T
        props(12) = R ! maximum intergranular strain
        props(13) = beta_r
        props(14) = chi
        
        ! pore fluid parameters
        props(2) = 0.0  ! initial hydrostatic pore pressure
        props(15) = bulk_w ! bulk modulus of pore fluid        
        props(17) = cavi_pore ! pore pressure that triggers cavitation
        ! props(16) is initial void ratio, this arragement is a legacy issue
        
    end subroutine sandhypoplasticity_init
    
    ! wrapper of umat_hypo() subroutines
    subroutine sandhypoplasticity_integrate(stress, ddsdde, dstran)
        implicit none
        
        ! stress
        real(8), intent(inout)::stress(ntens)
        ! ddsdde: tangential stiffness matrix
        real(8), intent(out)::ddsdde(ntens, ntens)
        ! strain increment
        real(8), intent(in)::dstran(ntens)
        
        call umat_hypoplasticity(stress, statev, ddsdde,    &
                sse, spd, scd, rpl, ddsddt, drplde, drpldt, &
                stran, dstran, time, dtime,                 &
                temp, dtemp, predef, dpred, cmname,         &
                ndi, nshr, ntens, nstatv, props, nprops,    &
                coords, drot, pnewdt,                       &
                celent, dfgrd0, dfgrd1, noel, npt, layer,   &
                kspt, kstep, kinc)
        
        !call umat_hypoplasticity_cavitation(                &
        !        stress, statev, ddsdde,                     &
        !        sse, spd, scd, rpl, ddsddt, drplde, drpldt, &
        !        stran, dstran, time, dtime,                 &
        !        temp, dtemp, predef, dpred, cmname,         &
        !        ndi, nshr, ntens, nstatv, props, nprops,    &
        !        coords, drot, pnewdt,                       &
        !        celent, dfgrd0, dfgrd1, noel, npt, layer,   &
        !        kspt, kstep, kinc)
        
    end subroutine sandhypoplasticity_integrate

end module SandHypoplasticity
