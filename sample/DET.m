function ret = DET(A)
    product = 1;
    [_, U, _, sg] = LU(A);
    r = size(U);

    # 総乗を計算
    for i = 1:r
        product *= U(i, i);
    end
    
    ret = sg * product;
    return
end