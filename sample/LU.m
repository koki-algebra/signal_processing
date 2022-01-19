function [L, U, P, sg] = LU(A)
    # 行列Aの行数と列数取得
    [r, c] = size(A);

    # 行列初期化
    L = zeros(r, r);
    U = A;
    P = eye(r, r);
    
    # 行交換回数初期化
    count = 0;
    sg = 1;

    for i = 1:r-1
        if (U(i, i) == 0)
            # 0 でない要素を探し、行交換
            for j = i+1:r
                if (U(j, i) != 0)
                    # 行列Uの行交換
                    tmp = U(j, :);
                    U(j, :) = U(i, :);
                    U(i, :) = tmp;
                    
                    # 行列Lの交換
                    tmp = L(j, :);
                    L (j, :) = L(i, :);
                    L(i, :) = tmp;
                    
                    # 行列Pの行交換
                    tmp = P(j, :);
                    P(j, :) = P(i, :);
                    P(i, :) = tmp;

                    # 交換回数をインクリメント
                    count++;
                    break;
                end
            end
        end
        
        pivot = U(i, i);
        # 停止条件
        if (abs(pivot) < 0.0000000000000001)
            break;
        end

        for j = i+1:r
            L(j, i) = U(j, i) / pivot;
            U(j, :) = U(j, :) - L(j, i) * U(i, :);
        end
    end
    
    # sg 算出
    if (mod(count, 2) == 0)
        sg = 1;
    else
        sg = -1;
    end
    # 行列Lの対角成分を1にする。
    for j = 1:r
        L(j, j) = 1;
    end
end