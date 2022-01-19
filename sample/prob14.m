# データ読み込み
mix1 = load( 'MIX1.txt' );
mix2 = load( 'MIX2.txt' );

## 白色化

# 観測データ行列
X = [mix1 mix2]';

# 分散共分散行列
G = X * X' / size(X, 2);

# 分散共分散行列の固有値・固有ベクトルを計算
[P, L] = eig(G);
[B, I] = sort(diag(L), "descend");
P = P(:, I);
L = diag(B);

# 変換行列を計算
T = diag(1 ./ sqrt(diag(L))) * P';

# 観測データを変換
Z = T * X;

# Kurtosis の絶対値を最大にするような θ を探索
max_kurt = 0;
max_theta = 0;
for theta = 0:0.05:pi
    # 回転行列を作成
    R = [cos(theta), -sin(theta); sin(theta), cos(theta)];
    
    # データ Z を回転
    Y = R * Z;
    
    # 1行目だけを取り出す
    data = Y(1, :);
    
    # data の Kurtosis の絶対値を計算
    tau = size(data, 2);
    mu = mean(data);
    numerator = 0;  # 分子
    denominator = 0;  # 分母
    for t = 1:tau
        numerator += (Y(t) - mu)^4;
        denominator += (Y(t) - mu)^2;
    end
    numerator /= tau;
    denominator =  (denominator / tau)^2;
    kurt = abs(numerator / denominator - 3);

    # max_kurt より大きければ max_kurt と max_theta を更新
    if (max_kurt < kurt)
        max_kurt = kurt;
        max_theta = theta;
    end
end

# max_theta を用いた回転行列をかける
R = [cos(max_theta) -sin(max_theta) ; sin(max_theta) cos(max_theta)];
Y = R * Z;

# 以下、音を聞いてみる。(pause は一次停止。何かのキーを押せば進む)
sound( mix1/max(abs(mix1)), 44100 );
pause;
sound( mix2/max(abs(mix2)), 44100 );
pause;
sound( Y(1,:)/max(abs(Y(1,:))), 44100 );
pause;
sound( Y(2,:)/max(abs(Y(2,:))), 44100 );
