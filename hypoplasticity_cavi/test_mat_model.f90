program test_mat_model
    implicit none
    
    integer::res
    integer::test_undrained_and_drained
    integer::test_match_Wichtmann
    
    res = test_undrained_and_drained()
    !res = test_match_Wichtmann()
    
    !pause
end program