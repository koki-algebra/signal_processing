function [P, c, a] = PCA(data)
    % データサイズ取得
    [n, d] = size(data);
    % 分散共分散行列算出
    cov_mat = cov(data);
    
    % スペクトル分解
    [P, L] = EIG(cov_mat);

    % 寄与率算出
    c = zeros(d, 1);
    for i = 1:d
        c(i) = L(i, i) / trace(L);
    end

    % 累積寄与率算出
    a = zeros(d, 1);
    for i = 1:d
        for k = 1:i
            a(i) += c(k);
        end
    end
end