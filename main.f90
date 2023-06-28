program main
    use commonvars
    implicit none

    integer :: m,n,k

    m=40; n=120, k=120

    allocate(matrixA(m,n), matrixB(n,k), matrixC(m,k))

    matrixA = 1._8
    matrixB = 2._8

    call dgemm('n', 'n', m, n, k, 1._8, matrixA, m, matrixB, n, 1._8, matrixC, m)
    
end program main