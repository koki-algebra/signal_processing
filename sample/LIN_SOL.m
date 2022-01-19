function sol = LIN_SOL(A, b)
    # LU分解
    [L, U, P, _] = LU(A);
    
    b = P * b;
    c = LIN_SOL_L(L, b);
    sol = LIN_SOL_U(U, c);
end