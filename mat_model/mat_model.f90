subroutine pythagoras(a, b, c)
    !DEC$ ATTRIBUTES DLLEXPORT::pythagoras
    
    implicit none

    real(4) a [value]
    real(4) b [value]
    real(4) c [reference]
    
    c = sqrt(a*a + b*b)
    write(*, *) "Mixed calls subroutines!"
    
end subroutine pythagoras

integer(4) function fact(n)
    !DEC$ ATTRIBUTES DLLEXPORT::fact
    
    implicit none
    
    integer(4) n [value]
    integer(4) i, amt
    amt = 1
    do i = 1, n
        amt = amt * i
    enddo
    fact = amt
    write(*, *) "Mixed calls function!"
    
end
